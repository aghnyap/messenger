import 'package:protobuf/protobuf.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageService<T extends ProtobufEnum>
    extends MessageHandler<T> {
  MessageService(
    MessageBus<T> messageBus, {
    required List<T> incomingChannels,
    required T outgoingChannel,
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
