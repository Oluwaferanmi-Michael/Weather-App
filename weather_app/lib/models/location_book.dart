import 'package:flutter/foundation.dart';

import 'location_model.dart';

class LocationBook extends ValueNotifier<List<Location>> {
  // const LocationBook();


// Data singleton

// initializing no value
  LocationBook._sharedInstance() : super([]);
  static final LocationBook _shared = LocationBook._sharedInstance();

  factory LocationBook() => _shared;

// length method
  int get length => value.length;

  void add({required Location location}) {
    final locations = value;
    locations.add(location);
    notifyListeners();
  }

  void remove({required Location location}) {
    final locations = value;
    if(locations.contains(location)){
      locations.remove(location);
    }
    notifyListeners();
  }

  Location? location({required int index}) =>
      value.length >= index ? value[index] : null;
}
