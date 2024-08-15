import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/create_account_screen/models/register_through_google_response.dart';
import 'package:kainok_app/presentation/sign_in_screen/models/sign_in_response.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../models/create_account_model.dart';
import 'create_account_repository.dart';

class CreateAccountController extends GetxController {
  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<CreateAccountModel> createAccountModelObj = CreateAccountModel().obs;
  TextEditingController mobileNoController = TextEditingController();

  SelectionPopupModel? selectedDropDownValue;
  RegisterRepository registerRepository = RegisterRepository();
  SecureStorage _secureStorage = SecureStorage();
  Rx<bool> isShowPassword = true.obs;
  RxBool selected = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

  @override
  void onReady() async {
    super.onReady();
    var mobileNo = await _secureStorage.getDeviceInfoMobileNo();
    if (mobileNo != null && mobileNo != "") {
      mobileNoController.text = mobileNo;
    }
    requestPermission();
    getLocation();
  }

  var imeiNumber = ''.obs;

  void requestPermission() async {
    PermissionStatus status = await Permission.phone.request();
    if (status.isGranted) {
      // Permission granted, proceed with fetching IMEI number
      fetchIMEINumber();
    } else {
      // Permission denied, handle accordingly
      print('Permission denied.');
    }
  }

  fetchIMEINumber() async {
    var imeiNo = await PlatformDeviceId.getDeviceId;
    _secureStorage.setIemiNumber(imeiNo!);
  }

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

  Future<void> registerThroughGoogle({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      CommonResponse<RegisterThroughGoogleResponse>
          registerResultThroughGoogle =
          await registerRepository.registerThroughGoogleData(
              firstName,
              lastName,
              email,
              currentLatitude,
              currentLongitude,
              await _secureStorage.getIemiNo());

      if (registerResultThroughGoogle.Status) {
        _secureStorage
            .setUserId(registerResultThroughGoogle.Data.data.id.toString());
        _secureStorage.setUserTypeId(
            registerResultThroughGoogle.Data.data.userType.toString());
        _secureStorage.setUserType(
            registerResultThroughGoogle.Data.data.isAdmin.toString());
        _secureStorage
            .setEmail(registerResultThroughGoogle.Data.data.emailId.toString());
        _secureStorage.setFirstName(
            registerResultThroughGoogle.Data.data.firstName.toString());
        _secureStorage.setLastName(
            registerResultThroughGoogle.Data.data.lastName.toString());
        _secureStorage.setMobileNumber(
            registerResultThroughGoogle.Data.data.mobileNumber);
        _secureStorage.setSessionId(
            registerResultThroughGoogle.Data.data.sessionId.toString());
        _secureStorage.setIsLoggedOut("false");
        Fluttertoast.showToast(
          msg: registerResultThroughGoogle.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
      } else {
        Fluttertoast.showToast(
          msg: registerResultThroughGoogle.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> loginPost(
      {required String email, required String password}) async {
    try {
      CommonResponse<LogInResponse> loginResult =
          await registerRepository.loginData(email, password, currentLatitude,
              currentLongitude, await _secureStorage.getIemiNo());
      print("loginResult");
      print(loginResult);
      print(loginResult.Status);
      print(loginResult.Message);
      if (loginResult.Status) {
        _secureStorage.setUserId(loginResult.Data.data.id.toString());
        _secureStorage.setUserTypeId(loginResult.Data.data.userType.toString());
        _secureStorage.setUserType(loginResult.Data.data.isAdmin.toString());
        _secureStorage.setEmail(loginResult.Data.data.emailId.toString());
        _secureStorage.setFirstName(loginResult.Data.data.firstName.toString());
        _secureStorage.setLastName(loginResult.Data.data.lastName.toString());
        _secureStorage.setMobileNumber(loginResult.Data.data.mobileNumber);
        _secureStorage.setSessionId(loginResult.Data.data.sessionId.toString());
        _secureStorage.setIsLoggedOut("false");

        Fluttertoast.showToast(
          msg: loginResult.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
        clearData();
      } else {
        Fluttertoast.showToast(
          msg: loginResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> registerPost({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String city,
    required String password,
  }) async {
    try {
      CommonResponse<RegisterResponse> registerResult =
          await registerRepository.registerData(
              await _secureStorage.getFirstName(),
              await _secureStorage.getLastName(),
              await _secureStorage.getMobileNumber(),
              await _secureStorage.getEmail(),
              await _secureStorage.getCity(),
              await _secureStorage.getPassword(),
              await _secureStorage.getIemiNo());
      print("registerResult");

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
        Get.toNamed(AppRoutes.signInScreen);
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  void clearData() {
    firstnameController.text = '';
    lastnameController.text = '';
    emailController.text = '';
    cityController.text = '';
    passwordController.text = '';
    mobileNoController.text = "";
  }

  Future<void> saveRegisterDetails(
      {required String firstName,
      required String lastName,
      required String email,
      required String city,
      required String password,
      required String mobileNo}) async {
    try {
      await _secureStorage.setFirstName(firstName);
      await _secureStorage.setLastName(lastName);
      await _secureStorage.setEmail(email);
      await _secureStorage.setCity(city);
      await _secureStorage.setPassword(password);
      await _secureStorage.setMobileNumber(mobileNo);
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
