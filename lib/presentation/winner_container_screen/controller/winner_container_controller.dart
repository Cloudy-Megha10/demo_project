import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/models/geo_location_model.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/core/utils/geoLocation_utils.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/presentation/winner_container_screen/controller/winner_container_repository.dart';
import 'package:demo_project/presentation/winner_container_screen/models/get_winner_response.dart';
import 'package:demo_project/presentation/winner_container_screen/models/winner_item_model.dart';
import 'package:demo_project/widgets/custom_bottom_bar.dart';

class WinnerContainerController extends GetxController {
  RxList<WinnerItemModel> winnerItemList = RxList();
  SecureStorage _secureStorage = SecureStorage();

  RxInt silderIndex = 0.obs;
  Rx<BottomBarEnum> type = BottomBarEnum.Competition.obs;
  WinnerRepository winnerRepository = WinnerRepository();

  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  RxString userId = "".obs;

  @override
  void onInit() {
    getLocation();
    getAllWinners();
    getUserDetailsFromStorage();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getUserDetailsFromStorage() async {
    final id = await _secureStorage.getUserId();
    userId.value = (id != null) ? id.toString() : "";
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

  getAllWinners() async {
    try {
      CommonResponse<WinnerResponse> allWinnerResult = await winnerRepository
          .getAllWinnersData(currentLatitude.value, currentLongitude.value);

      winnerItemList.clear();

      for (var entry in allWinnerResult.Data.data) {
        WinnerItemModel winnerItemModel = WinnerItemModel(
          winnerImage: entry.imageLocation.toString(),
          clientName: entry.userName.toString(),
          clientImage: entry.userImageLocation != null
              ? entry.userImageLocation.toString()
              : "",
          noOfVotes: entry.totalLikes.toString(),
        );
        winnerItemList.add(winnerItemModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
