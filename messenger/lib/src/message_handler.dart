import 'dart:async';

import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

import '../generated/google/protobuf/timestamp.pb.dart';
import '../generated/message.pb.dart';
import '../messenger.dart';

abstract mixin class MessageHandler<T extends ProtobufEnum, S> {
  late final Logger logger;
  late final Stream<Message> messageStream;
  late final StreamSubscription<S> subscription;

  late final MessageBus<T> _messageBus;
  late final String _sourceId;
  late final T _outgoingChannel;

  void init(
    MessageBus<T> messageBus, {
    required List<T> incomingChannels,
    required T outgoingChannel,
  }) {
    logger = Logger(runtimeType.toString());

    _messageBus = messageBus;
    _sourceId = const Uuid().v4();
    _outgoingChannel = outgoingChannel;

    messageStream = Rx.merge(
      incomingChannels.map(
        (T channel) => messageBus
            .receive<Message>(channel)
            .where((Message message) => message.sourceId != _sourceId),
      ),
    ).share();
  }

  void dispatch(Message message) {
    _messageBus.dispatch<Message>(
      _outgoingChannel,
      message
        ..sourceId = _sourceId
        ..channelValue = _outgoingChannel.value
        ..channelName = _outgoingChannel.name
        ..timestamp = Timestamp.fromDateTime(DateTime.now()),
    );
  }

  void dispose() {
    subscription.cancel();
  }
}
