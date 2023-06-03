

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/posts/providers/all_posts_provider.dart';
import 'package:insta_clone/views/components/animations/empty_content_anim.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/post/post_grid_view.dart';

import '../../components/animations/small_error_anim.dart';

class HomeView extends ConsumerWidget {
  
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(allPostsProvider);
    return RefreshIndicator(
      child: posts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const EmptyContentWithText(text: Strings.noPostsinSystem);
        }
        return PostGridView(posts: posts);
      },  error: (error, stacktrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator()),

      onRefresh: () {
        ref.invalidate(allPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
    });
    
  }
}