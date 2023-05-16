import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/auth/constants/firebase_field_names.dart';
import 'package:insta_clone/state/auth/providers/user_id_provider.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/posts/models/post.dart';

import '../models/post_key.dart';


final userPostProvider = StreamProvider.autoDispose<Iterable<Post>>((ref) async* {

  final controller = StreamController<Iterable<Post>>();
  final userId = ref.watch(userIdProvider);

  controller.onListen = () {
    controller.sink.add([]);
  };

  final sub = FirebaseFirestore.instance.collection(FirebaseCollectionName.posts).orderBy(FirebaseFieldName.createdAt, descending: true)
  .where(PostKey.userId, isEqualTo: userId).snapshots()
  .listen((event) {
    final documents = event.docs;
    final posts = documents
    .where(
      (element) => !element.metadata.hasPendingWrites)
    .map((e) => Post(postId: e.id, json: e.data()));
    controller.sink.add(posts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  yield* controller.stream;
});



