import 'dart:developer' as devtools show log;

import 'package:insta_clone/views/components/animations/models/lottie_animation.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

extension GetFullPathOnLottie on LottieAnimation {
  String get fullPath => 'assets/animations/$name.json';
}