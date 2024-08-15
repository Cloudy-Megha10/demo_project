import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/presentation/my_competitions_screen/controller/my_comp_bottom_sheet_controller.dart';
import 'package:kainok_app/presentation/my_competitions_screen/controller/my_competitions_repository.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/comp_details_response.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/my_competitions_item_model.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/my_competitions_model.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/my_competitions_response.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/update_comp_response.dart';

class MyCompetitionsController extends GetxController {
  MyCompetitionsRepository myCompetitionsRepository =
      MyCompetitionsRepository();
  SecureStorage _secureStorage = SecureStorage();

  Rx<GetMyCompetitionsModel> myCompetitionsControllerModelObj =
      GetMyCompetitionsModel().obs;
  TextEditingController compTitle = TextEditingController();
  TextEditingController minimumNoOFVotes = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isFeatured = false.obs;
  TextEditingController dateTextController = TextEditingController();
  TextEditingController prizeMoney = TextEditingController();
  RxString selectedId = "".obs;
  MyCompetitionsBottomSheetController myCompetitionsBottomSheetController =
      MyCompetitionsBottomSheetController();

  @override
  void onInit() {
    super.onInit();
    getMyCompetitions();
    myCompetitionsBottomSheetController.categoryGetApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getMyCompetitions() async {
    try {
      final userId = await _secureStorage.getUserId();
      if (userId != null) {
        CommonResponse<GetMyCompetitionsResponse> getMyCompetitionsResult =
            await myCompetitionsRepository.getMyCompetitionsData(userId);
        myCompetitionsControllerModelObj.value.myCompetitionsItemList.clear();

        for (var entry in getMyCompetitionsResult.Data.data) {
          GetMyCompetitionsItemModel myCompetitionsItemModel =
              GetMyCompetitionsItemModel(
                  icon: entry.imageLocation != null ? entry.imageLocation : "",
                  listName: entry.title,
                  width: "",
                  competitionId: entry.competitionId);
          myCompetitionsControllerModelObj.value.myCompetitionsItemList
              .add(myCompetitionsItemModel);
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

  void getCompetitionsDetails(String compId) async {
    try {
      CommonResponse<GetMyCompetitionDetailsResponse>
          getCompetitionDetailsResult =
          await myCompetitionsRepository.getCompetitionData(compId);
      compTitle.text = getCompetitionDetailsResult.Data.data.title;
      minimumNoOFVotes.text =
          getCompetitionDetailsResult.Data.data.minimumVotes.toString();
      descriptionController.text =
          getCompetitionDetailsResult.Data.data.description.toString();
      prizeMoney.text = getCompetitionDetailsResult.Data.data.price.toString();
      dateTextController.text = DateFormat('dd/MM/yyyy')
          .format(getCompetitionDetailsResult.Data.data.endDate);
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
