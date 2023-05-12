
// import 'package:flutter/foundation.dart' as immutable;
import 'package:flutter/material.dart';
import 'package:insta_clone/helpers/strings/html_to_color.dart';

@immutable
class AppColors{

  static final loginButtonCOlor = '#cfc9c2'.htmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#4285F4'.htmlColorToColor();
  static final facebookColor = '3b5998'.htmlColorToColor();
  
const AppColors._();
}