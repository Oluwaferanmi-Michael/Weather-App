

import 'package:flutter/material.dart';
import 'package:insta_clone/state/image_upload/models/file_type.dart';
import 'package:insta_clone/state/posts/models/post.dart';
import 'package:insta_clone/views/components/post/post_image_view.dart';
import 'package:insta_clone/views/components/post/post_video_view.dart';

class ImageOrVideoVideo extends StatelessWidget {
  final Post post;
  const ImageOrVideoVideo({super.key, required  this.post});

  @override
  Widget build(BuildContext context) {
    switch (post.fileType) {
      case FileType.image:
        return PostImageiew(post: post);
      case FileType.video:
        return PostVideoView(post: post);
    }
  }
}