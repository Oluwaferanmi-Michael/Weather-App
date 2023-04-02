import 'package:flutter/material.dart';
import 'package:weather_app_flutter_hooks/scroll/scrolling_animation.dart';

import 'appLifeCycleHook/minimize.dart';
import 'future/future_hooks.dart';
import 'pages/home_page.dart';
import 'reduxpatternhook/reducer.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MinimizeHook(),
    );
  }
}