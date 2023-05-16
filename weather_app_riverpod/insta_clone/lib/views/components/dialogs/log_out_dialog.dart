import 'package:flutter/foundation.dart';
import 'package:insta_clone/views/components/constants/strings.dart';
import 'package:insta_clone/views/components/dialogs/alert_dialog_model.dart';

@immutable
class LogOutDialog extends AlertDialogModel<bool>{
  LogOutDialog() : super(
    title: Strings.logOut,
    message: 'Are you sure ?',
    buttons: {
      Strings.logOut : true,
      Strings.cancel : false,
    }
  );
}