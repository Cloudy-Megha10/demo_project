import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kainok_app/core/models/geo_location_model.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/core/utils/geoLocation_utils.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:kainok_app/presentation/voting_screen_page/controller/voting_screen_repository.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/carousel_competition_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/competition_model.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/create_guest_user_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/competition_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/get_near_by_comp_to_vote_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/home_screen_device_reg_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/carousel_item_model.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/slider_frame_item_model.dart';
import 'package:kainok_app/routes/app_routes.dart';
import 'package:kainok_app/widgets/custom_bottom_bar.dart';
import 'package:mobile_number/mobile_number.dart';

class VotingScreenController extends GetxController {
  CarouselItemModel listCarouselItemModelObj = CarouselItemModel();

  Rx<int> silderIndex = 0.obs;

  VotingScreenRepository votingScreenRepository = VotingScreenRepository();
  RxList<CompetitionModel> competitions = RxList();
  Rx<BottomBarEnum> type = BottomBarEnum.Competition.obs;
  SecureStorage _secureStorage = SecureStorage();

  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

  RxInt current = 0.obs;

  RxString categoryItem = "".obs;
  RxString selectedCategoryId = "".obs;
  RxBool alertValue = false.obs;

  RxString counts = "".obs;
  RxString userId = "".obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetailsFromStorage();
    getLocation();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "test_channel",
            title: "lbl_pixat".tr,
            body: "Hello, Your friend has shared you a Image"));
    AwesomeNotifications().setListeners(onActionReceivedMethod: notificSent());
  }

  notificSent() async {
    Get.toNamed(AppRoutes.globalCompScreen);
  }

  initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }

    try {
      var phNo = (await MobileNumber.mobileNumber)!;
      return phNo.substring(phNo.length - 10);
    } on PlatformException catch (e) {
      print("Failed to get mobile number because of '${e.message}'");
    }
  }

  Future<void> isDeviceRegistered() async {
    try {
      dynamic iemiNo = await _secureStorage.getIemiNo();
      dynamic mobileNo = await _secureStorage.getDeviceInfoMobileNo();

      if (mobileNo == null) {
        mobileNo = initMobileNumberState();
      }

      CommonResponse<IsDeviceRegisteredResponse> getIsDeviceRegInfo =
          await votingScreenRepository.getDeviceRegisteredInfo(
              mobileNo, iemiNo);
      print("getDeviceRegInfo111----");
      print(getIsDeviceRegInfo);
      print(getIsDeviceRegInfo.Data);
      print(getIsDeviceRegInfo.Data.data.isGuestUser);
      print(getIsDeviceRegInfo.Message);

      _secureStorage
          .setIsGuestUser(getIsDeviceRegInfo.Data.data.isGuestUser.toString());
      _secureStorage.setUserId(getIsDeviceRegInfo.Data.data.userId.toString());
      // Fluttertoast.showToast(
      //   msg: updateUserResponse.Message,
      //   backgroundColor: Colors.grey,
      // );
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  Future<void> createGuestUser(context, compId, compTitle) async {
    CategoryListingController categoryListingController =
        Get.put(CategoryListingController());
    try {
      CommonResponse<CreateGuestUserResponse> guestUserCreation =
          await votingScreenRepository.saveGuestUser(
              await _secureStorage.getDeviceInfoMobileNo(),
              await _secureStorage.getIemiNo(),
              await _secureStorage.getCity(),
              "Guest User");
      print("guestUserCreation----");
      print(guestUserCreation);
      print(guestUserCreation.Data);
      print(guestUserCreation.Data.data);
      print(guestUserCreation.Message);

      _secureStorage.setUserId(guestUserCreation.Data.data.toString());
      categoryListingController.getCompetitionDetailsById1(
          context, compId, compTitle);
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  getUserDetailsFromStorage() async {
    final id = await _secureStorage.getUserId();
    userId.value = (id != null) ? id.toString() : "";
  }

  refreshData() {
    getNearByCompToVote();
    getUserDetailsFromStorage();
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";

      // Use the location object here
      print("Latitude: ${location.lat}, Longitude: ${location.long}");

      getNearByCompToVote();
      getTrendingCompetitions();
    });
  }

  // competitionsGetApi GET API
  void getCompetitions() async {
    CommonResponse<CompetitionResponse> getCompetitionsResponse =
        await votingScreenRepository.getCompetitionsData(
            // 12.971599, 77.594566);
            currentLatitude.value,
            currentLongitude.value);
    if (getCompetitionsResponse.Status) {
      competitions.value = (getCompetitionsResponse.Data.data)
          .map((item) => CompetitionModel(
              competitionId: item.competitionId,
              imageId: item.imageId,
              title: item.title,
              categoryTitle: item.categoryTitle,
              imageLocation: item.imageLocation,
              categoryId: item.categoryId,
              counts: item.minimumVotes))
          .toList();
      isLoading.value = false;

      // });
    } else {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  void getNearByCompToVote() async {
    CommonResponse<GetNearByCompToVote> getNearByCompToVoteResponse =
        await votingScreenRepository.getNearByCompToVoteData(
            currentLatitude.value, currentLongitude.value);
    if (getNearByCompToVoteResponse.Status) {
      print("getNearByCompToVoteResponse");
      print(getNearByCompToVoteResponse.Data.data.length);
      competitions.value = (getNearByCompToVoteResponse.Data.data)
          .map((item) => CompetitionModel(
              competitionId: item.competitionId,
              imageId: item.imageId,
              title: item.title,
              categoryTitle: item.categoryTitle,
              imageLocation: item.imageLocation,
              categoryId: item.categoryId,
              counts: item.minimumVotes))
          .toList();
      print("competitions.value");
      print(competitions.value.length);
      isLoading.value = false;
    } else {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  // competitionsGetApi GET API
  void getRangeCompetitions(distance) async {
    final setRange = await _secureStorage.setRange(distance);
    CommonResponse<CompetitionResponse> getCompetitionsResponse =
        await votingScreenRepository.getCompetitionsByRangeData(
            // 12.971599,
            // 77.594566,
            //);
            currentLatitude.value,
            currentLongitude.value,
            distance);
    if (getCompetitionsResponse.Status) {
      competitions.value = (getCompetitionsResponse.Data.data)
          .map((item) => CompetitionModel(
                competitionId: item.competitionId,
                imageId: item.imageId,
                title: item.title,
                categoryTitle: item.categoryTitle,
                imageLocation: item.imageLocation,
                categoryId: item.categoryId,
              ))
          .toList();
    } else {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    }
  }

  // trendingGetApi GET API

  void getTrendingCompetitions() async {
    try {
      CommonResponse<CarouselCompetitionResponse> trendingGetResult =
          await votingScreenRepository.getTrendingData(
              currentLatitude.value, currentLongitude.value);
      listCarouselItemModelObj.carouselCompetitions.clear();
      if (trendingGetResult.Status) {
        for (var entry in trendingGetResult.Data.data) {
          counts.value = trendingGetResult.Data.data.length.toString();
          SliderItemModel sliderItemModel = SliderItemModel(
              imageLocation: entry.imageLocation,
              categoryTitle: entry.categoryTitle,
              imageId: entry.imageId,
              competitionId: entry.competitionId,
              competitionTitle: entry.title,
              counts: entry.score);
          listCarouselItemModelObj.carouselCompetitions.add(sliderItemModel);
        }
      } else {}
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block",
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  // globalTrendingGetApi

  void globalTrendingGetApi() async {
    print("getTrendingApi");
    try {
      CommonResponse<CarouselCompetitionResponse> globalTrendingGetResult =
          await votingScreenRepository.getGlobalTrendingData();
      print("response");
      print(globalTrendingGetResult.Data);
      listCarouselItemModelObj.carouselCompetitions.clear();

      for (var entry in globalTrendingGetResult.Data.data) {
        counts.value = globalTrendingGetResult.Data.data.length.toString();
        SliderItemModel globalTrendingItemModel = SliderItemModel(
            imageLocation:
                entry.imageLocation != null ? entry.imageLocation : "",
            categoryTitle: entry.categoryTitle,
            imageId: entry.imageId,
            competitionId: entry.competitionId,
            competitionTitle: entry.title,
            counts: entry.score);

        listCarouselItemModelObj.carouselCompetitions
            .add(globalTrendingItemModel);
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //   msg: "Kindly Create the competition",
      //   backgroundColor: ColorConstant.gray100,
      // );
      return null;
    }
  }

  // trendingGetApi GET API

  void highPrizeGetApi() async {
    try {
      CommonResponse<CarouselCompetitionResponse> highPrizeGetResult =
          await votingScreenRepository.getHighPrizeData(
              currentLatitude.value, currentLongitude.value);
      print("response");
      print(highPrizeGetResult.Data);
      listCarouselItemModelObj.carouselCompetitions.clear();

      for (var entry in highPrizeGetResult.Data.data) {
        counts.value = highPrizeGetResult.Data.data.length.toString();
        SliderItemModel highPrizeItemModel = SliderItemModel(
            imageLocation: entry.imageLocation,
            categoryTitle: entry.categoryTitle,
            imageId: entry.imageId,
            competitionId: entry.competitionId,
            competitionTitle: entry.title,
            counts: entry.score);
        listCarouselItemModelObj.carouselCompetitions.add(highPrizeItemModel);
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //   msg: "Kindly Create the competition",
      //   backgroundColor: ColorConstant.gray100,
      // );
      return null;
    }
  }

  // trendingGetApi GET API

  void featureGetApi() async {
    try {
      CommonResponse<CarouselCompetitionResponse> featureGetResult =
          await votingScreenRepository.getFeatureData(
              currentLatitude.value, currentLongitude.value);
      listCarouselItemModelObj.carouselCompetitions.clear();

      for (var entry in featureGetResult.Data.data) {
        counts.value = featureGetResult.Data.data.length.toString();
        SliderItemModel globalTrendingItemModel = SliderItemModel(
            imageLocation: entry.imageLocation,
            categoryTitle: entry.categoryTitle,
            competitionTitle: entry.title,
            competitionId: entry.competitionId,
            imageId: entry.imageId,
            counts: entry.score);
        listCarouselItemModelObj.carouselCompetitions
            .add(globalTrendingItemModel);
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //   msg: "Kindly Create the competition",
      //   backgroundColor: ColorConstant.gray100,
      // );
      return null;
    }
  }

  // trendingGetApi GET API

  void closingHrsGetApi() async {
    try {
      CommonResponse<CarouselCompetitionResponse> closingCompetitionsGetResult =
          await votingScreenRepository.getClosing24HrsData(
              currentLatitude.value, currentLongitude.value);
      print("response");
      print(closingCompetitionsGetResult.Data);
      listCarouselItemModelObj.carouselCompetitions.clear();

      for (var entry in closingCompetitionsGetResult.Data.data) {
        counts.value = closingCompetitionsGetResult.Data.data.length.toString();
        SliderItemModel globalTrendingItemModel = SliderItemModel(
            imageLocation: entry.imageLocation,
            categoryTitle: entry.categoryTitle,
            imageId: entry.imageId,
            competitionId: entry.competitionId,
            competitionTitle: entry.title,
            counts: entry.score);
        listCarouselItemModelObj.carouselCompetitions
            .add(globalTrendingItemModel);
      }
    } catch (e) {
      // Fluttertoast.showToast(
      //   msg: "Kindly Create the competition",
      //   backgroundColor: ColorConstant.gray100,
      // );
      return null;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
