import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class MinimizeHook extends HookWidget {
  const MinimizeHook({super.key});

  @override
  Widget build(BuildContext context) {
    const url = 'https://images.unsplash.com/photo-1569817480240-41de5e7283c9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';
    final store = useAppLifecycleState();
    final AppLifecycleState lifecycleState;
    return Scaffold(
      body: Opacity(
        opacity: store == AppLifecycleState.resumed ? 1.0 : 0.0,
        child: Center(child: Image.network(url, height: 300, fit: BoxFit.contain,))),
    );
  }
}