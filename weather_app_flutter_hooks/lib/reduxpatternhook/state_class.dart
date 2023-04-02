import 'dart:math';
import 'package:weather_app_flutter_hooks/ext.dart' as ext;
import 'package:flutter/material.dart';

@immutable
class State {
  final double rotationDegrees;
  final double alpha;

  const State({
    required this.rotationDegrees,
    required this.alpha
  });

  const State.zero() : rotationDegrees = 0.0, alpha = 1.0;

  State rotateRight() => State(alpha: alpha, rotationDegrees: rotationDegrees + 10);

  State rotateLeft() => State(alpha: alpha, rotationDegrees: rotationDegrees - 10);

  State increaseAlpha() => State(alpha: min(alpha + 0.1, 1.0), rotationDegrees: rotationDegrees);

  State decreaseAlpha() => State(alpha: min(alpha - 0.1, 1.0), rotationDegrees: rotationDegrees);
}

State reducer(State oldState, ext.Action? action){
  switch (action) {
    case ext.Action.rotateLeft:
      return oldState.rotateLeft();
    case ext.Action.rotateRight:
      return oldState.rotateRight();
    case ext.Action.lessVisible:
      return oldState.decreaseAlpha();
    case ext.Action.moreVisible:
      return oldState.increaseAlpha();
    case null:
      return oldState;
  }
}