part of 'counter_bloc.dart';

sealed class CounterEvent {}

final class Increment implements CounterEvent {}

final class Decrement implements CounterEvent {}
