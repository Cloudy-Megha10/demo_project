import '../controller/enter_mobile_number_one_controller.dart';
import 'package:get/get.dart';

class EnterMobileNumberOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterMobileNumberOneController());
  }
}
