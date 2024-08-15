import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/action_sheet_one_screen/models/action_sheet_one_model.dart';

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
