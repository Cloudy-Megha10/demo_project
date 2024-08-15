import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:demo_project/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../../voting_screen_page/controller/voting_screen_controller.dart';
import '../models/log_in_model.dart';
import 'login_repository.dart';

class LogInController extends GetxController {
  LoginModel loginModelObj = LoginModel();
  LoginRepository loginRepository = LoginRepository();
  SecureStorage _secureStorage = SecureStorage();
  RxString currentLatitude = ''.obs;
  RxString currentLongitude = ''.obs;
  var imeiNo;
  var iemiNumber;

  @override
  void onReady() {
    super.onReady();
    requestPermission();
  }

  getLocation() async {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) async {
      currentLatitude.value = '${location.lat}';
      currentLongitude.value = '${location.long}';

      // Use the location object here
      print('Latitude: ${location.lat}, Longitude: ${location.long}');
    });
  }

  Future<void> registerPost({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      CommonResponse<RegisterResponse> registerResult =
          await loginRepository.registerData(
              firstName,
              lastName,
              email,
              currentLatitude,
              currentLongitude,
              await _secureStorage.getIemiNo());

      if (registerResult.Status == false) {
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
      } else {
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> requestPermission() async {
    PermissionStatus status = await Permission.phone.request();
    if (status.isGranted) {
      fetchIMEINumber();
      getLocation();
    }
  }

  fetchIMEINumber() async {
    imeiNo = await PlatformDeviceId.getDeviceId;
    _secureStorage.setIemiNumber(imeiNo);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
