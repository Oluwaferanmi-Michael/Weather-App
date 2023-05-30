
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';
import 'package:insta_clone/state/posts/typedefs/user_id.dart';

import '../../posts/typedefs/post_id.dart';

@immutable
class CommentPayload extends MapView<String, dynamic>{
  CommentPayload({
    required UserId fromUserId,
    required PostId fromPostId,
    required String comment,
  }) : super({
    FirebaseFieldName.userId : fromUserId,
    FirebaseFieldName.postId : fromPostId,
    FirebaseFieldName.comment : comment,
    FirebaseFieldName.createdAt : FieldValue.serverTimestamp(),
  });
}