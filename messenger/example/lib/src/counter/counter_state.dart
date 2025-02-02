part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState({
    required this.counter,
  });

  final int counter;

  @override
  List<Object?> get props => <Object?>[counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

final class CounterLoading extends CounterState {
  const CounterLoading({required super.counter});
}

final class CounterError extends CounterState {
  const CounterError({
    required super.counter,
    this.message,
  });

  final String? message;

  @override
  List<Object?> get props => <Object?>[counter, message];
}

final class CounterUpdated extends CounterState {
  const CounterUpdated({
    required super.counter,
  });
}
