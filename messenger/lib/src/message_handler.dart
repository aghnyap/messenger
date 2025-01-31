import 'dart:async';

import 'package:logging/logging.dart';
import 'package:messenger/generated/google/protobuf/timestamp.pb.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../generated/message.pb.dart';
import '../messenger.dart';

abstract mixin class MessageHandler<T extends ProtobufEnum> {
  late final Logger logger;

  late final MessageBus<T> _messageBus;
  late final String _sourceId;
  late final T _outgoingChannel;

  late final StreamSubscription<Message> _subscription;

  void initializeMessageHandler(
    MessageBus<T> messageBus, {
    required List<T> incomingChannels,
    required T outgoingChannel,
    required bool Function(Message) filter,
  }) {
    logger = Logger(runtimeType.toString());

    _messageBus = messageBus;
    _sourceId = Uuid().v4();
    _outgoingChannel = outgoingChannel;

    var channelStreams = incomingChannels
        .map((channel) => messageBus
            .receive<Message>(channel)
            .where((message) => message.sourceId != _sourceId)
            .where(filter))
        .toList();

    logger.info('Starting stream on channels: $incomingChannels');

    _subscription = Rx.merge(channelStreams).doOnData(handle).listen(
      (message) {
        logger.info('Received message on [${message.channel}]:\n$message');
      },
      onError: (error) {
        logger.severe('Subscription error: $error');
      },
      onDone: () {
        logger.warning('Subscription closed.');
      },
    );
  }

  void handle(Message message);

  void dispatch(Message message) {
    logger.info('Sending message to [$_outgoingChannel]:\n$message');

    _messageBus.dispatch(
      _outgoingChannel,
      message
        ..sourceId = _sourceId
        ..channel = _outgoingChannel.name
        ..timestamp = Timestamp.fromDateTime(DateTime.now()),
    );
  }

  Future<void> dispose() async {
    await _subscription.cancel();
    logger.warning('Closing ...');
  }
}
