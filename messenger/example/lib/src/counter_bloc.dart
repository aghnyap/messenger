import 'package:bloc/bloc.dart';

import 'counter.dart';

part 'counter_event.dart';
part 'counter_state.dart';

final class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final Counter counter;

  CounterBloc(this.counter) : super(CounterInitial()) {
    on<IncrementCounter>(
      (_, emit) async {
        final count = await counter.increment(state.counter);
        emit(CounterIncremented(count));
      },
    );
  }
}
