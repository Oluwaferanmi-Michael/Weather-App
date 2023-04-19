import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class People {
  final String name;
  final int age;
  final String uuid;

  People({
    required this.name,
    required this.age,
    String? uuid
  }) : uuid = uuid ?? const Uuid().v4();

  
  People updated([String? name, int? age]) => People(
    name: name ?? this.name,
    age: age ?? this.age,
    uuid: uuid,
    );

  String get displayName => '$name ($age years old)';

  @override
  bool operator == (covariant People other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  @override
  String toString() => 'Person(name: $name, age: $age, uuid: $uuid)';
}

