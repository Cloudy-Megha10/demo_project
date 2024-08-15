import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:demo_project/presentation/my_competitions_screen/controller/my_competitions_repository.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/comp_details_response.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/get_categories_response.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/my_competitions_model.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/update_comp_response.dart';

class MyCompetitionsBottomSheetController extends GetxController {
  MyCompetitionsRepository myCompetitionsRepository =
      MyCompetitionsRepository();

  TextEditingController compTitle = TextEditingController();
  TextEditingController minimumNoOFVotes = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isFeatured = false.obs;
  TextEditingController dateTextController = TextEditingController();
  TextEditingController prizeMoney = TextEditingController();
  RxString selectedId = "".obs;
  GetMyCompetitionsModel myCompetitionsModel = GetMyCompetitionsModel();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getCompetitionsDetails(String compId) async {
    try {
      categoryGetApi();
      CommonResponse<GetMyCompetitionDetailsResponse>
          getCompetitionDetailsResult =
          await myCompetitionsRepository.getCompetitionData(compId);
      compTitle.text = getCompetitionDetailsResult.Data.data.title.toString();
      minimumNoOFVotes.text =
          getCompetitionDetailsResult.Data.data.minimumVotes.toString();
      descriptionController.text =
          getCompetitionDetailsResult.Data.data.description.toString();
      prizeMoney.text = getCompetitionDetailsResult.Data.data.price.toString();
      selectedId =
          getCompetitionDetailsResult.Data.data.categoryId.toString().obs;

      isFeatured = getCompetitionDetailsResult.Data.data.isFeatured.obs;
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
      CommonResponse<GetCategories> particularCategoryGetResult =
          await myCompetitionsRepository.getCategories();

      for (var entry in particularCategoryGetResult.Data.data) {
        SelectionPopupModel adventureItemModel =
            SelectionPopupModel(id: entry.id, title: entry.categoryTitle);
        myCompetitionsModel.categories.add(adventureItemModel);
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
      required dynamic compEndDate,
      required String minNumOfVotes,
      required String prizeMoney,
      required bool isFeatured}) async {
    try {
      CommonResponse<UpdateCompetitionDetailsResponse> updateCompResponse =
          await myCompetitionsRepository.updateCompetitionData(
              compId,
              compTitle,
              compDescription,
              compCategoryId.toString(),
              compEndDate,
              minNumOfVotes,
              prizeMoney,
              isFeatured);
      if (updateCompResponse.Status) {
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
