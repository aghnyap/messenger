import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:protobuf/protobuf.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageBloc<Event, State, T extends ProtobufEnum>
    extends Bloc<Event, State> with MessageHandler<T> {
  MessageBloc(
    MessageBus<T> messageBus, {
    required State initialState,
    required List<T> incomingChannels,
    required T outgoingChannel,
    bool Function(Message)? filter,
  }) : super(initialState) {
    initializeMessageHandler(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
      filter: filter ?? (_) => true,
    );
  }

  @override
  Future<void> close() async {
    await dispose();
    return super.close();
  }
}
