import '../controller/action_sheet_controller.dart';
import 'package:get/get.dart';

class ActionSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActionSheetController());
  }
}
