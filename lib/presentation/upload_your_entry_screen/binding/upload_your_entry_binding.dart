import 'package:get/get.dart';
import 'package:demo_project/presentation/upload_your_entry_screen/controller/upload_your_entry_controller.dart';

class UploadYourEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadYourEntryController());
  }
}
