import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/controller/image_listing_controller.dart';
import 'package:kainok_app/presentation/upload_your_entry_screen/controller/upload_your_entry_respository.dart';
import 'package:kainok_app/presentation/upload_your_entry_screen/models/upload_your_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/routes/app_routes.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../my_competitions_screen/controller/my_competitions_controller.dart';
import '../../profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import '../../profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import '../../profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import '../../profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import '../models/add_image_response.dart';

class UploadYourEntryController extends GetxController {
  TextEditingController entrytitleController = TextEditingController();
  TextEditingController compName = TextEditingController();

  SecureStorage _secureStorage = SecureStorage();

  TextEditingController entrydescriptioController = TextEditingController();

  UploadYourEntryModel uploadYourEntryModelObj = UploadYourEntryModel();

  UploadYourEntryRepositoty uploadYourEntryRepository =
      UploadYourEntryRepositoty();

  CategoryListingController categoryListingController =
      CategoryListingController();

  int selectedValue = 0;

  File? file;

  RxString imagePath = ''.obs;

  RxBool selectedImage = false.obs;
  RxBool isLoading = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  final profileDeatilsMyParticipationController =
      Get.put(ProfileDeatilsMyParticipationController());

  final ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
      Get.put(ProfileDeatilsMyVoteController());

  final ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
      Get.put(ProfileDeatilsMyWinningsController());

  final MyCompetitionsController myCompetitionsController =
      Get.put(MyCompetitionsController());
  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  void clearData() {
    print("clearing data");
    entrytitleController.text = '';
    entrydescriptioController.text = '';
    selectedImage.value = false;
    imagePath.value = '';
    compName.text = '';
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

  ///////////////////// POST Upload

  Future<void> addImagesPost(
      {required String competitionId,
      required String competitionTitle,
      required String competitionDescription,
      required dynamic selectedFile}) async {
    try {
      final userId = await _secureStorage.getUserId();
      CommonResponse<AddImageResponse> uploadImageResult =
          await uploadYourEntryRepository.addImagesToParticularCompetition(
              competitionId,
              competitionTitle,
              competitionDescription,
              selectedFile);

      if (uploadImageResult.Status) {
        Fluttertoast.showToast(
          msg: uploadImageResult.Message,
          backgroundColor: Colors.grey,
        );
        isLoading.value = false;
        refreshProfileTabsData();
        Get.back();
        clearData();
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(
          msg: uploadImageResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> addImagesFromCompImageListingScreen(
      {required String competitionId,
      required String competitionTitle,
      required String competitionDescription,
      required dynamic selectedFile}) async {
    try {
      final userId = await _secureStorage.getUserId();
      CommonResponse<AddImageResponse> uploadImageResult =
          await uploadYourEntryRepository.addImagesToParticularCompetition(
              competitionId,
              competitionTitle,
              competitionDescription,
              selectedFile);

      if (uploadImageResult.Status) {
        Fluttertoast.showToast(
          msg: uploadImageResult.Message,
          backgroundColor: Colors.grey,
        );
        isLoading.value = false;
        refreshProfileTabsData();
        print("compTttlee");
        print(competitionId);
        print(competitionTitle);
        Get.toNamed(AppRoutes.compImageListingScreen, arguments: {
          'competitionId': competitionId,
          'competitionTitle': competitionTitle,
          "isCompImageListingScreen": true
        })?.then((value) => Get.delete<CompImageListingController>());
        clearData();
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(
          msg: uploadImageResult.Message,
          backgroundColor: Colors.grey,
        );
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
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

  //////////// Document Upload

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
