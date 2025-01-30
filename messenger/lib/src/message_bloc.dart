import 'dart:async';

import 'package:bloc/bloc.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageBloc<Event, State, Channel> extends Bloc<Event, State>
    with MessageHandler<Channel> {
  MessageBloc(
    MessageBus<Message, Channel> messageBus, {
    required State initialState,
    required List<Channel> incomingChannels,
    required Channel outgoingChannel,
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
