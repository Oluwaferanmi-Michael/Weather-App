import 'dart:math' as math show Random;
import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

// extension Logging on Object {
//   log() => log();
// }

final colors = [
  Colors.blue,
  Colors.yellow,
  Colors.cyan,
  Colors.black,
  Colors.white,
  Colors.orange,
  Colors.purple
];

enum AvailableColors{
  one,
  two
}
