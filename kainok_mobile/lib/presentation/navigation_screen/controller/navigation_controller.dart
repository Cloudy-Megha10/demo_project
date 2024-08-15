import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/navigation_screen/controller/navigation_repository.dart';
import 'package:kainok_app/presentation/navigation_screen/models/navigation_model.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/models/user_logout_response.dart';
import 'package:kainok_app/routes/app_routes.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../data/apiClient/common_response.dart';
import '../../edit_profile_screen/models/get_user_response.dart';

class NavigationController extends GetxController {
  Rx<NavigationModel> navigationModelObj = NavigationModel().obs;
  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;

  RxString firstName = "".obs;
  RxString city = "".obs;
  RxString userPhoto = "".obs;
  SecureStorage _secureStorage = SecureStorage();

  NavigationRepository navigationRepository = NavigationRepository();
  dynamic userId = "";

  @override
  void onReady() async {
    super.onReady();
    userId = await _secureStorage.getUserId();
    getLocation();
    if (userId != null) {
      getUserDetails(userId);
    }
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

  void getUserDetails(String userId) async {
    try {
      CommonResponse<GetUserResponse> userGetResult =
          await navigationRepository.getUserData(userId);
      print("response");
      print(userGetResult.Data);
      if (userGetResult.Status == true) {
        firstName.value = userGetResult.Data.data.firstName.toString();
        userPhoto.value =
            userGetResult.Data.data.profilePhotoLocation.toString();
        String location = userGetResult.Data.data.location;
        List<String> coordinates = location.split(',');
        print("coordinates");
        print(coordinates);
        if (coordinates.length == 2) {
          double latitude = double.parse(coordinates[0].trim());
          double longitude = double.parse(coordinates[1].trim());
          print(latitude);
          print(longitude);

          List<Placemark> placemarks = await placemarkFromCoordinates(
              latitude.toDouble(), longitude.toDouble());
          print(placemarks);
          if (placemarks.isNotEmpty) {
            Placemark placemark = placemarks.first;
            String address =
                '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
            city.value = address;
            print("city.value");
            print(city.value);
          }
        }
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
          await navigationRepository.logout(userId, deviceId);
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

  @override
  void onClose() {
    super.onClose();
  }
}
