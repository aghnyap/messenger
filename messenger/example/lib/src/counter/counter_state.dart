part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  const CounterState(this.counter);
  final int counter;
}

final class CounterInitial extends CounterState with EquatableMixin {
  const CounterInitial() : super(0);

  @override
  List<Object?> get props => <Object?>[counter];
}

final class CounterUpdateInProgress extends CounterState with EquatableMixin {
  const CounterUpdateInProgress(super.counter);

  @override
  List<Object?> get props => <Object?>[counter];
}

final class CounterUpdateError extends CounterState with EquatableMixin {
  const CounterUpdateError(
    super.counter, {
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[counter, message];
}

final class CounterUpdateSuccess extends CounterState with EquatableMixin {
  const CounterUpdateSuccess(super.counter);

  @override
  List<Object?> get props => <Object?>[counter];
}
