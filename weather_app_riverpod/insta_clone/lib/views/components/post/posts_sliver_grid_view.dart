
import 'package:flutter/material.dart';
import 'package:insta_clone/state/posts/models/post.dart';
import 'package:insta_clone/views/components/post/post_details_view.dart';
import 'package:insta_clone/views/components/post/post_thumb_view.dart';

class SliverPostGridView extends StatelessWidget {
  final Iterable<Post> posts;
  const SliverPostGridView({
    super.key,
    required this.posts
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (context, index) {
          final post = posts.elementAt(index);
        return PostThumbNailView(post: post, onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => PostDetailsView(
              post: post
            )
          )
          );
        });          
        },
      ),
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 3
      ),);
  }
}