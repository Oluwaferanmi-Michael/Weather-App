import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_app_flutter_hooks/ext.dart';



const url = 'https://images.unsplash.com/photo-1569817480240-41de5e7283c9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';
const imageHeight = 300.0;

class ScrollingAnimHook extends HookWidget {
  const ScrollingAnimHook({super.key});

  @override
  Widget build(BuildContext context) {

    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0
    );

    final size = useAnimationController(duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0);

    final controller = useScrollController();
    useEffect(() {
      controller.addListener(() {
        final newOpacity = max(imageHeight - controller.offset, 0.0);
        final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();
        opacity.value = normalized;
        size.value = normalized;
      });
      return null;
    }, [controller]);

    return Scaffold(
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'),);
              },
            ),
          )
      ]),
    );
  }
}