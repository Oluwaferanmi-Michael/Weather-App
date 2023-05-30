import 'package:flutter/foundation.dart' show immutable;
import 'package:permission_handler/permission_handler.dart';

@immutable
class AccessPermissions {

  static Future<PermissionStatus> requestImageAccessPermision() async {
    final status = await Permission.photos.request();
    if (status == PermissionStatus.granted) {
      return PermissionStatus.granted;
    } else {
      openAppSettings();
      return PermissionStatus.denied; 
    }
  }
}