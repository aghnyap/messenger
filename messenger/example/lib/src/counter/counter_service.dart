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
  void handleRequest(MessageChannel channel, Request request) {
    if (channel == MessageChannel.COUNTER) {
      switch (request.code) {
        case 'increment':
          _handle(request, (value) => counter.increment(value));
          break;
        case 'decrement':
          _handle(request, (value) => counter.decrement(value));
          break;
        default:
          logger.warning('Unhandled request: ${request.code}');
      }
    }
  }

  void _handle(Request request, int Function(int) counter) {
    var updatedCounter = pb.Counter()..value = counter(_getData(request));
    _sendCounterResponse(request, updatedCounter);
  }

  int _getData(Request request) {
    if (!request.hasData()) {
      logger.warning('No raw_data found in request. Defaulting counter to 0.');
      return 0;
    }

    try {
      return request.data.unpackInto(pb.Counter()).value;
    } catch (e) {
      logger.severe('Failed to parse Counter from raw_data: $e');
      return 0;
    }
  }

  void _sendCounterResponse(Request request, pb.Counter counter) {
    final response = Response()
      ..code = request.code
      ..success = true
      ..data = Any.pack(counter);

    dispatch(Message()..response = response);
  }
}
