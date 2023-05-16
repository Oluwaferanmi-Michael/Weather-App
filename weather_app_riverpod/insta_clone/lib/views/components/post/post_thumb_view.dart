
import 'package:flutter/material.dart';

import '../../../state/posts/models/post.dart';

class PostThumbNailView extends StatelessWidget {
  final Post post;
  final VoidCallback onPressed;
  const PostThumbNailView({super.key, required this.post, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.network(post.thumbnailUrl, fit: BoxFit.cover));
  }
}