
import 'package:flutter/foundation.dart';
import 'package:insta_clone/enums/date_sorting.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';

@immutable
class PostCommentRequest {
  final PostId postId;
  final bool sortByCreatedAt;
  final DateSorting dateSorting;
  final int? limit;

  const PostCommentRequest({
    required this.postId,
    this.sortByCreatedAt = true,
    this.dateSorting = DateSorting.newOnTop,
    this.limit,
  });


  
  @override
  bool operator ==(covariant PostCommentRequest other) =>
    postId == other.postId &&
    sortByCreatedAt == other.sortByCreatedAt &&
    dateSorting == other.dateSorting &&
    limit == other.limit;


  @override
  int get hashCode => Object.hashAll(
    [
      postId,
      sortByCreatedAt,
      dateSorting,
      limit,
    ]
  );
}