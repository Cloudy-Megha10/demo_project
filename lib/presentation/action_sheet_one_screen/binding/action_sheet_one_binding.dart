import '../controller/action_sheet_one_controller.dart';
import 'package:get/get.dart';

class ActionSheetOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActionSheetOneController());
  }
}
