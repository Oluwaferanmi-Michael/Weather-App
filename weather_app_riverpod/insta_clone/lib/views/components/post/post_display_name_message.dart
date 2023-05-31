
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/posts/models/post.dart';
import 'package:insta_clone/state/user_info/providers/user_info_model_provider.dart';
import 'package:insta_clone/views/components/animations/small_error_anim.dart';
import 'package:insta_clone/views/components/rich_two_part_text.dart';

class PostDisplayNameAndMessage extends ConsumerWidget {
  final Post post;
  const PostDisplayNameAndMessage({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userInfoModel = ref.watch(userInfoModelProvider(post.userId));
    return userInfoModel.when(
      data: (data) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichTwoPartText(leftPart: data.displayName, rightPart: post.message),
      ), error: (error, stackTrace) => SmallErrorAnim(), loading: () => const CircularProgressIndicator());
  }
}