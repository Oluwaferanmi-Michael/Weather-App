

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/posts/providers/post_by_search_term_provider.dart';
import 'package:insta_clone/state/posts/typedefs/search_teram.dart';
import 'package:insta_clone/views/components/animations/data_not_found_anim.dart';
import 'package:insta_clone/views/components/animations/empty_content_anim.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/post/post_grid_view.dart';

import '../animations/small_error_anim.dart';

class SearchGridView extends ConsumerWidget {
  final SearchTerm searchTerm;
  const SearchGridView({super.key, required this.searchTerm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    if (searchTerm.isEmpty) {
      return const EmptyContentWithText(text: Strings.enterYourSearchTerm);
    }

    final posts = ref.watch(postsBySearchTermProvider(searchTerm));
    
    return posts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const DataNotFoundAnim();
        }

        return PostGridView(posts: posts);

      }, error: (error, stacktrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator());
  }
}