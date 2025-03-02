import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/counter.pb.dart' as pb;
import '../../generated/message_channel.pbenum.dart';
import 'counter.dart';

part 'counter_event.dart';
part 'counter_state.dart';

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
    on<CounterIncrementPressed>(
      (
        CounterIncrementPressed _,
        Emitter<CounterState> emit,
      ) {
        emit(CounterUpdateSuccess(increment(state.counter)));
      },
    );

    on<CounterDecrementPressed>((
      CounterDecrementPressed _,
      Emitter<CounterState> emit,
    ) {
      emit(CounterUpdateSuccess(decrement(state.counter)));
    });
  }

  @override
  Message mapFromEvent(CounterEvent event) => Message()..response = Response();

  @override
  CounterState mapToState(Message message) {
    if (message.hasResponse()) {
      message.response.data.canUnpackInto(pb.Counter());
    }
    switch (MessageChannel.valueOf(message.channelValue)) {
      case MessageChannel.COUNTER:
        try {
          pb.Counter counter = message.response.data.unpackInto(pb.Counter());
          return CounterUpdateSuccess(counter.value);
        } on Exception catch (e) {
          logger.severe('Failed to parse Counter from data: $e');
          return const CounterUpdateError(0, message: '');
        }
      default:
        return const CounterUpdateError(0, message: '');
    }
  }
}
