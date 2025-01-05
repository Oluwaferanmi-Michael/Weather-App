import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/state/image_upload/models/file_type.dart';
import 'package:insta_clone/state/post_settings/models/post_setting.dart';

import '../typedefs/post_id.dart';
import '../typedefs/user_id.dart';
import 'post_key.dart';

class Post{
  final UserId userId;
  final PostId postId;
  final String message;
  final DateTime createdAt;
  final String thumbnailUrl;
  final String fileUrl;
  final FileType fileType;
  final String fileName;
  final double aspectRatio;
  final String thumbnailStorageId;
  final String originalFileStorageId;
  final Map<PostSetting, bool> postSettings;

  Post({
    required this.postId,
    required Map<String, dynamic> json
  }) : userId = json[PostKey.userId],
       message = json[PostKey.message], 
       createdAt = (json[PostKey.createdAt] as Timestamp).toDate(),
       thumbnailUrl = json[PostKey.thumbnailUrl],
       fileUrl = json[PostKey.fileUrl],
       fileType = FileType.values.firstWhere((fileType) => fileType.name == json[PostKey.fileType], orElse: () => FileType.image),
       fileName = json[PostKey.fileName],
       aspectRatio = json[PostKey.aspectRatio],
       thumbnailStorageId = json[PostKey.thumbnailStorageId],
       originalFileStorageId = json[PostKey.originalFileStorageId],
       
       postSettings = {
        PostSetting.allowLikes : true,
        PostSetting.allowComments: true,
      };

        // entry.forEach()

        // for (final entry in json[PostKey.postSettings].entries)
          // PostSetting.values.firstWhere((element) => element.storageKey == entry.key) : entry.value,
       
      

       

  bool get allowLikes => postSettings[PostSetting.allowLikes] ?? false;
  bool get allowComments => postSettings[PostSetting.allowComments] ?? false;

}