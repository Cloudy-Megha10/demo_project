import 'package:get/get.dart';
import 'admindashboard_item_model.dart';

class AdminDashboardModel {
  Rx<List<AdmindashboardItemModel>> admindashboardItemList =
      Rx(List.generate(4, (index) => AdmindashboardItemModel()));
}
