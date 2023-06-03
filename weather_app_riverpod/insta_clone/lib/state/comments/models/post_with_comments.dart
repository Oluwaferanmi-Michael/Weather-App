import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/comments/models/comments_model.dart';
import 'package:insta_clone/state/posts/models/post.dart';

@immutable
class PostWithComments {

  final Post post;
  final Iterable<Comment> comments;

  const PostWithComments({
    required this.post,
    required this.comments
  });

  @override
  bool operator ==(covariant PostWithComments other) =>
  post == other.post &&
  // equates values in an iterable as the same regardles of ordering
  // in a list [comment1, comment2] and [comment2, comment1]
  // dart will recognise both as the same because of IterableEquality regardless of ordering  
  const IterableEquality().equals(
    comments, other.comments);    

  @override
  int get hashCode => Object.hashAll(
    [
      post,
      comments,
    ]
  );
    
  
}