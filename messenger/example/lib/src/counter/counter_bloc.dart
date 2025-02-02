import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter.pb.dart' as pb;
import '../../generated/message_channel.pbenum.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
final class CounterBloc
    extends MessageBloc<CounterEvent, CounterState, MessageChannel> {
  CounterBloc(super.messageBus)
      : super(
          initialState: const CounterInitial(),
          incomingChannels: <MessageChannel>[
            MessageChannel.COUNTER,
          ],
          outgoingChannel: MessageChannel.COUNTER,
        ) {
    on<IncrementCounter>((IncrementCounter event, Emitter<CounterState> emit) {
      pb.Counter counter = pb.Counter()..value = state.counter;

      Request request = Request()
        ..code = 'increment'
        ..data = Any.pack(counter);

      dispatch(Message()..request = request);
    });

    on<DecrementCounter>((DecrementCounter event, Emitter<CounterState> emit) {
      pb.Counter counter = pb.Counter()..value = state.counter;

      Request request = Request()
        ..code = 'decrement'
        ..data = Any.pack(counter);

      dispatch(Message()..request = request);
    });
  }

  @override
  Stream<CounterState> messageTransformer(Message message) async* {
    switch (MessageChannel.valueOf(message.channelValue)) {
      case MessageChannel.COUNTER:
        try {
          pb.Counter counter = message.response.data.unpackInto(pb.Counter());
          yield CounterUpdated(counter: counter.value);
        } on Exception catch (e) {
          logger.severe('Failed to parse Counter from data: $e');
        }
      default:
    }
  }
}
