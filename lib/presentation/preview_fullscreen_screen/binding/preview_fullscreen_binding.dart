import '../controller/preview_fullscreen_controller.dart';
import 'package:get/get.dart';

class PreviewFullscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreviewFullscreenController());
  }
}
