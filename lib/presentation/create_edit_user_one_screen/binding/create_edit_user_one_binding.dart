import '../controller/create_edit_user_one_controller.dart';
import 'package:get/get.dart';

class CreateEditUserOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEditUserOneController());
  }
}
