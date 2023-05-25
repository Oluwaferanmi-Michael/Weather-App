import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:insta_clone/state/posts/models/post_key.dart';
import 'package:insta_clone/state/posts/typedefs/user_id.dart';

import '../../image_upload/models/file_type.dart';
import '../../post_settings/models/post_setting.dart';

@immutable
class PostPayLoad extends MapView<String, dynamic> {
  
  PostPayLoad({
    required  UserId userId,
    required  String message,
    // required  String thumbnail,
    required  String thumbnailUrl,
    required  String fileUrl,
    required  String fileName,
    required  FileType fileType,
    required  double aspectRatio,
    required  String thumbnailStorageId,
    required  String originalFileStorageId,
    required Map<PostSetting, bool> postSettings,
  }) : super({
    PostKey.userId: userId,
    PostKey.message: message,
    PostKey.createdAt: FieldValue.serverTimestamp(),
    PostKey.thumbnailUrl: thumbnailUrl,
    PostKey.fileType: fileType.name,
    PostKey.fileName: fileName,
    PostKey.aspectRatio: aspectRatio,
    PostKey.thumbnailStorageId: thumbnailStorageId,
    PostKey.originalFileStorageId: thumbnailStorageId,
    PostKey.postSettings : {
      for (final postSetting in postSettings.entries){
        postSetting.key.storageKey: postSetting.value
      }
    }
  });
 
}