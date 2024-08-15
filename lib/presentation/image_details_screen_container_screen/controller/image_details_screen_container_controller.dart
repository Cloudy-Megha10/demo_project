import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../widgets/custom_bottom_bar.dart';
import '../models/image_details_screen_container_model.dart';

class ImageDetailsScreenContainerController extends GetxController {
  Rx<ImageDetailsScreenContainerModel> imageDetailsScreenContainerModelObj =
      ImageDetailsScreenContainerModel().obs;
  Rx<BottomBarEnum> type = BottomBarEnum.Competition.obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
    type = BottomBarEnum.Competition.obs;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
