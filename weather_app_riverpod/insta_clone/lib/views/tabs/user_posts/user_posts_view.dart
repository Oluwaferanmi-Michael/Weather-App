import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/views/components/animations/empty_content_anim.dart';
import 'package:insta_clone/views/components/animations/error_anim.dart';
import 'package:insta_clone/views/components/animations/loading_anim.dart';
import 'package:insta_clone/views/components/constants/strings.dart';

import '../../../state/posts/providers/user_posts_provider.dart';
import '../../components/post/post_grid_view.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostProvider);
    return RefreshIndicator.adaptive(
      onRefresh: () {
        ref.invalidate(userPostProvider);
        return Future.delayed(const Duration(seconds: 1));
        },
        
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const EmptyContentWithText(text: Strings.youHaveNooPosts,);
          } else {
            return PostGridView(
              posts: posts,
            );
          }
        },
        error: (e, stackTrace) {
          return const ErrorAnim();
        },
        loading: () {
          return const LoadinAnim();
        }),
    );
  }
}