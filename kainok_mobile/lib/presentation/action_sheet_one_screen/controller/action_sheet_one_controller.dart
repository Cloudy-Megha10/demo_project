import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/action_sheet_one_screen/models/action_sheet_one_model.dart';

class ActionSheetOneController extends GetxController {
  Rx<ActionSheetOneModel> actionSheetOneModelObj = ActionSheetOneModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
