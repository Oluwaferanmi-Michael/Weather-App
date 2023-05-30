import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/state/auth/providers/user_id_provider.dart';
import 'package:insta_clone/state/comments/models/comments_model.dart';
import 'package:insta_clone/state/comments/providers/delete_comment_provider.dart';
import 'package:insta_clone/state/user_info/providers/user_info_model_provider.dart';
import 'package:insta_clone/views/components/animations/loading_anim.dart';
import 'package:insta_clone/views/components/animations/small_error_anim.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/dialogs/alert_dialog_model.dart';
import 'package:insta_clone/views/components/dialogs/delete_dialog.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoModelProvider(comment.fromUserId));

    return userInfo.when(
      data: (userInfo) {
        final currentUser = ref.read(userIdProvider);
        
      return ListTile(
        title: Text(userInfo.displayName),

        subtitle: Text(comment.comment),

        trailing: currentUser == comment.fromUserId ? IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final deleteDialog = await displayDeleteDialog(context);

            if (deleteDialog) {
              await ref.watch(deleteCommentProvider.notifier).deleteComment(commentId: comment.id);
            }
          },
        ) : null,
    );
      },
      loading: () => const Center(
        child: LoadinAnim(),
      ),
      error: (error, stackTrace) => const SmallErrorAnim(),
    );
    
    
    
  }

  Future<bool> displayDeleteDialog(BuildContext context) =>
  const DeleteDialog(
    titleOfObjectToDelete: Strings.comments
    ).present(context)
    .then((value) => value ?? false);
}



