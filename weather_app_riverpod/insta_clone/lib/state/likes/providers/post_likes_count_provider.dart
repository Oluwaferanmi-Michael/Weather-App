

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';

final postLikesCountProvider = StreamProvider.family<int, PostId>((ref, PostId postId){

  final controller = StreamController<int>.broadcast();

  controller.onListen = (){
    controller.sink.add(0);
  };

  final sub = FirebaseFirestore.instance.collection(FirebaseCollectionName.likes)
  .where(FirebaseFieldName.postId, isEqualTo: postId).snapshots().listen((event) {
    controller.sink.add(event.docs.length);
  });



  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});