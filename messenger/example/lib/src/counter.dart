final class Counter {
  const Counter();

  Future<int> increment(int counter) => Future(() => ++counter);
}
