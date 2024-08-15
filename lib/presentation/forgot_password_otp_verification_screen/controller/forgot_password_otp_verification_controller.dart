import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/presentation/forgot_password_otp_verification_screen/models/forgot_password_otp_verification_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/otp_validated_get_response.dart';
import 'otp_validate_repository.dart';

class ForgotPasswordOtpVerificationController extends GetxController
    with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<ForgotPasswordOtpVerificationModel> forgotPasswordOtpVerificationModelObj =
      ForgotPasswordOtpVerificationModel().obs;

  SecureStorage _secureStorage = SecureStorage();

  OtpValidateRepository otpValidateRepository = OtpValidateRepository();

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() async {
    super.onReady();
    // otpController.value.text = (await _secureStorage.getOtp())!;
  }

  void clearData() {
    print("clearing data");
    otpController.value.text = '';
  }

  //Particular Competition Get Api

  otpVerificationGetApi(otpValidated, emailIdOrMobile) async {
    try {
      CommonResponse<OtpValidatedGetResponse> otpValidatedGetResult =
          await otpValidateRepository.getOtpValidatedData(
              otpValidated, emailIdOrMobile);

      print("otpValidatedGetResult");
      print(otpValidatedGetResult.Data.data);
      if (otpValidatedGetResult.Status == true) {
        Fluttertoast.showToast(
          msg: otpValidatedGetResult.Message,
          backgroundColor: ColorConstant.gray100,
        );
        Get.toNamed(AppRoutes.newPasswordScreen,
            arguments: {'emailIdOrMobile': emailIdOrMobile});
        clearData();
      } else {
        Fluttertoast.showToast(
          msg: otpValidatedGetResult.Message,
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

  @override
  void onClose() {
    super.onClose();
  }
}
