import '../controller/preview_controller.dart';
import 'package:get/get.dart';

class PreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreviewController());
  }
}
