import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material show Image;
import 'package:insta_clone/state/image_upload/extensions/get_aspect_ratio.dart';

extension GetImageDataAspectRatio on Uint8List {
  Future<double> getImageDataAspectRatio() async {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }

}