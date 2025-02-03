import 'package:example/generated/message_channel.pbenum.dart';
import 'package:example/src/counter/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:messenger/messenger.dart';

void main() {
  group('CounterBloc Test', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc(MessageBus<MessageChannel>());
    });

    tearDown(() {
      counterBloc.close();
    });

    test('initial state is CounterState(0)', () {
      expect(counterBloc.state, equals(const Updated(0)));
    });

    blocTest<CounterBloc, CounterState>(
      'emits [CounterState(1)] when Increment is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(Increment()),
      expect: () => <Updated>[const Updated(1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterState(-1)] when Decrement is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(Decrement()),
      expect: () => <CounterState>[const Updated(-1)],
    );

    blocTest<CounterBloc, CounterState>(
      'emits [CounterState(1), CounterState(2)] when two Increments are added',
      build: () => counterBloc,
      act: (CounterBloc bloc) {
        bloc.add(Increment());
        bloc.add(Increment());
      },
      expect: () => <CounterState>[const Updated(1), const Updated(2)],
    );
  });
}
