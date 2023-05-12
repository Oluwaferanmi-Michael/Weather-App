// import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

import 'link_text.dart';

@immutable
class BaseText {
  final String text;
  final TextStyle? style;

  const BaseText({
    required this.text,
    this.style,
  });


  factory BaseText.plainText({required String text, TextStyle? style = const TextStyle()}) => BaseText(text: text, style: style);

  factory BaseText.linkText({
    required String text,
    TextStyle? style = const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
    required VoidCallback onPressed}) => LinkText(text: text, style: style, onPressed: onPressed);
}