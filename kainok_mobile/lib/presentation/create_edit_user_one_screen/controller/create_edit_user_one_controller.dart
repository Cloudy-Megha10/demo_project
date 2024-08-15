import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/create_edit_user_one_screen/controller/vote_settings_repository.dart';
import 'package:kainok_app/presentation/create_edit_user_one_screen/models/create_edit_user_one_model.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../models/create_user_type_response.dart';
import '../models/listnonregister_item_model.dart';
import '../models/update_user_type_response.dart';

class CreateEditUserOneController extends GetxController {
  Rx<CreateEditUserOneModel> createEditUserOneModelObj =
      CreateEditUserOneModel().obs;
  TextEditingController likedController = TextEditingController();
  TextEditingController disLikedController = TextEditingController();
  TextEditingController enterUserNameController = TextEditingController();
  VoteRepository voteRepository = VoteRepository();

  @override
  void onReady() {
    super.onReady();
    getAllUserType();
  }

  Future<void> createUserType({
    required String userTypeName,
    required String likedPoints,
    required String disLikedPoints,
  }) async {
    try {
      CommonResponse<CreateUserTypeResponse> createUserTypeResult =
          await voteRepository.createUserTypeData(
        userTypeName,
        likedPoints,
        disLikedPoints,
      );
      print("createUserResult");
      print(createUserTypeResult);
      if (createUserTypeResult.Status == false) {
        print(createUserTypeResult.Data);
        print(createUserTypeResult.Message);
        Fluttertoast.showToast(
          msg: createUserTypeResult.Message,
          backgroundColor: Colors.grey,
        );
        print("fail");
      } else {
        Fluttertoast.showToast(
          msg: createUserTypeResult.Message,
          backgroundColor: Colors.grey,
        );
        print("success");
        Get.back();
        Get.toNamed(AppRoutes.voteSettingsScreen);
        getAllUserType();
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> updateUserTypeDetails({
    required dynamic userTypeName,
    required dynamic likedPoints,
    required dynamic disLikedPoints,
    required dynamic userTypeId,
  }) async {
    try {
      CommonResponse<UpdateUserTypeDetailsResponse> createUserTypeResult =
          await voteRepository.updateUserTypeData(
              userTypeName, likedPoints, disLikedPoints, userTypeId);
      if (createUserTypeResult.Status) {
        Fluttertoast.showToast(
          msg: createUserTypeResult.Message,
          backgroundColor: Colors.grey,
        );
        Get.back();

        Get.toNamed(AppRoutes.voteSettingsScreen);
        getAllUserType();
      } else {
        Fluttertoast.showToast(
          msg: createUserTypeResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  getAllUserType() async {
    try {
      CommonResponse<GetAllUserType> particularCategoryGetResult =
          await voteRepository.getAllUserType();

      createEditUserOneModelObj.value.userTypeDetails.value.clear();

      for (var entry in particularCategoryGetResult.Data.data) {
        // competitionTitle.value = entry.title.toString();
        ListnonregisterItemModel userTypeItemModel = ListnonregisterItemModel(
            userTypeName: entry.name,
            likedPoints: entry.likeVotePoints,
            disLikedPoints: entry.disLikeVotePoints,
            userTypeId: entry.id);
        createEditUserOneModelObj.value.userTypeDetails.add(userTypeItemModel);
        print("userTypeItemModel");
        print(userTypeItemModel);
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
  }
}
