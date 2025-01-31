import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:protobuf/protobuf.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageCubit<State, T extends ProtobufEnum> extends Cubit<State>
    with MessageHandler<T> {
  MessageCubit(
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
