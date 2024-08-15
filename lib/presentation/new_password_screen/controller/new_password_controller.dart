import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/new_password_screen/controller/new_password_repository.dart';
import 'package:demo_project/presentation/new_password_screen/models/new_password_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/new_password_update_response.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  NewPasswordModel newPasswordModelObj = NewPasswordModel();

  NewPasswordRepository newPasswordRepository = NewPasswordRepository();

  Rx<bool> isShowPasswordOne = true.obs;

  Rx<bool> isShowPasswordTwo = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void clearData() {
    print("clearing data");
    newPasswordController.text = '';
    confirmpasswordController.text = '';
  }

  //Particular Competition Get Api

  newPasswordUpdateApi(newPassword, emailIdOrMobile) async {
    try {
      CommonResponse<PasswordUpdateResponse> newPasswordUpdateResult =
          await newPasswordRepository.updateNewPasswordData(
              newPassword, emailIdOrMobile);

      print("newPasswordUpdateResult");
      print(newPasswordUpdateResult.Data.data);
      if (newPasswordUpdateResult.Status == true) {
        Fluttertoast.showToast(
          msg: newPasswordUpdateResult.Message,
          backgroundColor: ColorConstant.gray100,
        );
        Get.toNamed(AppRoutes.passwordUpdatedScreen);
        clearData();
      } else {
        Fluttertoast.showToast(
          msg: newPasswordUpdateResult.Message,
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
    newPasswordController.clear();
    confirmpasswordController.clear();
  }
}
