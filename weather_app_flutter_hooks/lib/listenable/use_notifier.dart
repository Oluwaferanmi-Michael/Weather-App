import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_hooks/listenable/countdown_notifier.dart';



class CountdownWidget extends HookWidget {
  const CountdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final countdown = useMemoized(() => Countdown(from: 20));
    final notifier = useListenable(countdown);
    
    return Scaffold(
      body: Center(child: Text(notifier.value.toString()),),
    );
  }
}