import '../controller/image_listing_controller.dart';
import 'package:get/get.dart';

class ImageListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompImageListingController());
  }
}
