import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import 'package:weather_app_inherited_model/ext.dart';
import 'package:weather_app_inherited_model/models/colors_model.dart';

class ColorBox extends StatelessWidget {
  final AvailableColors color;

  const ColorBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    switch (color) {
      case AvailableColors.colorOne:
      devtools.log('color1 got rebuilt');
      break;
      case AvailableColors.colorTwo:
      devtools.log('color1 got rebuilt'); 
        break;
    }

    final provider = ColorsModel.of(context, color);

    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: color == AvailableColors.colorOne ? provider?.color1 : provider?.color2
    );
  }
}
