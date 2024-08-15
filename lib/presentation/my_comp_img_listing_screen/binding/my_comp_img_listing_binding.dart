import 'package:get/get.dart';

import '../controller/my_comp_img_listing_controller.dart';

class MyCompImgListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCompImgListingController());
  }
}
