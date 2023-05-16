
import 'package:flutter/material.dart';
import 'package:insta_clone/state/posts/models/post.dart';
import 'package:insta_clone/views/components/post/post_thumb_view.dart';

class PostGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const PostGridView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3
        ), itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts.elementAt(index);
          return PostThumbNailView(post: post, onPressed: () {});
        }),
      ),
    );
  }
}