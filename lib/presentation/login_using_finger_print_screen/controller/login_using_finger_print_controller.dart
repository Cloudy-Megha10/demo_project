import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/login_using_finger_print_model.dart';

class LoginFingerPrintController extends GetxController {
  Rx<TextEditingController> otpController1 = TextEditingController().obs;
  Rx<TextEditingController> otpController2 = TextEditingController().obs;

  Rx<LoginFingerPrintModel> enterMobileNumberModelObj =
      LoginFingerPrintModel().obs;
  RxBool isSwitched1 = false.obs;
  RxBool isSwitched2 = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";

      // Use the location object here
      print("Latitude: ${location.lat}, Longitude: ${location.long}");
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
