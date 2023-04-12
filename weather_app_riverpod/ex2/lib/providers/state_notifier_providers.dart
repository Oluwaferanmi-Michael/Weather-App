import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ex2/ext.dart';

class Counter extends StateNotifier<int?> {
  Counter() : super(null);

  void increment() => state = state == null ? 1 : state + 1;
  int? get value => state;
}

final counterProvider = StateNotifierProvider<Counter, int?>((ref) => Counter());