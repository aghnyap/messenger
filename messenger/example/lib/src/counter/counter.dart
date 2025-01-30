import 'package:injectable/injectable.dart';

@singleton
final class Counter {
  const Counter();

  int increment(int counter) => ++counter;

  int decrement(int counter) => --counter;
}
