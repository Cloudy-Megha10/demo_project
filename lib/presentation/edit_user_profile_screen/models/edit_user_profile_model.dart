import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class EditUserProfileModel {
  RxList predictions = [].obs;
  FlutterGooglePlacesSdk googlePlace =
      FlutterGooglePlacesSdk('AIzaSyCm4FPBKMg_j0_YQlUL0KLunYBF5xe-lv8');
}
