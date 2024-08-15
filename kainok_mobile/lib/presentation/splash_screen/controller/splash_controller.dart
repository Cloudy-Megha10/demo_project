import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/splash_screen/controller/splash_repository.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../../core/models/geo_location_model.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/geoLocation_utils.dart';
import '../../../routes/app_routes.dart';
import '../../voting_screen_page/controller/voting_screen_controller.dart';
import '../models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  RxString currentLatitude = "".obs;
  RxString currentLongitude = "".obs;
  List<String> phoneNumbers = [];
  SplashRepository splashRepository = SplashRepository();
  SecureStorage _secureStorage = SecureStorage();

  var imeiNo;
  var iemiNumber;

  @override
  void onInit() {
    super.onInit();
    requestPermission();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
    });
  }

  Future<void> requestPermission() async {
    // MobileNumber.listenPhonePermission((isPermissionGranted) {
    //   if (isPermissionGranted) {
    //     initMobileNumberState();
    //   }
    // });
    PermissionStatus status = await Permission.phone.request();
    if (status.isGranted) {
      await fetchIMEINumber();
      await getLocation();
    } else {
      print('Permission denied.');
    }
  }

  fetchIMEINumber() async {
    var res = await PlatformDeviceId.getDeviceId;
    await _secureStorage.setIemiNumber(res!);
  }

  getLocation() {
    Future<GeoLocationModel> geoLocationModel =
        GeoLocationUtils.getCurrentLocation();

    print("geoLocationModel");
    print(geoLocationModel);
    geoLocationModel.then((location) {
      currentLatitude.value = "${location.lat}";
      currentLongitude.value = "${location.long}";
    });
  }

  // Future<void> initMobileNumberState() async {
  //   // if (!await MobileNumber.hasPhonePermission) {
  //   //   await MobileNumber.requestPhonePermission;
  //   // }

  //   // List<SimCard>? simCards = await MobileNumber.getSimCards;
  //   // List<String> mobileNumbers =
  //   //     simCards!.map((sim) => sim.number ?? '').toList();

  //   // phoneNumbers = mobileNumbers;
  //   // String phNo = phoneNumbers[0];

  //   if (!await MobileNumber.hasPhonePermission) {
  //     await MobileNumber.requestPhonePermission;
  //     return;
  //   }
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     var phNo = (await MobileNumber.mobileNumber)!;
  //     print("phNo");
  //     print(phNo);
  //     var res = phNo.substring(phNo.length - 10);
  //     await _secureStorage.setDeviceInfoMobileNo(res);
  //   } on PlatformException catch (e) {
  //     print("Failed to get mobile number because of '${e.message}'");
  //   }
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
