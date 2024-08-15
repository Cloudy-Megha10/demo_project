import '../controller/image_details_screen_container_controller.dart';
import 'package:get/get.dart';

class ImageDetailsScreenContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageDetailsScreenContainerController());
  }
}
