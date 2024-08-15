import 'dart:convert';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../models/enter_mobile_number_one_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EnterMobileNumberOneController extends GetxController {
  TextEditingController phonenumberController = TextEditingController();
  SecureStorage _secureStorage = SecureStorage();

  Rx<EnterMobileNumberOneModel> enterMobileNumberOneModelObj =
      EnterMobileNumberOneModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;

  @override
  void onReady() {
    super.onReady();
  }

  void clearData() {
    print("clearing data");
    phonenumberController.text = '';
  }

  Future<void> saveMobileNumber({required String mobileNumber}) async {
    try {
      print("phonenumberController.text");
      print(phonenumberController.text);
      _secureStorage.setMobileNumber(phonenumberController.text);
      clearData();
      Get.toNamed(AppRoutes.enterOtpScreen);
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      Fluttertoast.showToast(
        msg: errormsg,
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    phonenumberController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    enterMobileNumberOneModelObj.value.dropdownItemList.value
        .forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    enterMobileNumberOneModelObj.value.dropdownItemList.refresh();
  }
}
