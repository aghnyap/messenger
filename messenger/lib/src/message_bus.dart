import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';

final class MessageBus<T extends ProtobufEnum> {
  static final Map<Type, MessageBus> _instances = {};

  factory MessageBus(T Function(String) parser) {
    return _instances.putIfAbsent(T, () => MessageBus<T>._internal(parser))
        as MessageBus<T>;
  }

  MessageBus._internal(this._parser) {
    _logger = Logger(runtimeType.toString());
  }

  late final Logger _logger;

  final Map<T, BehaviorSubject<Message>> _channels = {};
  final T Function(String) _parser;

  Stream<(T, E)> receive<E extends Message>(T channel) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<Message>();
    });

    return _channels[channel]!
        .stream
        .where((message) => message is E)
        .cast<E>()
        .map((message) => (_parser(message.channel), message))
        .distinct()
        .doOnData((pair) =>
            _logger.fine('Stream data on channel [${pair.$1}]:\n${pair.$2}'))
        .handleError((error) =>
            _logger.severe('Stream error on channel [$channel]:\n$error'));
  }

  void dispatch(T channel, Message message) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<Message>();
    });

    try {
      _logger.info('Dispatching to channel [$channel]:\n$message');
      _channels[channel]!.add(message);
    } on Exception catch (error) {
      _logger.severe('Error dispatching message: $error');
    }
  }

  Future<void> dispose() async {
    await Future.wait(_channels.entries.map((entry) => entry.value.close()));
    _channels.clear();
  }

  // BehaviorSubject maintains a reference to the last emitted item.
  // If channels are never removed, this can lead to excessive memory usage.
  void disposeChannel(String channel) {
    _channels[channel]?.close();
    _channels.remove(channel);
  }
}
