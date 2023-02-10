import 'package:uuid/uuid.dart';

class Location{
  final String id;
  final String name;

  Location({
    required this.name
  }) : id = const Uuid().v4();
}
