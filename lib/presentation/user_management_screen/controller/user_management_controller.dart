import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/date_time_utils.dart';
import 'package:demo_project/presentation/user_management_screen/controller/user_management_repository.dart';
import 'package:demo_project/presentation/user_management_screen/models/user_management_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../../create_edit_user_screen/models/create_user_response.dart';
import '../../create_edit_user_screen/models/get_user_details_by_id_response.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../../edit_profile_screen/models/get_user_response.dart';
import '../../edit_profile_screen/models/update_user_response.dart';
import '../models/get_all_user_response.dart';
import '../models/user_item_model.dart';

class UserManagementController extends GetxController {
  TextEditingController usertypeController = TextEditingController();

  TextEditingController usertypeoneController = TextEditingController();

  TextEditingController usertypetwoController = TextEditingController();

  TextEditingController usertypethreeController = TextEditingController();

  TextEditingController usertypefourController = TextEditingController();

  TextEditingController usertypefiveController = TextEditingController();

  TextEditingController usertypesixController = TextEditingController();

  TextEditingController usertypesevenController = TextEditingController();

  TextEditingController usertypeeightController = TextEditingController();

  UserManagementModel userManagementModelObj = UserManagementModel();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  RxString likedController = "".obs;
  RxString disLikedController = "".obs;

  EditUserManagementRepository editUserManagementRepository =
      EditUserManagementRepository();

  RxString counts = "".obs;

  RxString selectedId = "".obs;

  RxList<String> locationList = [""].obs;

  RxString? _selectedCity;

  RxInt userTypeId = 1003.obs;

  RxString selectedUserId = "".obs;

  RxString firstName = "".obs;

  RxString lastName = "".obs;
  RxBool isActive = true.obs;

  @override
  void onReady() {
    super.onReady();
    getAllUserDetails();
    userTypeGetApi();
    cityController.addListener(() {
      onChange();
    });
    //userTypeDetailsByIdGetApi(selectedId.value);
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

  selectedValue(String value) {
    cityController.text = value;
    _selectedCity!.value = cityController.text;
  }

  autoCompleteSearch(String value) async {
    FindAutocompletePredictionsResponse result = await userManagementModelObj
        .googlePlace
        .findAutocompletePredictions(value);
    if (result != null && result.predictions != null) {
      print("result");
      print(result.predictions);
      locationList.clear();
      for (var entry in result.predictions) {
        locationList.add(entry.fullText);
      }
      userManagementModelObj.predictions = result.predictions.obs;
    }
  }

  userTypeGetApi() async {
    try {
      CommonResponse<GetAllUserType> allUserTypeGetResult =
          await editUserManagementRepository.getUserType();

      for (var entry in allUserTypeGetResult.Data.data) {
        // competitionTitle.value = entry.title.toString();
        SelectionPopupModel allUserTypeModel =
            SelectionPopupModel(id: entry.id, title: entry.name);
        userManagementModelObj.userType.add(allUserTypeModel);
        print("allUserTypeGetResult");
        print(allUserTypeModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  Future<void> profileUpdateApi({
    required String firstName,
    required String lastName,
    required String emailId,
    required String mobileNumber,
    required String userTypeId,
    required String userId,
    required String city,
    required String bio,
    required dynamic isActive,
  }) async {
    try {
      CommonResponse<UserUpdateResponse> updateUserResponse =
          await editUserManagementRepository.updateUserData(firstName, lastName,
              emailId, mobileNumber, userTypeId, userId, city, bio, isActive);
      print("updateUserResponse");
      print(updateUserResponse.Status);

      if (updateUserResponse.Status == false) {
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
        clearData();

        Get.toNamed(AppRoutes.userManagementScreen);
        getAllUserDetails();
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> createUserPost({
    required String firstName,
    required String lastName,
    required String mobileNumber,
    required String email,
    required String city,
    required String password,
    required String userTypeId,
    required String likedPoints,
    required String disLikedPoints,
    required String description,
  }) async {
    try {
      CommonResponse<CreateUserResponse> createUserResult =
          await editUserManagementRepository.createUserData(
              firstName,
              lastName,
              mobileNumber,
              email,
              city,
              password,
              userTypeId,
              likedPoints,
              disLikedPoints,
              description);
      print("createUserResult");

      if (createUserResult.Status == false) {
        print(createUserResult.Data);
        print(createUserResult.Message);
        Fluttertoast.showToast(
          msg: createUserResult.Message,
          backgroundColor: Colors.grey,
        );
        print("fail");
      } else {
        Fluttertoast.showToast(
          msg: createUserResult.Message,
          backgroundColor: Colors.grey,
        );
        clearData();
        print("success");
        Get.toNamed(AppRoutes.userManagementScreen);
        getAllUserDetails();
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  userTypeDetailsByIdGetApi(userTypeId) async {
    try {
      CommonResponse<UserTypeDeatilsByIdResponse> userTypeDetailsByIdResult =
          await editUserManagementRepository.getUserTypeDetailsById(userTypeId);
      disLikedController.value =
          userTypeDetailsByIdResult.Data.data.disLikeVotePoints.toString();
      likedController.value =
          userTypeDetailsByIdResult.Data.data.likeVotePoints.toString();
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void getAllUserDetails() async {
    try {
      CommonResponse<GetAllUserResponse> getAllUserResult =
          await editUserManagementRepository.getAllUserData();
      print("response");
      print(getAllUserResult.Data);
      userManagementModelObj.usersList.value.clear();
      for (var getAllUserList in getAllUserResult.Data.data) {
        counts.value = getAllUserResult.Data.data.length.toString();
        print(getAllUserList.firstName.toString());
        print(getAllUserList.lastName.toString());
        lastName.value = (getAllUserList.lastName.toString() == "null")
            ? ""
            : getAllUserList.lastName.toString();
        firstName.value = (getAllUserList.firstName.toString() == "null")
            ? ""
            : getAllUserList.firstName.toString();

        UserManagementItemModel userManagementModel = UserManagementItemModel(
            userName: firstName.value + " " + lastName.value,
            images: getAllUserList.profilePhotoLocation.toString(),
            userTypeName: getAllUserList.userTypeName.toString(),
            createdByDate: getAllUserList.createdDate.format('dd-MM-yyyy'),
            userId: getAllUserList.id.toString());
        userManagementModelObj.usersList.add(userManagementModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void getUserDetailsById(userId) async {
    try {
      CommonResponse<GetUserResponse> userDetailByIdGetResult =
          await editUserManagementRepository.getUserDataById(userId);
      print("response");
      print(userDetailByIdGetResult.Data);
      firstNameController.text =
          userDetailByIdGetResult.Data.data.firstName.toString();
      print("firstName");
      print(firstNameController.text);
      lastNameController.text =
          userDetailByIdGetResult.Data.data.lastName.toString();
      emailController.text =
          userDetailByIdGetResult.Data.data.emailId.toString();
      descriptionController.text =
          userDetailByIdGetResult.Data.data.description.toString();
      mobileNumberController.text =
          userDetailByIdGetResult.Data.data.mobileNumber.toString();
      userTypeId.value = userDetailByIdGetResult.Data.data.userType;
      isActive = userDetailByIdGetResult.Data.data.isActive.obs;

      String location = userDetailByIdGetResult.Data.data.location;
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
          cityController.text = address.toString();
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

  void clearData() {
    print("clearing data");
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    cityController.text = '';
    mobileNumberController.text = '';
    descriptionController.text = '';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
