import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../../create_account_screen/controller/create_account_repository.dart';
import '../../create_account_screen/models/register_response.dart';
import '../models/enter_mobile_number_model.dart';
import '../models/register_response.dart';
import 'enter_otp_repository.dart';

class EnterOtpController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  SecureStorage _secureStorage = SecureStorage();

  OtpRepository _otpRepository = OtpRepository();

  RxString mobileNumber = "".obs;

  Rx<EnterMobileNumberModel> enterMobileNumberModelObj =
      EnterMobileNumberModel().obs;

  @override
  void codeUpdated() {
    otpController.value.text = code!;
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  // ///////////////////// POST Login Create

  // Future<void> logInPost({
  //   required String username,
  //   required String password,
  // }) async {
  //   try {
  //     CommonResponse<LogInResponse> logInResult =
  //         await _logInRepository.loginPostData(
  //       username,
  //       password,
  //     );
  //     print("lognresult");

  //     if (logInResult.statuscode == '1') {
  //       print("fail");
  //     } else {
  //       print("success");

  //       // _secureStorage.setStaffName(logInResult.data.userFirstName);
  //       // _secureStorage.setDesignation(logInResult.data.roles[0].name);
  //       Get.toNamed(AppRoutes.homeScreenPage);
  //     }
  //   } catch (e) {
  //     String errormsg = "Error in Catch Block" + e.toString();
  //     print("error");
  //   }
  // }

  @override
  void onReady() async {
    super.onReady();
    mobileNumber.value = (await _secureStorage.getMobileNumber())!;
    print("mobileNumber.value");
    print(mobileNumber.value);
  }

  ///////////////////// POST Login Create

  Future<void> registerPost() async {
    try {
      CommonResponse<RegisterResponse> registerResult =
          await _otpRepository.registerData(
              await _secureStorage.getFirstName(),
              await _secureStorage.getLastName(),
              await _secureStorage.getMobileNumber(),
              await _secureStorage.getEmail(),
              await _secureStorage.getCity(),
              await _secureStorage.getPassword(),
              await _secureStorage.getIemiNo());
      if (registerResult.Status) {
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.signInScreen);
      } else {
        Fluttertoast.showToast(
          msg: registerResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
