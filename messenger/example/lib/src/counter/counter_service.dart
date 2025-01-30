import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter/counter.pb.dart' as pb;

import 'counter.dart';

@singleton
final class CounterService extends MessageService {
  final Counter counter;

  CounterService(
    super.messageBus,
    this.counter,
  ) : super(
          incomingChannels: ['counter'],
          outgoingChannel: 'counter',
        );

  @override
  void handle(Message message) {
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
    if (!message.request.hasRawData()) {
      logger.warning('No raw_data found in request. Defaulting counter to 0.');
      return pb.Counter()..value = 0;
    }

    try {
      return pb.Counter.fromBuffer(message.request.rawData);
    } catch (e) {
      logger.severe('Failed to parse Counter from raw_data: $e');
      return pb.Counter()..value = 0;
    }
  }

  void _sendCounterResponse(
    Message requestMessage,
    pb.Counter counter,
  ) {
    final responseMessage = Message()
      ..channel = requestMessage.channel
      ..response = (Response()
        ..code = requestMessage.request.code
        ..success = true
        ..rawData = counter.writeToBuffer());

    dispatch(responseMessage);
  }
}
