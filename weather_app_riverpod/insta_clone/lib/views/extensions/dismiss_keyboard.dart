import 'package:flutter/widgets.dart';

extension DismissKeyBoard on Widget {
  void dismissKeyBoard() => FocusManager.instance.primaryFocus?.unfocus();
}