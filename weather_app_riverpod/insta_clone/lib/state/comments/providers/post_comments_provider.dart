

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/comments/extensions/comment_sorting_by_request.dart';
import 'package:insta_clone/state/comments/models/comments_model.dart';
import 'package:insta_clone/state/comments/models/post_comment_requests.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';

final postCommentsProvider = StreamProvider.family.autoDispose<Iterable<Comment>, PostCommentRequest>((ref, PostCommentRequest request) {

  final controller = StreamController<Iterable<Comment>>();

  final sub = FirebaseFirestore.instance.collection(FirebaseCollectionName.comments).where(
    FirebaseFieldName.postId, isEqualTo: request.postId
  ).snapshots().listen((event) {
    final documents = event.docs;
    final limitedDocuments = request.limit != null ? documents.take(request.limit!) : documents;

    final comments = limitedDocuments.where((doc) => !doc.metadata.hasPendingWrites)
      .map((documents) => Comment(documents.data(), id: documents.id));

    final result = comments.applySortingFrom(request);
    controller.add(result); // controller.sink.add(result) is the same
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});