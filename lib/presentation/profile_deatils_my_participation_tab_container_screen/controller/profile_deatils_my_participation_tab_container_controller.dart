import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/models/geo_location_model.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/core/utils/geoLocation_utils.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:demo_project/presentation/edit_profile_screen/models/get_user_response.dart';
import 'package:demo_project/presentation/my_competitions_screen/controller/my_competitions_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/controller/profile_detail_repository.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/models/profile_deatils_my_participation_tab_container_model.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/models/user_logout_response.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/models/user_profile_update_response.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import 'package:demo_project/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/widgets/custom_bottom_bar.dart';

class ProfileDeatilsMyParticipationTabContainerController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<ProfileDeatilsMyParticipationTabContainerModel>
      profileDeatilsMyParticipationTabContainerModelObj =
      ProfileDeatilsMyParticipationTabContainerModel().obs;
  late TabController tabController;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  RxString imagePath = ''.obs;

  RxBool selectedImage = false.obs;
  File? file;

  Rx<BottomBarEnum> type = BottomBarEnum.Competition.obs;

  ProfileRepository profileRepository = ProfileRepository();

  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxString description = "".obs;
  RxString userPhoto = "".obs;
  dynamic userId = "";
  dynamic isGuestUser = false;
  dynamic isLoggedOut = true;
  RxBool shouldProfileButtonEnable = true.obs;

  SecureStorage _secureStorage = SecureStorage();
  final profileDeatilsMyParticipationController =
      Get.put(ProfileDeatilsMyParticipationController());

  final ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
      Get.put(ProfileDeatilsMyVoteController());

  final ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
      Get.put(ProfileDeatilsMyWinningsController());

  final MyCompetitionsController myCompetitionsController =
      Get.put(MyCompetitionsController());

  @override
  void onInit() {
    refreshData();
    super.onInit();
  }

  @override
  void onReady() async {
    refreshData();
    super.onReady();
  }

  refreshData() async {
    getLocation();

    tabController = TabController(vsync: this, length: 4);
    userId = await _secureStorage.getUserId();
    isGuestUser = await _secureStorage.getIsGuestUser();
    isLoggedOut = await _secureStorage.getIsLoggedOut();

    if (isGuestUser == "false" && isLoggedOut == "false") {
      getUserDetails(userId);
      shouldProfileButtonEnable.value = true;
    } else {
      firstName.value = "Guest User";
      lastName.value = "";
      email.value = "";
      description.value = "";
      shouldProfileButtonEnable.value = false;
    }
    profileDeatilsMyParticipationController.myParticipationGetApi();
    profileDeatilsMyVoteController.myVoteGetApi(userId);
    profileDeatilsMyWinnerController.myWinnerGetApi(userId);
    myCompetitionsController.getMyCompetitions();
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";

      // Use the location object here
      print("Profile Test");
      print("Latitude: ${location.lat}, Longitude: ${location.long}");
    });
  }

  saveDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);

    if (result != null) {
      selectedImage.value = true;
      imagePath.value = result.files.single.path!;
      file = File(result.files.single.path.toString());
      updateProfilePhoto(selectedFile: file);
    }
  }

  void getUserDetails(String userId) async {
    try {
      CommonResponse<GetUserResponse> userGetResult =
          await profileRepository.getUserData(userId);
      if (userGetResult.Status == true) {
        firstName.value = userGetResult.Data.data.firstName.toString();
        lastName.value = userGetResult.Data.data.lastName.toString();
        email.value = userGetResult.Data.data.emailId.toString();
        userPhoto.value = userGetResult.Data.data.profilePhotoLocation != null
            ? userGetResult.Data.data.profilePhotoLocation.toString()
            : "";
        description.value = userGetResult.Data.data.description;
      } else {
        Fluttertoast.showToast(
          msg: userGetResult.Message,
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

  void logout(String? userId, String? deviceId) async {
    try {
      CommonResponse<UserLoggedOutReponse> userGetResult =
          await profileRepository.logout(userId, deviceId);
      if (userGetResult.Status == true) {
        await _secureStorage.removeUserId();
        await _secureStorage.removeUserTypeId();
        await _secureStorage.setIsLoggedOut(userGetResult.Data.data.toString());
        await _secureStorage.setIsGuestUser("true");
        Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
      } else {
        Fluttertoast.showToast(
          msg: userGetResult.Message,
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

// POST Upload

  Future<void> updateProfilePhoto({
    required dynamic selectedFile,
  }) async {
    try {
      CommonResponse<UserProfileResponse> updateUserProfileResult =
          await profileRepository.updateProfilePhoto(selectedFile);
      if (updateUserProfileResult.Status) {
        Fluttertoast.showToast(
          msg: updateUserProfileResult.Message,
          backgroundColor: Colors.grey,
        );
        Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
            ?.then((value) => Get.delete<
                ProfileDeatilsMyParticipationTabContainerController>());
        refreshData();
      } else {
        Fluttertoast.showToast(
          msg: updateUserProfileResult.Message,
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
    tabController.dispose();
    super.onClose();
  }
}
