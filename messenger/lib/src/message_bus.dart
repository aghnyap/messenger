import 'package:logging/logging.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';

typedef MessageSubject = BehaviorSubject<Message>;

final class MessageBus<T extends ProtobufEnum> {
  factory MessageBus() =>
      _instances.putIfAbsent(T, MessageBus<T>._internal) as MessageBus<T>;

  MessageBus._internal() {
    _logger = Logger(runtimeType.toString());
  }

  static final Map<Type, MessageBus<ProtobufEnum>> _instances =
      <Type, MessageBus<ProtobufEnum>>{};

  late final Logger _logger;

  final Map<T, MessageSubject> _channels = <T, MessageSubject>{};

  Stream<E> receive<E extends Message>(T channel) {
    _channels.putIfAbsent(channel, BehaviorSubject<E>.new);

    return _channels[channel]!
        .stream
        .where((Message message) => message is E)
        .cast<E>();
  }

  void dispatch<E extends Message>(T channel, E message) {
    _channels.putIfAbsent(channel, BehaviorSubject<E>.new);

    try {
      _channels[channel]!.add(message);
    } on Exception catch (error) {
      _logger.severe('Error dispatching message on [$channel]:\n$error');
    }
  }

  Future<void> dispose() async {
    await Future.wait(
      _channels.entries
          .map((MapEntry<T, MessageSubject> entry) => entry.value.close()),
    );
    _channels.clear();
  }

  Future<void> disposeChannel(T channel) async {
    await _channels[channel]?.close();
    _channels.remove(channel);
  }
}
