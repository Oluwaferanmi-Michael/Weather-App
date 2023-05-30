

import '../constants/strings.dart';
import 'alert_dialog_model.dart';

class DeleteDialog extends AlertDialogModel {
  const DeleteDialog({
    required String titleOfObjectToDelete
    }) : 
  super(
    title: Strings.delete,
    message: '${Strings.areYouSureYouWantToDelete} $titleOfObjectToDelete ?}',
    buttons: const {
      Strings.cancel : false,
      Strings.delete : true,
    }
  );
  
}