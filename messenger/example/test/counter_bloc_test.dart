import 'package:bloc_test/bloc_test.dart';
import 'package:example/generated/counter.pb.dart' as pb;
import 'package:example/generated/message_channel.pb.dart';
import 'package:example/src/counter/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';
import 'package:mocktail/mocktail.dart';

class _MockMessageBus extends Mock implements MessageBus<MessageChannel> {}

void main() {
  group(CounterBloc, () {
    const MessageChannel channel = MessageChannel.COUNTER;

    late MessageBus<MessageChannel> messageBus;

    setUp(() {
      messageBus = _MockMessageBus();
      when(() => messageBus.receive<Message>(channel)).thenAnswer(
        (_) => Stream<Message>.value(
          Message()
            ..channelName = 'counter'
            ..response = (Response()
              ..code = 'increment'
              ..success = true
              ..data = Any.pack(pb.Counter()..value = 0)),
        ),
      );
    });

    tearDown(messageBus.dispose);

    test('initial state is 0', () {
      expect(CounterBloc(messageBus).state.counter, 0);
    });

    group('increment', () {
      blocTest<CounterBloc, CounterState>(
        'emits [1] when state is 0',
        build: () => CounterBloc(messageBus),
        act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(1),
        ],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [1, 2] when state is 0 and invoked twice',
        build: () => CounterBloc(messageBus),
        act: (CounterBloc bloc) => bloc
          ..add(CounterIncrementPressed())
          ..add(CounterIncrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(1),
          CounterUpdateSuccess(2),
        ],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [42] when state is 41',
        build: () => CounterBloc(messageBus),
        seed: () => const CounterUpdateSuccess(41),
        act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(42),
        ],
      );
    });

    group('decrement', () {
      blocTest<CounterBloc, CounterState>(
        'emits [-1] when state is 0',
        build: () => CounterBloc(messageBus),
        act: (CounterBloc bloc) => bloc.add(CounterDecrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(-1),
        ],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [-1, -2] when state is 0 and invoked twice',
        build: () => CounterBloc(messageBus),
        act: (CounterBloc bloc) => bloc
          ..add(CounterDecrementPressed())
          ..add(CounterDecrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(-1),
          CounterUpdateSuccess(-2),
        ],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [42] when state is 43',
        build: () => CounterBloc(messageBus),
        seed: () => const CounterUpdateSuccess(43),
        act: (CounterBloc bloc) => bloc.add(CounterDecrementPressed()),
        expect: () => const <CounterState>[
          CounterUpdateSuccess(42),
        ],
      );
    });
  });
}
