import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/action_sheet_screen/models/action_sheet_model.dart';

class ActionSheetController extends GetxController {
  Rx<ActionSheetModel> actionSheetModelObj = ActionSheetModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
