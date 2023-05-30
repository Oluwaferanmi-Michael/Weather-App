
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';

import '../../posts/typedefs/user_id.dart';

@immutable
class UserInfoModel extends MapView<String, String?> {

  final UserId userId;
  final String displayName;
  final String? email;

  UserInfoModel({
    required this.userId,
    required this.displayName,
    required this.email,
  }) : super({
    FirebaseFieldName.userId : userId,
    FirebaseFieldName.displayName : displayName,
    FirebaseFieldName.email : email,
  });

  UserInfoModel.fromJson(
    Map<String, dynamic> json, {required UserId userId}
  ) : this(
    userId: userId,
    displayName: json[FirebaseFieldName.displayName] ?? '',
    email: json[FirebaseFieldName.email],
  );


  @override
  int get hashCode => Object.hashAll(
    [
      userId,
      displayName,
      email,
    ]
  );
  
  @override
  bool operator ==(Object other) => identical(this, other) ||
  other is UserInfoModel &&
  runtimeType == other.runtimeType &&
  displayName == other.displayName &&
  userId == other.userId &&
  email == other.email;

}