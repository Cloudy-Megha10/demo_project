import 'package:get/get.dart';

import '../controller/upload_competition_controller.dart';

class UploadCompetitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadCompetitionController());
  }
}
