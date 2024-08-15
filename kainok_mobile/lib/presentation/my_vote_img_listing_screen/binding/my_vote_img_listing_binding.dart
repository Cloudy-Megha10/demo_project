import 'package:get/get.dart';

import '../controller/my_vote_img_listing_controller.dart';

class MyVoteImgListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyVoteImgListingController());
  }
}
