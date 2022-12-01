import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonCounterProvider = StateProvider<Counter>((ref) => Counter());

class Counter {
  int count;
  Counter({this.count = 0});
}
