part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState(this.counter);

  final int counter;

  @override
  List<Object?> get props => <Object?>[counter];
}

final class Initial extends CounterState {
  const Initial() : super(0);
}

final class Loading extends CounterState {
  const Loading(super.counter);
}

final class Error extends CounterState {
  const Error(
    super.counter, {
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[counter, message];
}

final class Updated extends CounterState {
  const Updated(super.counter);
}
