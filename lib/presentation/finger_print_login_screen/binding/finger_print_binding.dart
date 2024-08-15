import 'package:get/get.dart';

import '../controller/finger_print_controller.dart';

class FingerPrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FingerPrintController());
  }
}
