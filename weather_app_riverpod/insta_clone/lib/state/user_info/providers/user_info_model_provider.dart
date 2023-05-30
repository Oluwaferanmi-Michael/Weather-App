

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';
import 'package:insta_clone/state/posts/typedefs/user_id.dart';
import 'package:insta_clone/state/user_info/models/user_info_model.dart';

final userInfoModelProvider = StreamProvider.family.autoDispose<UserInfoModel, UserId>((ref, UserId userId) {
  final controller = StreamController<UserInfoModel>();

  final sub = FirebaseFirestore.instance.collection(FirebaseCollectionName.users).where(
    FirebaseFieldName.userId, isEqualTo: userId
  ).limit(1).snapshots().listen((event) {
    final doc = event.docs.first;

    final json = doc.data();

    final userInfoModel = UserInfoModel.fromJson(json, userId: userId);

    controller.add(userInfoModel);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});