import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/models/geo_location_model.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/core/utils/geoLocation_utils.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/controller/image_listing_controller.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/models/get_comp_all_img_response.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/models/image_listing_model.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/my_competitions_screen/controller/my_competitions_controller.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/controller/participate_in_comp_respository.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/models/add_image_response.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/models/participate_in_comp_model.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import 'package:kainok_app/presentation/profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import 'package:kainok_app/routes/app_routes.dart';

class ParticipateInCompetitionController extends GetxController {
  SecureStorage _secureStorage = SecureStorage();
  RxString competitionTitle = "".obs;
  TextEditingController entrytitleController = TextEditingController();
  TextEditingController compName = TextEditingController();

  TextEditingController entrydescriptioController = TextEditingController();

  ParticipateInCompetitionModel participateInCompModelObj =
      ParticipateInCompetitionModel();

  ParticipateInCompetitionRepository participateInCompRepository =
      ParticipateInCompetitionRepository();

  CategoryListingController categoryListingController =
      CategoryListingController();

  int selectedValue = 0;

  File? file;

  RxString imagePath = ''.obs;

  RxBool selectedImage = false.obs;
  RxBool isLoading = false.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
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

  saveDocument() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.any);

    if (result != null) {
      selectedImage.value = true;
      imagePath.value = result.files.single.path!;
      file = File(result.files.single.path.toString());
    }
  }

  refreshProfileTabsData() async {
    final profileDeatilsMyParticipationController =
        Get.put(ProfileDeatilsMyParticipationController());

    final ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
        Get.put(ProfileDeatilsMyVoteController());

    final ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
        Get.put(ProfileDeatilsMyWinningsController());

    final MyCompetitionsController myCompetitionsController =
        Get.put(MyCompetitionsController());
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
      required dynamic selectedFile,
      dynamic categoryId}) async {
    try {
      final userId = await _secureStorage.getUserId();
      CommonResponse<AddImageResponse> uploadImageResult =
          await participateInCompRepository.addImagesToParticularCompetition(
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
        // refreshProfileTabsData();
        // Get.toNamed(
        //   AppRoutes.competitionListScreen,
        //   arguments: {"isCompScreen": false},
        // )?.then((value) => Get.delete<CompetitionsScreenController>());
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
      required dynamic selectedFile,
      dynamic categoryId}) async {
    try {
      final userId = await _secureStorage.getUserId();
      CommonResponse<AddImageResponse> uploadImageResult =
          await participateInCompRepository.addImagesToParticularCompetition(
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
        // refreshProfileTabsData();
        print("compTttlee");
        print(competitionId);
        print(competitionTitle);
        Get.toNamed(AppRoutes.compImageListingScreen, arguments: {
          'competitionId': competitionId,
          'competitionTitle': competitionTitle,
          "isCompImageListingScreen": true,
          'categoryId': categoryId
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

  getMyImagesForComp(String compId, String compTitle) async {
    // try {
    //   CommonResponse<GetCompetitionAllImgListResponse>
    //       myParticipationCompImagesResult =
    //       await imageListingRepository.getMyParticipationCompImageData(compId);
    //   imageListingModelObj.myParticipedCompImagesItemList.clear();
    //   print("myParticipationCompImagesResult");
    //   print(myParticipationCompImagesResult.Status);
    //   print(myParticipationCompImagesResult.Message);

    //   if (myParticipationCompImagesResult.Data.data.length > 0) {
    //     competitionTitle =
    //         myParticipationCompImagesResult.Data.data[0].competitionTitle.obs;
    //     for (var entry in myParticipationCompImagesResult.Data.data) {
    //       ImageListingModel myParticipationCompImgDetailItemModel =
    //           ImageListingModel(
    //         image: entry.imageLocation != null ? entry.imageLocation : "",
    //         competitionTitle: entry.competitionTitle,
    //       );
    //       imageListingModelObj.myParticipedCompImagesItemList
    //           .add(myParticipationCompImgDetailItemModel);
    //     }
    //     Get.toNamed(
    //       AppRoutes.compImageListingScreen,
    //       arguments: {
    //         'competitionId': compId,
    //         'competitionTitle': compTitle,
    //         "isCompImageListingScreen": true
    //       },
    //     );
    //   } else {
    //     competitionTitle = compTitle.obs;
    //     Get.toNamed(
    //       AppRoutes.compImageListingScreen,
    //       arguments: {
    //         'competitionId': compId,
    //         'competitionTitle': compTitle,
    //         "isCompImageListingScreen": true
    //       },
    //     );
    //   }
    // } catch (e) {
    //   Fluttertoast.showToast(
    //     msg: "Error in Catch Block" + e.toString(),
    //     backgroundColor: ColorConstant.gray100,
    //   );
    //   return null;
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
