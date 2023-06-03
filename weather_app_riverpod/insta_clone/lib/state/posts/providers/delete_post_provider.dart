

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/posts/notifiers/delete_post_notifier.dart';

import '../../image_upload/typedefs/is_loading.dart';

final deletePostProvider = StateNotifierProvider<DeletePostNotifier, IsLoading>((ref) {
  return DeletePostNotifier();
});