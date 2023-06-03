import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/user_info/providers/user_info_model_provider.dart';
import 'package:insta_clone/views/components/animations/small_error_anim.dart';
import 'package:insta_clone/views/components/rich_two_part_text.dart';

import '../../../state/comments/models/comments_model.dart';

class CompactCommentsTile extends ConsumerWidget {
  final Comment comment;
  const CompactCommentsTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  
    final userInfoProvider = ref.watch(userInfoModelProvider(comment.fromUserId));

    return userInfoProvider.when(
      data: (userInfo) {
        return RichTwoPartText(
          leftPart: userInfo.displayName, rightPart: comment.comment);
      }, error: (error, stackTrace) => const SmallErrorAnim(), loading: () => const CircularProgressIndicator.adaptive());
  }
}