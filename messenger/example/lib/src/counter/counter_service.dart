import 'package:injectable/injectable.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter/counter.pb.dart' as pb;
import '../../generated/message_channel.pbenum.dart';

import 'counter.dart';

@singleton
final class CounterService extends MessageService<MessageChannel> {
  final Counter counter;

  CounterService(
    super.messageBus,
    this.counter,
  ) : super(
          incomingChannels: [
            MessageChannel.COUNTER,
          ],
          outgoingChannel: MessageChannel.COUNTER,
        );

  @override
  void handle(MessageChannel channel, Message message) {
    switch (message.request.code) {
      case 'increment':
        _handleIncrement(message);
        break;
      case 'decrement':
        _handleDecrement(message);
        break;
      default:
        logger.warning('Unhandled request: ${message.request.code}');
    }
  }

  void _handleIncrement(Message message) {
    final value = _parseRawData(message).value;
    final updatedCounter = pb.Counter()..value = counter.increment(value);

    _sendCounterResponse(message, updatedCounter);
  }

  void _handleDecrement(Message message) {
    final value = _parseRawData(message).value;
    final updatedCounter = pb.Counter()..value = counter.decrement(value);

    _sendCounterResponse(message, updatedCounter);
  }

  pb.Counter _parseRawData(Message message) {
    if (!message.request.hasData()) {
      logger.warning('No raw_data found in request. Defaulting counter to 0.');
      return pb.Counter()..value = 0;
    }

    try {
      return message.request.data.unpackInto(pb.Counter());
    } catch (e) {
      logger.severe('Failed to parse Counter from raw_data: $e');
      return pb.Counter()..value = 0;
    }
  }

  void _sendCounterResponse(
    Message requestMessage,
    pb.Counter counter,
  ) {
    final response = Response()
      ..code = requestMessage.request.code
      ..success = true
      ..data = Any.pack(counter);

    dispatch(Message()..response = response);
  }
}
