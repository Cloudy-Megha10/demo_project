import 'package:get/get.dart';
import 'package:kainok_app/presentation/voting_screen_page/controller/voting_screen_controller.dart';

class VotingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => VotingScreenController());
  }
}
