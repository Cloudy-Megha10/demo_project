import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../../forgot_password_otp_verification_screen/controller/forgot_password_otp_verification_controller.dart';
import '../../voting_screen_page/controller/voting_screen_controller.dart';
import '../models/forgot_password_get_response.dart';
import 'forgot_password_repository.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();
  ForgotPasswordOtpVerificationController
      forgotPasswordOtpVerificationController =
      ForgotPasswordOtpVerificationController();

  ForgotPasswordModel forgotPasswordModelObj = ForgotPasswordModel();

  ForgotPasswordRepository forgotPasswordRepository =
      ForgotPasswordRepository();

  SecureStorage _secureStorage = SecureStorage();
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

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

  //Particular Competition Get Api

  forgotPasswordGetApi(phoneNoOrEmailId) async {
    try {
      CommonResponse<ForgotPasswordGetResponse> forgotPasswordGetResult =
          await forgotPasswordRepository
              .getForgotPasswordData(phoneNoOrEmailId);

      print("forgotPasswordGetResult");
      print(forgotPasswordGetResult.Data.data);
      if (forgotPasswordGetResult.Status == true) {
        _secureStorage.removeOtp();
        _secureStorage.setOtp(forgotPasswordGetResult.Data.data);
        Fluttertoast.showToast(
          msg: forgotPasswordGetResult.Message,
          backgroundColor: ColorConstant.gray100,
        );
        Get.toNamed(AppRoutes.forgotPasswordOtpVerificationScreen, arguments: {
          'emailIdOrMobile': phoneNoOrEmailId,
          'createdOtp': forgotPasswordGetResult.Data.data
        });
        clearData();
      } else {
        Fluttertoast.showToast(
          msg: forgotPasswordGetResult.Message,
          backgroundColor: ColorConstant.gray100,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  Future<void> registerPost({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      CommonResponse<RegisterResponse> registerResult =
          await forgotPasswordRepository.registerData(
              firstName,
              lastName,
              email,
              currentLatitude,
              currentLongitude,
              await _secureStorage.getIemiNo());
      print("registerResult");
      print(registerResult.Data.data);

      if (registerResult.Status == false) {
        print(registerResult.Data);
        print(registerResult.Message);
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
        print("fail");
      } else {
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
        print("success");
        Get.toNamed(AppRoutes.votingScreenPage)
            ?.then((value) => Get.delete<VotingScreenController>());
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  void clearData() {
    print("clearing data");
    phonenumberController.text = '';
  }

  @override
  void onClose() {
    super.onClose();
    phonenumberController.clear();
  }
}
