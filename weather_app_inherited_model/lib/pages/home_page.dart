import 'package:flutter/material.dart';

import '../ext.dart';
import '../helpers/widgets.dart';
import '../models/colors_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var color1 = Colors.yellow;
    var color2 = Colors.blue;

    return Scaffold(
      appBar: AppBar(),
        body: ColorsModel(
            color1: color1,
            color2: color2,
            child: Column(children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          color1 = colors.getRandomElement();
                        });
                        
                      },
                      child: const Text('first color')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          color2 = colors.getRandomElement();
                        });
                      },
                      child: const Text('second color')),
                ],
              ),
              const ColorBox(color: AvailableColors.colorOne),
              const ColorBox(color: AvailableColors.colorTwo)
            ])));
  }
}
