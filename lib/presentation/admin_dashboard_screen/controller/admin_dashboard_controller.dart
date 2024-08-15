import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/admin_dashboard_screen/models/admin_dashboard_model.dart';

class AdminDashboardController extends GetxController {
  Rx<AdminDashboardModel> adminDashboardModelObj = AdminDashboardModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
