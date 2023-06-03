

import 'package:flutter/material.dart';
import 'package:insta_clone/state/comments/models/comments_model.dart';
import 'package:insta_clone/views/components/comments/compact_comments_tile.dart';

class CompactCommentColumn extends StatelessWidget {
  final Iterable<Comment> comments;
  const CompactCommentColumn({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 16
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: comments.map((comment) => CompactCommentsTile(comment: comment)).toList(),
      ),
    )
    ;
  }
}