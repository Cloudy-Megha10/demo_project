import '../controller/winner_container_controller.dart';
import 'package:get/get.dart';

class WinnerContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WinnerContainerController());
  }
}
