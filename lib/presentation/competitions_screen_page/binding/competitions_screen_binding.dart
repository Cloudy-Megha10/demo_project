import 'package:get/get.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';

class CompetitionsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => CompetitionsScreenController());
  }
}
