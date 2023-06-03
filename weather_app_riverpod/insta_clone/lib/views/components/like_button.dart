import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/auth/providers/user_id_provider.dart';
import 'package:insta_clone/state/likes/providers/has_liked_post_provider.dart';
import 'package:insta_clone/state/likes/providers/like_dislike_post_provider.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';
import 'package:insta_clone/views/components/animations/small_error_anim.dart';

import '../../state/likes/model/like_dislike_request_model.dart';

class LikeButton extends ConsumerWidget {
  final PostId postId;
  const LikeButton({super.key, required this.postId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final hasLiked = ref.watch(hasLikedPostProvider(postId));

    return hasLiked.when(
      data: (hasLiked) {
        return IconButton(
          onPressed: () {
            final userId = ref.read(userIdProvider);

            if (userId == null) {
              return;
            } 
            final likeRequest = LikeDislikeRequest(postId: postId, likedBy: userId);

            ref.read(likeDislikePostProvider(likeRequest));
            // return true;
          }, 
          icon: FaIcon( hasLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart));
      }, error: (error, stackTrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator.adaptive());
  }
}