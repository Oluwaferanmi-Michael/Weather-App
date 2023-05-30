import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/comments/notifiers/delete_comment_notifier.dart';
import 'package:insta_clone/state/image_upload/typedefs/is_loading.dart';

final deleteCommentProvider = StateNotifierProvider<CommentDeletionNotifier, IsLoading>((ref) {
  return CommentDeletionNotifier();
});