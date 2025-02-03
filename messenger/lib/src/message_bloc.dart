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
    _stateSubject = BehaviorSubject<State>.seeded(initialState);

    init(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
    );

    subscription =
        messageStream.switchMap(mapToState).listen(_stateSubject.add);
  }

  late final BehaviorSubject<State> _stateSubject;

  @override
  State get state => _stateSubject.value;

  @override
  Stream<State> get stream => _stateSubject.stream;

  Stream<State> mapToState(Message message);

  @override
  void dispose() {
    _stateSubject.close();
    super.close();
    super.dispose();
  }
}
