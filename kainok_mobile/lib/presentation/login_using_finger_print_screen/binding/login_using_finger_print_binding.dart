import 'package:get/get.dart';

import '../controller/login_using_finger_print_controller.dart';

class LoginFingerPrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginFingerPrintController());
  }
}
