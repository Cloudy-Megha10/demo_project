import 'package:get/get.dart';

import '../controller/category_listing_controller.dart';

class CategoryListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryListingController());
  }
}
