import 'package:get/get.dart';

import '../controller/signup_guest_user_controller.dart';

class SignUpGuestUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpGuestUserController());
  }
}
