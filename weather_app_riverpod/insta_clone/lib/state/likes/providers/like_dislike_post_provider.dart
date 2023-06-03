


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/constants/firebase_collection_name.dart';
import 'package:insta_clone/state/constants/firebase_field_names.dart';
import 'package:insta_clone/state/likes/model/like.dart';
import 'package:insta_clone/state/likes/model/like_dislike_request_model.dart';

final likeDislikePostProvider = FutureProvider.family.autoDispose<bool, LikeDislikeRequest>((ref, LikeDislikeRequest request) async {

  final query = FirebaseFirestore.instance.collection(FirebaseCollectionName.likes).where(
    FirebaseFieldName.postId, isEqualTo: request.postId
  ).where(
    FirebaseFieldName.userId, isEqualTo: request.likedBy
  ).get();

  //  see if user has liked Post Already
  final hasLiked = await query.then((value) => value.docs.isNotEmpty);

  if (hasLiked) {
    // delete Like
    try {
      await query.then((value) async {
        for(final doc in value.docs) {
          await doc.reference.delete();
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  } else {
    // post a Like Object
    final like = Like(postId: request.postId, date: DateTime.now(), likedBy: request.likedBy);

    try {
      await FirebaseFirestore.instance.collection(FirebaseCollectionName.likes).add(like);
      return true;
    } catch (_) {
      return false;
    }
  }

});