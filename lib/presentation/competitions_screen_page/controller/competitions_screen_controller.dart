import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:demo_project/core/models/geo_location_model.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/core/utils/geoLocation_utils.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/carousel_competition_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/carousel_item_model.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/competition_model.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/competition_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/competitions_screen_device_reg_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/create_guest_user_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/get_near_by_comp_to_participate_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/slider_frame_item_model.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/widgets/custom_bottom_bar.dart';
import 'package:mobile_number/mobile_number.dart';

import 'competitions_screen_repository.dart';

class CompetitionsScreenController extends GetxController {
  CarouselItemModel listCarouselItemModelObj = CarouselItemModel();

  Rx<int> silderIndex = 0.obs;

  CompetitionsScreenRepository competitionScreenRepository =
      CompetitionsScreenRepository();
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
  CarouselItemModel compNearMeModelObj = CarouselItemModel();
  Rx<List<CompetitionModel>> foundCompetitions = Rx<List<CompetitionModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getUserDetailsFromStorage();
    getLocation();
    isDeviceRegistered();
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
      if (phNo.isNotEmpty) {
        return phNo.substring(phNo.length - 10);
      }
      return phNo;
    } on PlatformException catch (e) {
      print("Failed to get mobile number because of '${e.message}'");
    }
  }

  Future<void> isDeviceRegistered() async {
    try {
      dynamic iemiNo = await _secureStorage.getIemiNo();

      CommonResponse<IsDeviceRegisteredResponse> getIsDeviceRegInfo =
          await competitionScreenRepository.getDeviceRegisteredInfo(iemiNo);
      print("getDeviceRegInfo111----");
      print(getIsDeviceRegInfo.Data.data.isGuestUser);
      print(getIsDeviceRegInfo.Message);

      _secureStorage
          .setIsGuestUser(getIsDeviceRegInfo.Data.data.isGuestUser.toString());
      _secureStorage.setUserId(getIsDeviceRegInfo.Data.data.userId.toString());
      // Fluttertoast.showToast(
      //   msg: updateUserResponse.Message,
      //   backgroundColor: Colors.grey,
      // );
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
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
          await competitionScreenRepository.saveGuestUser(
              await _secureStorage.getDeviceInfoMobileNo(),
              await _secureStorage.getIemiNo(),
              await _secureStorage.getCity(),
              "Guest User");

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
    getNearByCompToParticipate();
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

      getNearByCompToParticipate();
      getTrendingCompetitions();
    });
  }

  // competitionsGetApi GET API
  void getCompetitions() async {
    CommonResponse<CompetitionResponse> getCompetitionsResponse =
        await competitionScreenRepository.getCompetitionsData(
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
    } else {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  void getNearByCompToParticipate() async {
    CommonResponse<GetNearByCompToParticipate>
        getNearByCompToParticipateResponse =
        await competitionScreenRepository.getNearByCompToParticipateData(
            currentLatitude.value, currentLongitude.value);
    if (getNearByCompToParticipateResponse.Status) {
      compNearMeModelObj.competitionListNearMe.clear();

      for (var entry in getNearByCompToParticipateResponse.Data.data) {
        CompetitionModel compItemModel = CompetitionModel(
            competitionId: entry.competitionId,
            imageId: entry.imageId,
            title: entry.title,
            categoryTitle: entry.categoryTitle,
            imageLocation:
                entry.imageLocation != null ? entry.imageLocation : "",
            categoryId: entry.categoryId,
            counts: entry.minimumVotes);
        compNearMeModelObj.competitionListNearMe.add(compItemModel);
      }
      competitions.value = compNearMeModelObj.competitionListNearMe;
      isLoading.value = false;
    } else {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
      });
    }
  }

  filterCompetition(String competitionTitle) async {
    List<CompetitionModel> result = [];
    if (competitionTitle.isEmpty) {
      result = compNearMeModelObj.competitionListNearMe;
    } else {
      result = competitions
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(competitionTitle.toLowerCase()))
          .toList();
    }
    competitions.value = result;
  }

  // competitionsGetApi GET API
  void getRangeCompetitions(distance) async {
    _secureStorage.setRange(distance);
    CommonResponse<CompetitionResponse> getCompetitionsResponse =
        await competitionScreenRepository.getCompetitionsByRangeData(
            currentLatitude.value, currentLongitude.value, distance);
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
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
    }
  }

  // trendingGetApi GET API

  void getTrendingCompetitions() async {
    try {
      CommonResponse<CarouselCompetitionResponse> trendingGetResult =
          await competitionScreenRepository.getTrendingData(
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
    try {
      CommonResponse<CarouselCompetitionResponse> globalTrendingGetResult =
          await competitionScreenRepository.getGlobalTrendingData();
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
          await competitionScreenRepository.getHighPrizeData(
              currentLatitude.value, currentLongitude.value);
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
          await competitionScreenRepository.getFeatureData(
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
          await competitionScreenRepository.getClosing24HrsData(
              currentLatitude.value, currentLongitude.value);
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
