import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/likes/providers/post_likes_count_provider.dart';
import 'package:insta_clone/views/components/animations/small_error_anim.dart';
import 'package:insta_clone/views/components/constants/strings.dart';

import '../../state/posts/models/post.dart';

class LikeCountView extends ConsumerWidget {
  final Post post;
  const LikeCountView({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesCount = ref.watch(postLikesCountProvider(post.postId));
    return likesCount.when(
      data: (int likeCount) {
        final personOrPeople = likeCount == 1 ? Strings.person : Strings.people;

        final likesText = '$likesCount $personOrPeople ${Strings.likedThis}';

        return Text(likesText);

      }, error: (error, stacktrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator());
  }
}