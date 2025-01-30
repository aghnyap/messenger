part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  final int counter;
  final int ticks;

  const CounterState({
    required this.counter,
    required this.ticks,
  });

  @override
  List<Object?> get props => [counter, ticks];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0, ticks: 0);
}

final class CounterError extends CounterState {
  final String? message;

  const CounterError({
    required super.counter,
    required super.ticks,
    this.message,
  });

  @override
  List<Object?> get props => [counter, ticks, message];
}

final class CounterUpdated extends CounterState {
  const CounterUpdated({
    required super.counter,
    required super.ticks,
  });
}
