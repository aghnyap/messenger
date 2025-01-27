part of 'counter_bloc.dart';

sealed class CounterState {
  final int counter;

  const CounterState(this.counter);
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

final class CounterIncremented extends CounterState {
  CounterIncremented(super.counter);
}
