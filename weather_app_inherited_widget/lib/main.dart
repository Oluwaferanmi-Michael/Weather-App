import 'package:flutter/material.dart';
import 'package:weather_app_inherited_widget/mock/class_api.dart';

import 'mock/api_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiProvider(
        api: Api(),
        child: const HomePage()),
    );
  }
}
