import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends ValueNotifier<int>{
  late StreamSubscription sub;

  Countdown({
    required int from
  }) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
    .takeWhile((value) => value >= 0)
    .listen((value) {this.value = value;});
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}