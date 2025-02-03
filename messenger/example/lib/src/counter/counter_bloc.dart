import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter.pb.dart' as pb;
import '../../generated/message_channel.pbenum.dart';

part 'counter_event.dart';
part 'counter_state.dart';

final class CounterBloc
    extends MessageBloc<CounterEvent, CounterState, MessageChannel> {
  CounterBloc(super.messageBus)
      : super(
          initialState: const Initial(),
          incomingChannels: <MessageChannel>[
            MessageChannel.COUNTER,
          ],
          outgoingChannel: MessageChannel.COUNTER,
        ) {
    on<Increment>(
      (Increment event, Emitter<CounterState> emit) {
        emit(Loading(state.counter));
      },
      transformer: (
        Stream<Increment> events,
        Stream<Increment> Function(Increment) mapper,
      ) =>
          events,
    );

    on<Decrement>(
      (Decrement event, Emitter<CounterState> emit) {
        emit(Loading(state.counter));
      },
      transformer: (
        Stream<Decrement> events,
        Stream<Decrement> Function(Decrement) mapper,
      ) =>
          events,
    );
  }

  @override
  Stream<CounterState> mapToState(Message message) async* {
    switch (MessageChannel.valueOf(message.channelValue)) {
      case MessageChannel.COUNTER:
        try {
          pb.Counter counter = message.response.data.unpackInto(pb.Counter());
          yield Updated(counter.value);
        } on Exception catch (e) {
          logger.severe('Failed to parse Counter from data: $e');
        }
      default:
    }
  }
}
