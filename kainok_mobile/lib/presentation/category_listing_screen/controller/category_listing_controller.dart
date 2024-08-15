import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/models/geo_location_model.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/core/utils/geoLocation_utils.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_repository.dart';
import 'package:kainok_app/presentation/category_listing_screen/models/category_create_guest_user_response.dart';
import 'package:kainok_app/presentation/category_listing_screen/models/category_item_model.dart';
import 'package:kainok_app/presentation/category_listing_screen/models/category_listing_model.dart';
import 'package:kainok_app/presentation/category_listing_screen/models/competitions_by_category_response.dart';
import 'package:kainok_app/presentation/category_listing_screen/models/vote_item_model.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/models/get_particular_competition.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/models/image_listing_model.dart';
import 'package:kainok_app/presentation/preview_screen/models/preview_vote_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:kainok_app/routes/app_routes.dart';
import 'package:kainok_app/widgets/custom_alert_dialog.dart';
import 'package:kainok_app/widgets/custom_guest_user_alert_dialog.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CategoryListingController extends GetxController {
  SecureStorage _secureStorage = SecureStorage();
  TextEditingController usertypeController = TextEditingController();

  TextEditingController usertypeoneController = TextEditingController();

  TextEditingController usertypetwoController = TextEditingController();

  TextEditingController usertypethreeController = TextEditingController();

  TextEditingController usertypefourController = TextEditingController();

  TextEditingController usertypefiveController = TextEditingController();

  TextEditingController usertypesixController = TextEditingController();

  TextEditingController usertypesevenController = TextEditingController();

  TextEditingController usertypeeightController = TextEditingController();

  CategoryItemModel categoryListingModelObj = CategoryItemModel();

  CategoryListingRepository categoryListingRepository =
      CategoryListingRepository();

  Rx<List<CategoryListingModel>> foundCompetitions =
      Rx<List<CategoryListingModel>>([]);

  RxBool likedPhoto = false.obs;

  RxString competitionCategory = "".obs;
  RxString competitionTitle = "".obs;
  RxString counts = "".obs;
  RxString argument = "".obs;
  RxDouble progress = 0.0.obs;
  RxInt index = 0.obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  dynamic selectedCompetitionId;
  dynamic selectedCompetitionTitle;
  dynamic selectedPage;
  RxInt minVotes = 0.obs;

  String userId = "";
  List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void onReady() async {
    super.onReady();
    getLocation();
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";

      // Use the location object here
      print("CAtogaryLocation----");

      print("Latitude: ${location.lat}, Longitude: ${location.long}");
    });
  }

  Future<void> createGuestUser(compId, compTitle) async {
    CategoryListingController categoryListingController =
        Get.put(CategoryListingController());
    try {
      CommonResponse<CategoryCreateGuestUserResponse> guestUserCreation =
          await categoryListingRepository.saveGuestUser(
              await _secureStorage.getDeviceInfoMobileNo(),
              await _secureStorage.getIemiNo(),
              "$currentLatitude",
              "$currentLongitude",
              "Guest User");

      _secureStorage.setUserId(guestUserCreation.Data.data.toString());
      categoryListingController.getCompetitionDetailsById(compId, compTitle);
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> votePost({
    required List<VoteItemModel> votedImages,
  }) async {
    try {
      CommonResponse<VotePostResponse> votedResult =
          await categoryListingRepository.votePostedData(votedImages);
      if (votedResult.Status == false) {
        Fluttertoast.showToast(
          msg: votedResult.Message,
          backgroundColor: Colors.grey,
        );
      } else {
        Fluttertoast.showToast(
          msg: votedResult.Message,
          backgroundColor: Colors.grey,
        );
        categoryListingModelObj.voteList.clear();
        Get.offNamed(AppRoutes.votingScreenPage)
            ?.then((value) => Get.delete<VotingScreenController>());
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  filterCmopetition(String competitionTitle) async {
    List<CategoryListingModel> result = [];
    if (competitionTitle.isEmpty) {
      result = categoryListingModelObj.categoryItemList;
    } else {
      result = categoryListingModelObj.categoryItemList
          .where((element) => element.competitionTitle
              .toString()
              .toLowerCase()
              .contains(competitionTitle.toLowerCase()))
          .toList();
    }

    foundCompetitions.value = result;
  }

  // Particular Category Get Api
  participationCompetitionsByCategoryGetApi(
      categoryId, bool isCompScreen) async {
    try {
      CommonResponse<CompetitionsByCategory>
          participationCompetitionsByCategoryGetResult =
          await categoryListingRepository
              .getParticipationCompetitionsByCategoryData(
                  categoryId, currentLatitude.value, currentLongitude.value);
      counts.value = participationCompetitionsByCategoryGetResult
          .Data.data!.length
          .toString();
      categoryListingModelObj.categoryItemList.clear();

      for (var entry
          in participationCompetitionsByCategoryGetResult.Data.data!) {
        competitionCategory.value = entry.categoryTitle.toString();

        CategoryListingModel adventureItemModel = CategoryListingModel(
            categoryName: entry.categoryTitle,
            counts: entry.categoryTitle!.length,
            image: entry.imageLocation != null ? entry.imageLocation : "",
            competitionTitle: entry.title,
            competitionId: entry.competitionId,
            imageId: entry.imageId);
        categoryListingModelObj.categoryItemList.add(adventureItemModel);
      }
      foundCompetitions.value = categoryListingModelObj.categoryItemList;

      Get.toNamed(
        AppRoutes.competitionListScreen,
        arguments: {"isCompScreen": isCompScreen, "categoryId": categoryId},
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  votingCompetitionsByCategoryGetApi(categoryId, bool isCompScreen) async {
    try {
      CommonResponse<CompetitionsByCategory>
          votingCompetitionsByCategoryGetResult =
          await categoryListingRepository
              .getVotingCompetitionsByCategoryData(categoryId);
      counts.value =
          votingCompetitionsByCategoryGetResult.Data.data!.length.toString();
      categoryListingModelObj.categoryItemList.clear();

      for (var entry in votingCompetitionsByCategoryGetResult.Data.data!) {
        competitionCategory.value = entry.categoryTitle.toString();

        CategoryListingModel adventureItemModel = CategoryListingModel(
            categoryName: entry.categoryTitle,
            counts: entry.categoryTitle!.length,
            image: entry.imageLocation != null ? entry.imageLocation : "",
            competitionTitle: entry.title,
            competitionId: entry.competitionId,
            imageId: entry.imageId);
        categoryListingModelObj.categoryItemList.add(adventureItemModel);
      }

      foundCompetitions.value = categoryListingModelObj.categoryItemList;

      Get.toNamed(
        AppRoutes.competitionListScreen,
        arguments: {"isCompScreen": isCompScreen, "categoryId": categoryId},
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  // Particular Competition Get Api
  getCompetitionDetailsById(competitionId, competitionTitle) async {
    selectedCompetitionId = competitionId;
    selectedCompetitionTitle = competitionTitle;
    try {
      final userId = await _secureStorage.getUserId();
      CommonResponse<CompetitionDetailsResponse> competitionDetailResponse =
          await categoryListingRepository
              .getCompetitionDetailsById(competitionId);

      List<ImageListingModel> imageList = [];

      for (var entry in competitionDetailResponse.Data.data) {
        ImageListingModel imageModel = ImageListingModel(
            image: entry.imageLocation != null ? entry.imageLocation : "",
            imageId: entry.imageId,
            competitionId: entry.competitionId,
            competitionTitle: entry.title,
            imageListCount: competitionDetailResponse.Data.data.length,
            minimumVotes: entry.minimumVotes);
        imageList.add(imageModel);
      }

      categoryListingModelObj.imageListingModel.value = imageList;
      update();
      Get.toNamed(AppRoutes.previewScreen, arguments: {
        'competitionId': competitionId,
        'competitionTitle': competitionTitle,
        'userId': userId,
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
    }
  }

  getCompetitionDetailsById1(
      BuildContext context, competitionId, competitionTitle) async {
    selectedCompetitionId = competitionId;
    selectedCompetitionTitle = competitionTitle;
    try {
      dynamic userId = await _secureStorage.getUserId();
      dynamic isGuestUser = await _secureStorage.getIsGuestUser();
      dynamic isLoggedOut = await _secureStorage.getIsLoggedOut();
      CommonResponse<CompetitionDetailsResponse> competitionDetailResponse =
          await categoryListingRepository
              .getCompetitionDetailsById(competitionId);
      List<ImageListingModel> imageList = [];

      for (var entry in competitionDetailResponse.Data.data) {
        ImageListingModel imageModel = ImageListingModel(
            image: entry.imageLocation,
            imageId: entry.imageId,
            competitionId: entry.competitionId,
            competitionTitle: entry.title,
            imageListCount: competitionDetailResponse.Data.data.length,
            minimumVotes: entry.minimumVotes);
        imageList.add(imageModel);
      }

      categoryListingModelObj.imageListingModel.value = imageList;
      update();
      if (competitionDetailResponse.Data.data[0].imageLocation != null) {
        Get.toNamed(AppRoutes.previewScreen, arguments: {
          'competitionId': competitionId,
          'competitionTitle': competitionTitle,
          'userId': userId,
        });
      } else {
        if (isGuestUser == "true" || isLoggedOut == "true") {
          showAlertDialogBox(
              context,
              "Please sign up or log in to participate in a Competition",
              userId,
              isGuestUser);
        } else {
          showGuestUserAlertDialogBox(
              context,
              "There are no Images, Do you want to participate??",
              competitionId,
              competitionTitle);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block111" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
    }
  }

  refreshData() {
    getCompetitionDetailsById(selectedCompetitionId, selectedCompetitionTitle);
  }

  @override
  void onClose() {
    super.onClose();
    usertypeController.dispose();
    usertypeoneController.dispose();
    usertypetwoController.dispose();
    usertypethreeController.dispose();
    usertypefourController.dispose();
    usertypefiveController.dispose();
    usertypesixController.dispose();
    usertypesevenController.dispose();
    usertypeeightController.dispose();
  }

  showGuestUserAlertDialogBox(BuildContext context, String content,
      String competitionId, String competitionTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomGuestUserAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText1: "CANCEL",
          buttonText2: "YES",
          onTapButton1: () {
            Get.back();
          },
          onTapButton2: () {
            Get.back();
            Get.toNamed(AppRoutes.participateInCompScreen, arguments: {
              'competitionId': competitionId,
              'competitionTitle': competitionTitle,
              'isCompImageListingScreen': true
            });
          },
        );
      },
    );
  }

  showAlertDialogBox(
      BuildContext context, String content, String userId, String isGuestUser) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText: "LOG IN",
          onTap: () {
            (userId != "0" && isGuestUser == "true")
                ? Get.toNamed(
                    AppRoutes.signUpGuestUserScreen,
                  )
                : Get.toNamed(
                    AppRoutes.signInScreen,
                  );
          },
        );
      },
    );
  }
}
