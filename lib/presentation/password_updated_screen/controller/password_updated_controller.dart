import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/password_updated_screen/models/password_updated_model.dart';

class PasswordUpdatedController extends GetxController {
  Rx<PasswordUpdatedModel> passwordUpdatedModelObj = PasswordUpdatedModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
