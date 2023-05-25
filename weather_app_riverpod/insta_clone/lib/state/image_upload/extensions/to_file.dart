
import 'package:image_picker/image_picker.dart';
import 'dart:io';

extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile?.path).then((filePath) => filePath != null ? File(filePath) : null);
}