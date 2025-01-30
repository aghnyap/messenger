import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageService<Channel> extends MessageHandler<Channel> {
  MessageService(
    MessageBus<Message, Channel> messageBus, {
    required List<Channel> incomingChannels,
    required Channel outgoingChannel,
    bool Function(Message)? filter,
  }) : super() {
    initializeMessageHandler(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
      filter: filter ?? (_) => true,
    );
  }
}
