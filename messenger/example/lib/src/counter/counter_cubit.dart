import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/config/message_channel.pb.dart';
import '../../generated/counter/counter.pb.dart' as pb;
import '../../generated/timer/timer.pb.dart' as pb;

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
final class CounterCubit extends MessageCubit<CounterState, MessageChannel> {
  CounterCubit(super.messageBus)
      : super(
          initialState: CounterInitial(),
          incomingChannels: [
            MessageChannel.COUNTER,
            MessageChannel.TIMER,
          ],
          outgoingChannel: MessageChannel.COUNTER,
        );

  @override
  void handle(Message message) {
    if (message.hasResponse()) {
      if (!message.response.hasData()) {
        return;
      }

      try {
        final counter = message.response.data.unpackInto(pb.Counter());
        emit(CounterUpdated(counter: counter.value, ticks: state.ticks));
      } catch (e) {
        logger.severe('Failed to parse Counter from raw_data: $e');
      }
    } else if (message.hasBroadcast()) {
      if (!message.broadcast.hasData()) {
        return;
      }

      try {
        final timer = message.broadcast.data.unpackInto(pb.Timer());
        emit(CounterUpdated(counter: state.counter, ticks: timer.ticks));
      } catch (e) {
        logger.severe('Failed to parse Counter from raw_data: $e');
      }
    }
  }

  void increment() {
    var counter = pb.Counter()..value = state.counter;

    var request = Request()
      ..code = 'increment'
      ..data = Any.pack(counter);

    dispatch(Message()..request = request);
  }

  void decrement() {
    var counter = pb.Counter()..value = state.counter;

    var request = Request()
      ..code = 'decrement'
      ..data = Any.pack(counter);

    dispatch(Message()..request = request);
  }
}
