import 'dart:async';

import 'package:bloc/bloc.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageCubit<State> extends Cubit<State> with MessageHandler {
  MessageCubit(
    MessageBus<Message> messageBus, {
    required State initialState,
    required List<String> incomingChannels,
    required String outgoingChannel,
  }) : super(initialState) {
    initializeMessageHandler(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
      filter: (message) => message.hasResponse() || message.hasBroadcast(),
    );
  }

  @override
  Future<void> close() async {
    await dispose();
    return super.close();
  }
}
