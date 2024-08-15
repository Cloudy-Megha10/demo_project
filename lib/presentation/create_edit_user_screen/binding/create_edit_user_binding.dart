import '../controller/create_edit_user_controller.dart';
import 'package:get/get.dart';

class CreateEditUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEditUserController());
  }
}
