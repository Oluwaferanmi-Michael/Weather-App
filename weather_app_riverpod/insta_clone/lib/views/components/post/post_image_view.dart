

import 'package:flutter/material.dart';
import 'package:insta_clone/state/posts/models/post.dart';

class PostImageiew extends StatelessWidget {
  final Post post;
  const PostImageiew({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: post.aspectRatio,
      child: Image.network(
        post.fileUrl,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }),
      );
  }
}