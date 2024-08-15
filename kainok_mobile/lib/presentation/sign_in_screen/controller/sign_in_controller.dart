import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/sign_in_screen/controller/sign_in_repository.dart';
import 'package:kainok_app/presentation/sign_in_screen/models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/presentation/sign_in_screen/models/sign_in_response.dart';
import 'package:kainok_app/presentation/sign_in_screen/models/sign_in_through_google_response.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../../voting_screen_page/controller/voting_screen_controller.dart';
import '../../image_details_screen_container_screen/controller/image_details_screen_container_controller.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxBool selected = false.obs;

  TextEditingController passwordController = TextEditingController();

  Rx<SignInModel> signInModelObj = SignInModel().obs;

  SecureStorage _secureStorage = SecureStorage();

  Rx<bool> isShowPassword = true.obs;

  SignInRepositoty signInRepository = SignInRepositoty();

  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  dynamic userId = "".obs;

  //RxBool isLoading = false.obs;

  ImageDetailsScreenContainerController imageDetailsScreenContainerController =
      ImageDetailsScreenContainerController();

  @override
  void onReady() async {
    super.onReady();
    userId = await _secureStorage.getUserId();
    getLocation();
  }

  var imeiNumber = ''.obs;

  Future<void> registerPost({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      CommonResponse<SignInThroughGoogleResponse> loginResultThroughGoogle =
          await signInRepository.registerData(
              firstName,
              lastName,
              email,
              currentLatitude,
              currentLongitude,
              await _secureStorage.getIemiNo());

      if (loginResultThroughGoogle.Status) {
        print("signInResult---");
        print(loginResultThroughGoogle.Data.data);
        print(loginResultThroughGoogle.Status);
        print(loginResultThroughGoogle.Message);
        _secureStorage
            .setUserId(loginResultThroughGoogle.Data.data.id.toString());
        _secureStorage.setUserTypeId(
            loginResultThroughGoogle.Data.data.userType.toString());
        _secureStorage
            .setUserType(loginResultThroughGoogle.Data.data.isAdmin.toString());
        _secureStorage
            .setEmail(loginResultThroughGoogle.Data.data.emailId.toString());
        _secureStorage.setFirstName(
            loginResultThroughGoogle.Data.data.firstName.toString());
        _secureStorage.setLastName(
            loginResultThroughGoogle.Data.data.lastName.toString());
        _secureStorage
            .setMobileNumber(loginResultThroughGoogle.Data.data.mobileNumber);
        _secureStorage.setSessionId(
            loginResultThroughGoogle.Data.data.sessionId.toString());
        _secureStorage.setIsLoggedOut("false");
        Fluttertoast.showToast(
          msg: loginResultThroughGoogle.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
      } else {
        Fluttertoast.showToast(
          msg: loginResultThroughGoogle.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
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

  void clearData() {
    print("clearing data");
    passwordController.text = '';
    emailController.text = "";
  }

  Future<void> loginPost(
      {required String email, required String password}) async {
    try {
      CommonResponse<LogInResponse> loginResult =
          await signInRepository.loginData(email, password, currentLatitude,
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

  @override
  void onClose() {
    super.onClose();
  }
}
