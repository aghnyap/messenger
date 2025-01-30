part of 'counter_cubit.dart';

sealed class CounterEvent {}

final class IncrementCounter implements CounterEvent {}

final class DecrementCounter implements CounterEvent {}
