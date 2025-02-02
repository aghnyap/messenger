import 'package:injectable/injectable.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter.pb.dart' as pb;
import '../../generated/message_channel.pbenum.dart';

@singleton
final class CounterService extends MessageService<MessageChannel> {
  CounterService(
    super.messageBus,
  ) : super(
          incomingChannels: <MessageChannel>[
            MessageChannel.COUNTER,
          ],
          outgoingChannel: MessageChannel.COUNTER,
        );

  @override
  Stream<Message> messageTransformer(Message message) async* {
    switch (MessageChannel.valueOf(message.channelValue)) {
      case MessageChannel.COUNTER:
        if (!message.hasRequest()) {
          return;
        }

        switch (message.request.code) {
          case 'increment':
            pb.Counter counter = message.request.data.unpackInto(pb.Counter());
            Response response = Response()
              ..data = Any.pack(counter..value = counter.value + 1);
            yield message..response = response;
          case 'decrement':
            pb.Counter counter = message.request.data.unpackInto(pb.Counter());
            Response response = Response()
              ..data = Any.pack(counter..value = counter.value - 1);
            yield message..response = response;
          default:
        }
      default:
    }
  }

  int increment(int value) => ++value;

  int drecement(int value) => --value;
}
