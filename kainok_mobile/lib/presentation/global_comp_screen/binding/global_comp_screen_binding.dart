import 'package:get/get.dart';

import '../controller/global_comp_screen_controller.dart';

class GlobalCompScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => GlobalCompScreenController());
  }
}
