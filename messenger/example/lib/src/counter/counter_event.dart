part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class CounterIncrementPressed implements CounterEvent {}

final class CounterDecrementPressed implements CounterEvent {}
