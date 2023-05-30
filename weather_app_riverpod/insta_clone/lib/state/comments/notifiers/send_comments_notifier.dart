import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/comments/models/comment_payload.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/image_upload/typedefs/is_loading.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';

import '../../posts/typedefs/user_id.dart';

class SendCommentsNotifier extends StateNotifier<IsLoading> {
  SendCommentsNotifier(): super(false);

  set isLoading(bool value) => state = value;

  Future<bool> sendComment({
    required UserId fromUserId,
    required PostId fromPostId,
    required String comment
  }) async {

    final payload = CommentPayload(fromUserId: fromUserId, fromPostId: fromPostId, comment: comment);

    await FirebaseFirestore.instance.collection(FirebaseCollectionName.comments).add(payload);

    try {
      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }
  }
  
}