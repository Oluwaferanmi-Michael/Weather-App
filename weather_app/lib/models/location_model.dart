import 'package:uuid/uuid.dart';

class Location {
  final String id;
  final String name;

  Location({required this.name

      // UUID to separate locations by index
      })
      : id = const Uuid().v4();
}
