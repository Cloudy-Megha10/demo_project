import 'package:get/get.dart';

import '../controller/edit_user_profile_controller.dart';

class EditUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditUserProfileController());
  }
}
