// import 'package:flutter/material.dart';

extension CompactMap<T> on Iterable<T?>{
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform
  ]) => map( transform ?? (e) => e).where((e) => e != null).cast();
}

extension Normalize on num {
  num normalized(num selfRangeMin, num selfRangeMax, [num normalizedMin = 0.0, num normalizedMax = 1.0]){
    return (normalizedMax - normalizedMin) * ((this - selfRangeMin) / (selfRangeMax - selfRangeMin)) + normalizedMin;
  }
}

// ENUMS
enum Action {
  rotateLeft,
  rotateRight,
  lessVisible,
  moreVisible
}