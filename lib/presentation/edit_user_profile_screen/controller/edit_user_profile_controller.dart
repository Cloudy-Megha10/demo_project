import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/controller/profile_deatils_my_participation_tab_container_controller.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/edit_user_profile_model.dart';
import '../models/get_user_response.dart';
import '../models/update_user_response.dart';
import 'edit_user_profile_repository.dart';

class EditUserProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController msgBioController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  EditUserProfileModel editProfileModelObj = EditUserProfileModel();

  EditUserProfileRepository editProfileRepository = EditUserProfileRepository();

  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  RxList<String> locationList = [""].obs;
  RxBool isSelected = false.obs;
  RxString? _selectedCity;

  @override
  void onReady() {
    super.onReady();
    getLocation();
    getUserDetails();
    cityController.addListener(() {
      onChange();
    });
  }

  selectedValue(String value) {
    cityController.text = value;
    _selectedCity!.value = cityController.text;
    isSelected.value = true;
  }

  Future<void> onChange() async {
    if (cityController.text == null || cityController.text == "") {
      print("empty");
    } else {
      autoCompleteSearch(cityController.text);
      print("cityController");
      print(cityController.text);
    }
  }

  void getUserDetails() async {
    try {
      CommonResponse<GetUserResponse> userGetResult =
          await editProfileRepository.getUserData();
      print("response");
      print(userGetResult.Data);
      firstNameController.text = userGetResult.Data.data.firstName;
      lastNameController.text = userGetResult.Data.data.lastName;
      emailController.text = userGetResult.Data.data.emailId;
      msgBioController.text = userGetResult.Data.data.description;

      String location = userGetResult.Data.data.location;
      List<String> coordinates = location.split(',');
      print("coordinates");
      print(coordinates);

      if (coordinates.length == 2) {
        double latitude = double.parse(coordinates[0].trim());
        double longitude = double.parse(coordinates[1].trim());
        print(latitude);
        print(longitude);

        List<Placemark> placemarks = await placemarkFromCoordinates(
            latitude.toDouble(), longitude.toDouble());
        print(placemarks);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          String address =
              '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
          cityController.text = address;
          print("cityController.text");
          print(cityController.text);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  autoCompleteSearch(String value) async {
    FindAutocompletePredictionsResponse result = await editProfileModelObj
        .googlePlace
        .findAutocompletePredictions(value);
    if (result != null && result.predictions != null) {
      print("result");
      print(result.predictions);
      locationList.clear();
      for (var entry in result.predictions) {
        locationList.add(entry.fullText);
      }
      editProfileModelObj.predictions = result.predictions.obs;
    }
  }

  Future<void> profileUpdateApi({
    required String firstName,
    required String lastName,
    required String emailId,
    required String city,
    required String bio,
  }) async {
    print("city");
    print(city);
    try {
      var coordniates = GeoLocationUtils.getLatLogByAddress(city);
      print(coordniates.toString());
      coordniates.then((location) async {
        CommonResponse<UserUpdateResponse> updateUserResponse =
            await editProfileRepository.updateUserData(
                firstName, lastName, emailId, city, bio, location);

        if (updateUserResponse.Status == false) {
          print(updateUserResponse.Data);
          print(updateUserResponse.Message);
          Fluttertoast.showToast(
            msg: updateUserResponse.Message,
            backgroundColor: Colors.grey,
          );
          print("fail");
        } else {
          Fluttertoast.showToast(
            msg: updateUserResponse.Message,
            backgroundColor: Colors.grey,
          );
          print("success");
          Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
              ?.then((value) => Get.delete<
                  ProfileDeatilsMyParticipationTabContainerController>());
        }
      });
    } catch (e) {
      String errormsg = "Error in Catch Block " + e.toString();
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

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    msgBioController.dispose();
  }
}
