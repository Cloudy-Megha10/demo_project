import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/get_user_response.dart';
import '../models/update_user_response.dart';
import 'edit_profile_repository.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController msgBioController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  EditProfileRepository editProfileRepository = EditProfileRepository();

  @override
  void onReady() {
    super.onReady();
    getUserDetails();
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
      cityController.text = userGetResult.Data.data.location;
      msgBioController.text = userGetResult.Data.data.description;
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
    required String city,
    required String bio,
  }) async {
    try {
      CommonResponse<UserUpdateResponse> updateUserResponse =
          await editProfileRepository.updateUserData(
              firstName, lastName, emailId, city, bio);
      print("registerResult");

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
        Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen);
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
