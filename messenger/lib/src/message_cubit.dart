import 'dart:async';

import 'package:bloc/bloc.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageCubit<State, Channel> extends Cubit<State>
    with MessageHandler<Channel> {
  MessageCubit(
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
