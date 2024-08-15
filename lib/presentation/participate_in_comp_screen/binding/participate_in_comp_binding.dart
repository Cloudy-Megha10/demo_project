import 'package:get/get.dart';
import 'package:demo_project/presentation/participate_in_comp_screen/controller/participate_in_comp_controller.dart';

class ParticipateInCompetitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ParticipateInCompetitionController());
  }
}
