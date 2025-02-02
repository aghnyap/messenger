import 'package:bloc/bloc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageBloc<Event, State, T extends ProtobufEnum>
    extends Bloc<Event, State> with MessageHandler<T, State> {
  MessageBloc(
    MessageBus<T> messageBus, {
    required List<T> incomingChannels,
    required T outgoingChannel,
    required State initialState,
  }) : super(initialState) {
    init(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
    );

    _currentState = initialState;

    subscription = messageStream
        .switchMap(messageTransformer)
        .listen((State state) => _currentState = state);
  }

  late State _currentState;

  @override
  State get state => _currentState;

  @override
  Stream<State> get stream => messageStream.switchMap(messageTransformer);

  /// Must be implemented by subclasses to process messages
  Stream<State> messageTransformer(Message message);

  @override
  void dispose() {
    super.close();
    super.dispose();
  }
}
