import 'package:flutter/material.dart';
import 'package:weather_app_inherited_notifier/helpers/ext.dart';
import 'package:weather_app_inherited_notifier/notifiers/slider.dart';

import '../notifiers/slider_inherited_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderData = SliderData();

    return Scaffold(
        appBar: AppBar(),
        body: SliderInheritedNotifier(
          sliderData: sliderData,
          child: Builder(builder: (context) {
            return Column(
              children: [
                Slider(
                  value: SliderInheritedNotifier.of(context) ?? 0,
                  onChanged: (value) {
                    sliderData.value = value;
                  },
                ),
                Opacity(
                  opacity: SliderInheritedNotifier.of(context) ?? 0,
                  child: Row(
                      children: [
                    Container(height: 200, color: Colors.green),
                    Container(
                      height: 200,
                      color: Colors.red,
                    ),
                  ].expandEqually().toList()),
                )
              ],
            );
          }),
        ));
  }
}
