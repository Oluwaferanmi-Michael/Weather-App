import 'package:flutter/material.dart';
import 'package:weather_app_inherited_model/ext.dart';
import 'dart:developer' as devtools show log;

class ColorsModel extends InheritedModel<AvailableColors> {
  final Color color1;
  final Color color2;

  const ColorsModel({
    Key? key,
    required Widget child,
    required this.color1,
    required this.color2,
  }) : super(key: key, child: child);

  static ColorsModel of(BuildContext context, AvailableColors aspect) {
    return InheritedModel.inheritFrom<ColorsModel>(context, aspect: aspect)!;
  }

  @override
  bool updateShouldNotify(covariant ColorsModel oldWidget) {
    devtools.log('updateShouldNotify');
    devtools.log('${color1 != oldWidget.color1 || color2 != oldWidget.color2}');
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant ColorsModel oldWidget, Set<AvailableColors> dependencies) {
    devtools.log('updateShouldNotifyDependencies');
    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      return true;
    }

    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      return true;
    }

    return false;
  }
}
