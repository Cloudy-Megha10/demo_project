import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/upload_competition_screen/controller/upload_competition_respository.dart';
import 'package:flutter/material.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../../my_competitions_screen/controller/my_competitions_controller.dart';
import '../../profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import '../../profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import '../../profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import '../../profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import '../models/competition_creation_response.dart';
import '../models/get_category_response.dart';
import '../models/upload_competition_model.dart';

class UploadCompetitionController extends GetxController {
  TextEditingController entrytitleController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController entrydescriptioController = TextEditingController();

  TextEditingController minimumNoOFVotes = TextEditingController();
  TextEditingController priceController = TextEditingController();

  UploadCompetitionModel uploadCategoryModelObj = UploadCompetitionModel();

  TextEditingController dateTextController = TextEditingController();

  UploadCompetitionRepository uploadCategoryRepository =
      UploadCompetitionRepository();

  int selectedValue = 0;
  File? file;

  RxString imagePath = ''.obs;

  RxBool selectedImage = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  RxString currentLatitudeLongitude = "".obs;
  RxString selectedId = "".obs;
  RxString compEndsIn = "".obs;
  RxString uploadCompEndsIn = "".obs;
  RxBool selected = false.obs;
  RxBool isLoading = false.obs;
  final profileDeatilsMyParticipationController =
      Get.put(ProfileDeatilsMyParticipationController());

  final ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
      Get.put(ProfileDeatilsMyVoteController());

  final ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
      Get.put(ProfileDeatilsMyWinningsController());

  final MyCompetitionsController myCompetitionsController =
      Get.put(MyCompetitionsController());
  SecureStorage _secureStorage = SecureStorage();
  dynamic isAdmin = false;

  @override
  void onReady() async {
    super.onReady();
    getLocation();
    isAdmin = await _secureStorage.getUserTypeAsAdmin();
    categoryGetApi();
    noOfDaysDropDown();
  }

  @override
  void onInit() {
    super.onInit();
  }

  refreshProfileTabsData() async {
    final userId = await _secureStorage.getUserId();
    profileDeatilsMyParticipationController.myParticipationGetApi();
    myCompetitionsController.getMyCompetitions();
    profileDeatilsMyVoteController.myVoteGetApi(userId.toString());
    profileDeatilsMyWinnerController.myWinnerGetApi(userId.toString());
    ProfileDeatilsMyParticipationTabContainerScreen()
        .profileDeatilsMyParticipationController
        .obs;
    ProfileDeatilsMyParticipationTabContainerScreen()
        .profileDeatilsMyVoteController
        .obs;
    ProfileDeatilsMyParticipationTabContainerScreen()
        .profileDeatilsMyWinnerController
        .obs;
    ProfileDeatilsMyParticipationTabContainerScreen()
        .myCompetitionsController
        .obs;
  }

  void clearData() {
    print("clearing data");
    entrytitleController.text = '';
    entrydescriptioController.text = '';
    dateTextController.text = '';
    minimumNoOFVotes.text = '';
    categoryController.text = '';
    selectedImage.value = false;
    imagePath.value = '';
    priceController.text = '';
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";
      currentLatitudeLongitude.value =
          currentLatitude.value + "," + currentLongitude.value;

      // Use the location object here
      print("Latitude: ${location.lat}, Longitude: ${location.long}");
    });
  }

  // BUSINESS CLIENT VIEW GET API

  categoryGetApi() async {
    try {
      CommonResponse<GetCategories> particularCategoryGetResult =
          await uploadCategoryRepository.getCategories();

      for (var entry in particularCategoryGetResult.Data.data) {
        // competitionTitle.value = entry.title.toString();
        SelectionPopupModel adventureItemModel =
            SelectionPopupModel(id: entry.id, title: entry.categoryTitle);
        uploadCategoryModelObj.categories.add(adventureItemModel);
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

  noOfDaysDropDown() async {
    try {
      List noOfDaysList = [];
      for (int i = 1; i <= 15; i++) {
        noOfDaysList.add({"Id": i, "NoOfDays": i.toString()});
      }

      for (var entry in noOfDaysList) {
        SelectionPopupModel noOfDaysModel =
            SelectionPopupModel(id: entry["Id"], title: entry["NoOfDays"]);
        uploadCategoryModelObj.compEndsIn.add(noOfDaysModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }
// POST Upload

  Future<void> addCompetitionPost({
    required String competitionTitle,
    required dynamic competitionCategory,
    required String competitionLocation,
    required String competitionDescription,
    required dynamic selectedFile,
    required String minimumNoOFVotes,
    required dynamic price,
    required dynamic isFeatureEnabled,
    required dynamic daysToEnd,
    required dynamic daysToUpload,
  }) async {
    try {
      CommonResponse<CompetitionCreationResponse> uploadCategoryResult =
          await uploadCategoryRepository.addCompetitions(
              competitionTitle,
              selectedId.toString(),
              competitionDescription,
              competitionLocation,
              selectedFile,
              minimumNoOFVotes,
              price,
              isFeatureEnabled,
              daysToEnd,
              daysToUpload);
      if (uploadCategoryResult.Status) {
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
        Fluttertoast.showToast(
          msg: uploadCategoryResult.Message,
          backgroundColor: Colors.grey,
        );
        isLoading.value = false;
        refreshProfileTabsData();

        clearData();
        //refreshProfileTabsData();
      } else {
        isLoading.value = false;

        Fluttertoast.showToast(
          msg: uploadCategoryResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

// Document Upload

  saveDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);

    if (result != null) {
      selectedImage.value = true;
      imagePath.value = result.files.single.path!;
      file = File(result.files.single.path.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
