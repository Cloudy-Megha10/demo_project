import '../controller/profile_deatils_my_participation_tab_container_controller.dart';
import 'package:get/get.dart';

class ProfileDeatilsMyParticipationTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => ProfileDeatilsMyParticipationTabContainerController());
  }
}
