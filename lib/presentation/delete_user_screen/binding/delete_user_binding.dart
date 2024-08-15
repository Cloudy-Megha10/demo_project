import '../controller/delete_user_controller.dart';
import 'package:get/get.dart';

class DeleteUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeleteUserController());
  }
}
