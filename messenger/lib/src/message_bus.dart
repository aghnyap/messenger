import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';

final class MessageBus<T extends ProtobufEnum> {
  static final Map<Type, MessageBus> _instances = {};

  factory MessageBus() {
    return _instances.putIfAbsent(T, () => MessageBus<T>._internal())
        as MessageBus<T>;
  }

  MessageBus._internal() {
    _logger = Logger(runtimeType.toString());
  }

  late final Logger _logger;

  final Map<T, BehaviorSubject<(T, Message)>> _channels = {};

  Stream<(T, Message)> receive<U extends Message>(T channel) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<(T, Message)>();
    });

    return _channels[channel]!
        .stream
        .distinct()
        .where((event) => event is (T, U))
        .cast<(T, U)>()
        .where((event) => event.$1.name == event.$2.channel)
        .doOnData(_logOnData)
        .doOnError(_logOnError);
  }

  void _logOnError(Object error, StackTrace stackTrace) {
    _logger.severe('Streaming error on channel:\n$error');
  }

  void _logOnData((T, Message) event) {
    _logger.fine('Streaming data on channel [${event.$1}]:\n${event.$2}');
  }

  void dispatch(T channel, Message message) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<(T, Message)>();
    });

    try {
      _logger.info('Dispatching to channel [$channel]:\n$message');
      _channels[channel]!.add((channel, message));
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
