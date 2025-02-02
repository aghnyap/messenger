part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class IncrementCounter implements CounterEvent {}

final class DecrementCounter implements CounterEvent {}
