import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter/counter.pb.dart' as pb;
import '../../generated/timer/timer.pb.dart' as pb;

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
final class CounterCubit extends MessageCubit<CounterState> {
  CounterCubit(super.messageBus)
      : super(
          initialState: CounterInitial(),
          incomingChannels: ['counter', 'timer'],
          outgoingChannel: 'counter',
        );

  @override
  void handle(Message message) {
    if (message.hasResponse()) {
      if (!message.response.hasRawData()) {
        return;
      }

      try {
        final counter = pb.Counter.fromBuffer(message.response.rawData);

        emit(CounterUpdated(counter: counter.value, ticks: state.ticks));
      } catch (e) {
        logger.severe('Failed to parse Counter from raw_data: $e');
      }
    } else if (message.hasBroadcast()) {
      if (!message.broadcast.hasRawData()) {
        return;
      }

      try {
        final timer = pb.Timer.fromBuffer(message.broadcast.rawData);

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
      ..rawData = counter.writeToBuffer();

    dispatch(Message()..request = request);
  }

  void decrement() {
    var counter = pb.Counter()..value = state.counter;

    var request = Request()
      ..code = 'decrement'
      ..rawData = counter.writeToBuffer();

    dispatch(Message()..request = request);
  }
}
