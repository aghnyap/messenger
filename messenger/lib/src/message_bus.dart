import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';

final class MessageBus<T extends Message> {
  static final Map<Type, MessageBus> _instances = {};

  factory MessageBus() {
    return _instances.putIfAbsent(T, () => MessageBus<T>._internal())
        as MessageBus<T>;
  }

  MessageBus._internal() {
    _logger = Logger(runtimeType.toString());
  }

  late final Logger _logger;

  final Map<String, BehaviorSubject<T>> _channels = {};

  Stream<E> receive<E extends T>(String channel) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<T>();
    });

    return _channels[channel]!
        .stream
        .where((message) => message is E)
        .cast<E>()
        .distinct()
        .doOnData((message) =>
            _logger.fine('Stream data on channel [$channel]:\n$message'))
        .handleError((error) =>
            _logger.severe('Stream error on channel [$channel]:\n$error'));
  }

  void dispatch(String channel, T message) {
    _channels.putIfAbsent(channel, () {
      _logger.info('Creating new channel [$channel]');
      return BehaviorSubject<T>();
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
