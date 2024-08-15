import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/admin_dashboard_screen/models/admin_dashboard_model.dart';

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
