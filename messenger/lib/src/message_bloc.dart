import 'dart:async';

import 'package:bloc/bloc.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageBloc<Event, State> extends Bloc<Event, State>
    with MessageHandler {
  MessageBloc(
    MessageBus<Message> messageBus, {
    required State initialState,
    required List<String> incomingChannels,
    required String outgoingChannel,
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
