import '../controller/password_updated_controller.dart';
import 'package:get/get.dart';

class PasswordUpdatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordUpdatedController());
  }
}
