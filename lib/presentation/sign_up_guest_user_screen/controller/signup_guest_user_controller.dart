import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/sign_up_guest_user_screen/controller/signup_guest_user_.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../../voting_screen_page/controller/voting_screen_controller.dart';
import '../models/signup_guest_user_.dart';
import '../models/signup_guest_user_model.dart';

class SignUpGuestUserController extends GetxController {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignUpGuestUserModel> createAccountModelObj = SignUpGuestUserModel().obs;

  SelectionPopupModel? selectedDropDownValue;
  SignUpGuestUserRepository signUpGuestUserRepository =
      SignUpGuestUserRepository();
  SecureStorage _secureStorage = SecureStorage();
  Rx<bool> isShowPassword = true.obs;
  RxBool selected = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  dynamic userId = "";

  @override
  void onReady() async {
    super.onReady();
    userId = await _secureStorage.getUserId();
    var mobileNo = await _secureStorage.getDeviceInfoMobileNo();
    if (mobileNo != null && mobileNo != "") {
      mobileNoController.text = mobileNo;
    }
    getLocation();
  }

  var imeiNumber = ''.obs;

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";
      cityController.text = location.address;

      // Use the location object here
      print("Latitude: ${location.lat}, Longitude: ${location.long}");
    });
  }

  Future<void> signUpGuestUser({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String city,
    required String password,
    required bool isSocialMediaUser,
    required String socialMediaName,
  }) async {
    try {
      await _secureStorage.setFirstName(firstName);
      await _secureStorage.setLastName(lastName);
      await _secureStorage.setEmail(email);
      await _secureStorage.setCity(city);
      await _secureStorage.setPassword(password);
      await _secureStorage.setMobileNumber(mobileNumber);
      CommonResponse<SignUpGuestUserResponse> guestUserRegistration =
          await signUpGuestUserRepository.updateGuestUserRegistration(
              firstName,
              lastName,
              mobileNumber,
              email,
              city,
              password,
              isSocialMediaUser,
              socialMediaName);

      if (guestUserRegistration.Status) {
        Fluttertoast.showToast(
          msg: guestUserRegistration.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.signInScreen);
      } else {
        Fluttertoast.showToast(
          msg: "msg_something_went_wrong".tr,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  void clearData() {
    print("clearing data");
    firstnameController.text = '';
    lastnameController.text = '';
    emailController.text = '';
    cityController.text = '';
    passwordController.text = '';
  }

  @override
  void onClose() {
    super.onClose();
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    createAccountModelObj.value.dropdownItemList.value.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    createAccountModelObj.value.dropdownItemList.refresh();
  }
}
