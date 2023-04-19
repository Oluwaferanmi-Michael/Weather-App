import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/people_model.dart';

class DataModel extends ChangeNotifier {

  final List<People> _people = [];

  int get count => _people.length;

  UnmodifiableListView <People> get people => UnmodifiableListView(_people);

  void addPerson(People people){
    _people.add(people);
    notifyListeners();
  }

  void remove(People people){
    _people.remove(people);
    notifyListeners();
  }

  void update(People updatedPerson){
    final index = _people.indexOf(updatedPerson);
    final oldPerson = _people[index];
    if(oldPerson.name != updatedPerson.name || oldPerson.age != updatedPerson.age){
      _people[index] = oldPerson.updated(
        updatedPerson.name,
        updatedPerson.age,
      );
      notifyListeners();
    }
  }
}

final peopleProvider = ChangeNotifierProvider((ref) => DataModel());