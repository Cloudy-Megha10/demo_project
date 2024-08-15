import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/user_management_screen/models/user_item_model.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class UserManagementModel {
  RxList<UserManagementItemModel> usersList = RxList();
  RxList<SelectionPopupModel> userType = RxList();
  RxList predictions = [].obs;
  FlutterGooglePlacesSdk googlePlace =
      FlutterGooglePlacesSdk('AIzaSyCm4FPBKMg_j0_YQlUL0KLunYBF5xe-lv8');
}
