import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class ImageRotate extends HookWidget {
  const ImageRotate({super.key});

  @override
  Widget build(BuildContext context) {

    const url = 'https://images.unsplash.com/photo-1569817480240-41de5e7283c9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';

    late final StreamController<double> controller;
    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0);
    });


    return Scaffold(
      body: StreamBuilder<double>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
           final rotation = snapshot.data ?? 0.0;
           return GestureDetector(
            onTap: () => controller.sink.add(rotation + 10.0),
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(rotation / 360),
              child: Center(child: Image.network(url))),
          );
          }
          
        }
      ),
    );
  }
}