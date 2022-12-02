import 'package:flutter_riverpod/flutter_riverpod.dart';

final parentScopedCounterProvider = StateProvider<Counter>((ref) => Counter());
final localScopedCounterProvider = StateProvider<Counter>((ref) {
  return Counter();
});

class Counter {
  int count;
  Counter({this.count = 0});
}
