

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/comments/notifiers/send_comments_notifier.dart';
import 'package:insta_clone/state/image_upload/typedefs/is_loading.dart';

final sendCommentProvider = StateNotifierProvider<SendCommentsNotifier, IsLoading>((ref) => SendCommentsNotifier());