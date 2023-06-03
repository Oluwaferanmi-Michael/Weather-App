
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/posts/typedefs/post_id.dart';
import 'package:insta_clone/state/posts/typedefs/user_id.dart';

import '../../constants/firebase_field_names.dart';

@immutable
class Like extends MapView<String, dynamic>{

  Like({
    required PostId postId,
    required DateTime date,
    required UserId likedBy,
    }): super ({
  FirebaseFieldName.postId : postId,
  FirebaseFieldName.date : date,
  FirebaseFieldName.userId : likedBy,
  });
}