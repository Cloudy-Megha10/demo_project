import 'package:get/get.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/presentation/global_comp_screen/models/get_category_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/slider_frame_item_model.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../category_listing_screen/controller/category_listing_controller.dart';
import '../models/competition_model.dart';
import '../models/create_guest_user_response.dart';
import '../models/get_global_trending_response.dart';
import '../models/list_trending_item_model.dart';
import 'global_comp_screen_repository.dart';

class GlobalCompScreenController extends GetxController {
  ListtrendingItemModel listtrendingItemModelObj = ListtrendingItemModel();

  Rx<int> silderIndex = 0.obs;

  GlobalCompScreenRepository globalCompScreenRepository =
      GlobalCompScreenRepository();
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

  @override
  void onInit() {
    super.onInit();
    getUserDetailsFromStorage();
    globalTrendingGetApi();
    getLocation();
  }

  @override
  void onReady() async {
    super.onReady();
    globalTrendingGetApi();
    getCompetitions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> createGuestUser(compId, compTitle) async {
    CategoryListingController categoryListingController =
        Get.put(CategoryListingController());
    try {
      CommonResponse<CreateGuestUserResponse> guestUserCreation =
          await globalCompScreenRepository.saveGuestUser(
              await _secureStorage.getDeviceInfoMobileNo(),
              await _secureStorage.getIemiNo(),
              await _secureStorage.getCity(),
              "Guest User");
      _secureStorage.setUserId(guestUserCreation.Data.data.toString());
      categoryListingController.getCompetitionDetailsById(compId, compTitle);
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
    globalTrendingGetApi();
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

      getCompetitions();
      // getTrendingCompetitions();
    });
  }

  void getCompetitions() async {
    CommonResponse<Competition> getCompetitionsResponse =
        await globalCompScreenRepository.getCompetitionsData(
            // 12.971599, 77.594566);
            currentLatitude.value,
            currentLongitude.value);
    if (getCompetitionsResponse.Status) {
      print("getCompetitionsResponse");
      print(getCompetitionsResponse.Data.data.length);
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
      print("competitions.value");
      print(competitions.value.length);
    } else {
      // Get.toNamed(AppRoutes.homeScreenPage, arguments: {
      //   'latitude': currentLatitude.value,
      //   'longitude': currentLongitude.value
      // })?.then((value) => Get.delete<HomeScreenController>());
    }
  }

  // globalTrendingGetApi

  void globalTrendingGetApi() async {
    try {
      CommonResponse<GlobalTrendingResponse> globalTrendingGetResult =
          await globalCompScreenRepository.getGlobalTrendingData();
      print("response");
      print(globalTrendingGetResult.Data);
      listtrendingItemModelObj.globalTrendingImages.value.clear();

      for (var entry in globalTrendingGetResult.Data.data) {
        counts.value = globalTrendingGetResult.Data.data.length.toString();
        SliderItemModel globalTrendingItemModel = SliderItemModel(
            imageLocation: entry.imageLocation,
            categoryTitle: entry.categoryTitle,
            imageId: "",
            counts: entry.minimumVotes);
        listtrendingItemModelObj.globalTrendingImages
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
