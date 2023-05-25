
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:insta_clone/state/image_upload/exceptions/thumbnail_exception.dart';
import 'package:insta_clone/state/image_upload/extensions/get_collection_name_from_file_type.dart';
import 'package:insta_clone/state/image_upload/extensions/get_image_data_aspect_ratio.dart';
import 'package:insta_clone/state/image_upload/models/file_type.dart';
import 'package:insta_clone/state/image_upload/typedefs/is_loading.dart';
import 'package:insta_clone/state/posts/models/post_payload.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../constants/firebase_collection_name.dart';
import '../constants/constants.dart';
import '../../post_settings/models/post_setting.dart';
import '../../posts/typedefs/user_id.dart';

class ImageUploadNotifier extends StateNotifier<IsLoading> {
  ImageUploadNotifier() : super(false);

  set isLoading(bool value) => state = value;
  // get isLoading => state;

  Future<bool> upload({
    required File file,
    required FileType fileType,
    required String message ,
    required Map<PostSetting, bool> postSettings,
    required UserId userId
  }) async {
    isLoading = true;
    late Uint8List thumbnailUint8;

    switch (fileType){
      case FileType.image:
        final fileAsImage = img.decodeImage(file.readAsBytesSync());
        if (fileAsImage == null ) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        }

        final thumbnail = img.copyResize(fileAsImage, width: Constants.imageThumbnailWidth);
        final thumbnailData = img.encodeJpg(thumbnail);
        thumbnailUint8 = Uint8List.fromList(thumbnailData);
        break;
      case FileType.video:
        final thumb = await VideoThumbnail.thumbnailData(
          video: file.path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: Constants.videoThumbnailMaxheight,
          quality: Constants.videoQuality
        );

        if (thumb == null ) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        } else {
          thumbnailUint8 = thumb;
        }
        break;
    }
    // calculating image aspect ratio
    final thumbnailAspectRatio = await thumbnailUint8.getImageDataAspectRatio();

    // calculate references
    final fileName = const Uuid().v4();

    final thumbnailRef = FirebaseStorage.instance.ref().child(
      userId
    ). child(FirebaseCollectionName.thumbnails). child(fileName);

    final originalFileRef = FirebaseStorage.instance.ref().child(fileType.collectionName);


    try {
      // upload thumbnail
      final thumbnailUploadTask = await thumbnailRef.putData(thumbnailUint8);
      final thumbnailStorageId = thumbnailUploadTask.ref.name;

      // upload file
      final originalFileUploadTask = await originalFileRef.putFile(file);
      final originalFileStorageId = originalFileUploadTask.ref.name;

      // post Payload
      final postPayLoad = PostPayLoad(
        userId: userId,
        message: message,
        thumbnailUrl: await thumbnailRef.getDownloadURL(),
        fileUrl: await originalFileRef.getDownloadURL(),
        fileName: fileName,
        fileType: fileType,
        aspectRatio: thumbnailAspectRatio,
        thumbnailStorageId: thumbnailStorageId,
        originalFileStorageId: originalFileStorageId,
        postSettings: postSettings
        );

        await FirebaseFirestore.instance.collection(FirebaseCollectionName.posts).add(postPayLoad);
        return true;

    } catch (e) {
      return false;
    } finally {
      isLoading = false;
    }

    // return; 
  }
}