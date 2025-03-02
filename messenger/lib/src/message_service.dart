import 'package:protobuf/protobuf.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/message.pb.dart';
import 'message_bus.dart';
import 'message_handler.dart';

abstract class MessageService<T extends ProtobufEnum>
    extends MessageHandler<T, Message> {
  MessageService(
    MessageBus<T> messageBus, {
    required List<T> incomingChannels,
    required T outgoingChannel,
  }) {
    init(
      messageBus,
      incomingChannels: incomingChannels,
      outgoingChannel: outgoingChannel,
    );

    subscription = messageStream.switchMap(transform).listen(dispatch);
  }

  Stream<Message> transform(Message message);
}
