
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/comments/typedefs/comment_id.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';
import '../../posts/typedefs/user_id.dart';

@immutable
class Comment{
  final CommentId id;
  final UserId fromUserId;
  final String comment;
  final DateTime createdAt;
  final PostId onPostId;

  Comment( Map<String, dynamic> json, {required this.id}) : 
  comment = json[FirebaseFieldName.comment],
  createdAt = (json[FirebaseFieldName.createdAt] as Timestamp).toDate(),
  fromUserId = json[FirebaseFieldName.userId],
  onPostId = json[FirebaseFieldName.postId];

  @override
  bool operator ==(Object other) => identical(this, other) ||
  other is Comment && 
    runtimeType == other.runtimeType &&
    fromUserId == other.fromUserId &&
    createdAt == other.createdAt &&
    onPostId == other.onPostId &&
    id == other.id;


  @override
  int get hashCode => Object.hashAll(
    [
      createdAt,
      onPostId,
      id,
      fromUserId,
      onPostId,
    ]
  );

}