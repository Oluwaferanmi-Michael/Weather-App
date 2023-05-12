import 'package:flutter/foundation.dart';
import 'package:insta_clone/views/components/rich_text/base_text.dart';

@immutable
class LinkText extends BaseText{
  final VoidCallback onPressed;

  const LinkText({
    required super.text,
    super.style,
    required this.onPressed,
  });


}