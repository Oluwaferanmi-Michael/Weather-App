
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/views/components/rich_text/base_text.dart';
import 'package:insta_clone/views/components/rich_text/link_text.dart';


class RichTextWidget extends StatelessWidget {
  final TextStyle? styleForAll;
  final Iterable<BaseText> texts;

  const RichTextWidget({super.key, required this.texts, this.styleForAll});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: texts.map((e) {
          if (e is LinkText) {
            return TextSpan(
              text: e.text,
              style: styleForAll?.merge(e.style),
              recognizer: TapGestureRecognizer()..onTap = e.onPressed
            );
          } else {
            return TextSpan(
              text: e.text,
              style: styleForAll?.merge(e.style)
            );
          }
        }).toList()
      ),
    );
  }
}