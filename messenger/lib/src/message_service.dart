import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageService extends MessageHandler {
  MessageService(
    MessageBus<Message> messageBus, {
    required List<String> incomingChannels,
    required String outgoingChannel,
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
