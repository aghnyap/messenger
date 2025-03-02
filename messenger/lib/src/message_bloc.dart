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
  }

  State mapToState(Message message) {
    throw UnimplementedError();
  }

  Message mapFromEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Stream<State> get stream => Rx.merge(<Stream<State>>[
        super.stream,
        // messageStream.map(mapMessageToState),
      ]).distinct();
}
