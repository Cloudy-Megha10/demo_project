import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/finger_print_model.dart';

class FingerPrintController extends GetxController {
  Rx<TextEditingController> otpController1 = TextEditingController().obs;
  Rx<TextEditingController> otpController2 = TextEditingController().obs;

  Rx<FingerPrintModel> enterMobileNumberModelObj = FingerPrintModel().obs;
  RxBool isSwitched1 = false.obs;
  RxBool isSwitched2 = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
