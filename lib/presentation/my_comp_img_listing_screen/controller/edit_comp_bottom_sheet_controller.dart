import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/comp_details_response.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/get_categories_response.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/edit_comp_bottom_sheet_details_response.dart';
import '../models/edit_comp_get_categories_response.dart';
import '../models/my_comp_img_listing_model.dart';
import '../models/update_comp_bottom_sheet_details.dart';
import 'my_comp_img_listing_repository.dart';

class EditCompetitionsBottomSheetController extends GetxController {
  MyCompImgListingRepository myCompImgListingRepository =
      MyCompImgListingRepository();

  SecureStorage _secureStorage = SecureStorage();
  TextEditingController compTitle = TextEditingController();
  TextEditingController minimumNoOFVotes = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isFeatured = false.obs;
  TextEditingController dateTextController = TextEditingController();
  TextEditingController prizeMoney = TextEditingController();
  RxString selectedId = "".obs;
  MyCompImgListingModel myCompCategoryModelObj = MyCompImgListingModel();
  dynamic isAdmin = false;
  RxString compEndsIn = "".obs;
  RxString uploadCompEndsIn = "".obs;
  RxInt categoryId = 1.obs;
  RxInt daysToEnd = 1.obs;
  RxInt daysToUpload = 1.obs;
  DateTime? compCreatedDate;
  int fetchDaysToUpload = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    isAdmin = await _secureStorage.getUserTypeAsAdmin();
  }

  noOfDaysDropDown() async {
    try {
      List noOfDaysList = [];
      for (int i = 1; i <= 31; i++) {
        noOfDaysList.add({"Id": i, "NoOfDays": i.toString()});
      }

      for (var entry in noOfDaysList) {
        SelectionPopupModel noOfDaysModel =
            SelectionPopupModel(id: entry["Id"], title: entry["NoOfDays"]);
        myCompCategoryModelObj.compEndsIn.add(noOfDaysModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void getCompetitionsDetails(String compId) async {
    try {
      categoryGetApi();
      CommonResponse<EditMyCompBottomSheetDetailsResponse>
          getCompetitionDetailsResult =
          await myCompImgListingRepository.getCompetitionData(compId);
      print("responseGetMyCompetitionDetailsResponse");
      print(getCompetitionDetailsResult.Data);
      compTitle.text = getCompetitionDetailsResult.Data.data.title.toString();
      minimumNoOFVotes.text =
          getCompetitionDetailsResult.Data.data.minimumVotes.toString();
      descriptionController.text =
          getCompetitionDetailsResult.Data.data.description.toString();
      prizeMoney.text = getCompetitionDetailsResult.Data.data.price.toString();
      selectedId =
          getCompetitionDetailsResult.Data.data.categoryId.toString().obs;
      categoryId.value = getCompetitionDetailsResult.Data.data.categoryId;
      daysToEnd.value = getCompetitionDetailsResult.Data.data.daysToEnd;
      daysToUpload.value = getCompetitionDetailsResult.Data.data.daysToUpload;
      compEndsIn =
          getCompetitionDetailsResult.Data.data.daysToEnd.toString().obs;
      uploadCompEndsIn =
          getCompetitionDetailsResult.Data.data.daysToUpload.toString().obs;

      isFeatured = getCompetitionDetailsResult.Data.data.isFeatured.obs;
      compCreatedDate = getCompetitionDetailsResult.Data.data.createdAt;
      fetchDaysToUpload = getCompetitionDetailsResult.Data.data.daysToUpload;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  categoryGetApi() async {
    try {
      CommonResponse<EditCompGetCategoriesResponse>
          particularCategoryGetResult =
          await myCompImgListingRepository.getCategories();

      for (var entry in particularCategoryGetResult.Data.data) {
        // competitionTitle.value = entry.title.toString();
        SelectionPopupModel adventureItemModel =
            SelectionPopupModel(id: entry.id, title: entry.categoryTitle);
        myCompCategoryModelObj.categories.add(adventureItemModel);
        print("UploadCompetitionobject");
        print(adventureItemModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  Future<void> updateCompetition(
      {required String compId,
      required String compTitle,
      required String compDescription,
      required dynamic compCategoryId,
      required String minNumOfVotes,
      required String prizeMoney,
      required bool isFeatured,
      required dynamic daysToUpload,
      required dynamic daysToEnd}) async {
    try {
      CommonResponse<UpdateCompBottomSheetDetailsResponse> updateCompResponse =
          await myCompImgListingRepository.updateCompetitionData(
              compId,
              compTitle,
              compDescription,
              compCategoryId.toString(),
              minNumOfVotes,
              prizeMoney,
              isFeatured,
              daysToUpload,
              daysToEnd);
      print("upadteCompitionDetails-----");
      print("updateCompResponse.Data");
      if (updateCompResponse.Status) {
        print("updateCompResponse.Data");
        print(updateCompResponse.Data);
        print(updateCompResponse.Message);
        Fluttertoast.showToast(
          msg: updateCompResponse.Message,
          backgroundColor: Colors.grey,
        );
        Get.back();
      } else {
        Fluttertoast.showToast(
          msg: updateCompResponse.Message,
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
