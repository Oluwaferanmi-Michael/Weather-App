import 'package:flutter/material.dart';

import 'slider.dart';

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {

  const SliderInheritedNotifier({
    Key? key,
    required SliderData sliderData,
    required Widget child,
  }) : super(
    key: key,
    notifier: sliderData,
    child: child,
  );
  

  static double? of(BuildContext context) {
    return context
      .dependOnInheritedWidgetOfExactType<SliderInheritedNotifier>()
      ?.notifier
      ?.value ?? 0.0;
  }
}
