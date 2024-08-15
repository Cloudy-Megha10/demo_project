import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/date_time_utils.dart';
import 'package:kainok_app/presentation/my_comp_img_listing_screen/models/my_comp_img_listing_model.dart';
import 'package:kainok_app/presentation/user_management_screen/controller/user_management_repository.dart';
import 'package:kainok_app/presentation/user_management_screen/models/user_management_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../routes/app_routes.dart';
import '../../create_edit_user_screen/models/create_user_response.dart';
import '../../create_edit_user_screen/models/get_user_details_by_id_response.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../../edit_profile_screen/models/get_user_response.dart';
import '../../edit_profile_screen/models/update_user_response.dart';
import '../models/edit_comp_bottom_sheet_details_response.dart';
import '../models/get_all_user_response.dart';
import '../models/get_participation_details_response.dart';
import '../models/my_comp_img_listing_item_model.dart';
import '../my_comp_img_listing_screen.dart';
import 'my_comp_img_listing_repository.dart';

class MyCompImgListingController extends GetxController {
  TextEditingController usertypeController = TextEditingController();

  TextEditingController usertypeoneController = TextEditingController();

  TextEditingController usertypetwoController = TextEditingController();

  TextEditingController usertypethreeController = TextEditingController();

  TextEditingController usertypefourController = TextEditingController();

  TextEditingController usertypefiveController = TextEditingController();

  TextEditingController usertypesixController = TextEditingController();

  TextEditingController usertypesevenController = TextEditingController();

  TextEditingController usertypeeightController = TextEditingController();

  MyCompImgListingModel myCompImgListingModelObj = MyCompImgListingModel();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  RxString likedController = "".obs;
  RxString disLikedController = "".obs;

  MyCompImgListingRepository myCompImgListingRepository =
      MyCompImgListingRepository();

  RxString counts = "".obs;

  RxString selectedId = "".obs;

  RxList<String> locationList = [""].obs;

  RxString? _selectedCity;

  RxInt userTypeId = 1003.obs;

  RxString selectedUserId = "".obs;

  RxString firstName = "".obs;

  RxString lastName = "".obs;
  RxString compTitle = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  void getCompetitionsDetails(String compId) async {
    try {
      CommonResponse<EditMyCompBottomSheetDetailsResponse>
          getCompetitionDetailsResult =
          await myCompImgListingRepository.getCompetitionData(compId);
      print("responseGetMyCompetitionDetailsResponse");
      print(getCompetitionDetailsResult.Data);
      compTitle = getCompetitionDetailsResult.Data.data.title.obs;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void getAllCompImageDetails(String compId, String compTitle) async {
    try {
      CommonResponse<GetParticipationDetailsResponse>
          getAllImagesDetailsResult =
          await myCompImgListingRepository.getCompAllImagesData(compId);
      print("getAllImagesDetailsResultResponse");
      print(getAllImagesDetailsResult.Status);
      print(getAllImagesDetailsResult.Data.data.length);
      myCompImgListingModelObj.ImagesDetailsList.value.clear();
      for (var getAllImagesDetailsList in getAllImagesDetailsResult.Data.data) {
        counts.value = getAllImagesDetailsResult.Data.data.length.toString();

        MyCompImgListingItemModel myCompImgListingModel =
            MyCompImgListingItemModel(
                userName: getAllImagesDetailsList.userName.toString(),
                images: getAllImagesDetailsList.imageLocation != null
                    ? getAllImagesDetailsList.imageLocation.toString()
                    : "",
                imageTitle: getAllImagesDetailsList.imageTitle.toString(),
                totalDisLikes: getAllImagesDetailsList.totalDisLikes.toString(),
                totalLikes: getAllImagesDetailsList.totalLikes.toString());
        myCompImgListingModelObj.ImagesDetailsList.add(myCompImgListingModel);
      }
      Get.toNamed(AppRoutes.myCompImgListingScreen,
          arguments: {"competitionId": compId, "competitionTitle": compTitle});
    } catch (e) {
      Fluttertoast.showToast(
        msg: "There are no participation yet!!",
        backgroundColor: ColorConstant.gray100,
      );

      myCompImgListingModelObj.ImagesDetailsList.value.clear();
      Get.toNamed(AppRoutes.myCompImgListingScreen,
          arguments: {"competitionId": compId, "competitionTitle": compTitle});
      return null;
    }
  }

  Future<void> onChange() async {
    if (cityController.text == null || cityController.text == "") {
      print("empty");
    } else {
      autoCompleteSearch(cityController.text);
      print("cityController");
      print(cityController.text);
    }
  }

  selectedValue(String value) {
    cityController.text = value;
    _selectedCity!.value = cityController.text;
  }

  autoCompleteSearch(String value) async {
    FindAutocompletePredictionsResponse result = await myCompImgListingModelObj
        .googlePlace
        .findAutocompletePredictions(value);
    if (result != null && result.predictions != null) {
      print("result");
      print(result.predictions);
      locationList.clear();
      for (var entry in result.predictions) {
        locationList.add(entry.fullText);
      }
      myCompImgListingModelObj.predictions = result.predictions.obs;
    }
  }

  userTypeGetApi() async {
    try {
      CommonResponse<GetAllUserType> allUserTypeGetResult =
          await myCompImgListingRepository.getUserType();

      for (var entry in allUserTypeGetResult.Data.data) {
        // competitionTitle.value = entry.title.toString();
        SelectionPopupModel allUserTypeModel =
            SelectionPopupModel(id: entry.id, title: entry.name);
        myCompImgListingModelObj.userType.add(allUserTypeModel);
        print("allUserTypeGetResult");
        print(allUserTypeModel);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void getUserDetailsById(userId) async {
    try {
      CommonResponse<GetUserResponse> userDetailByIdGetResult =
          await myCompImgListingRepository.getUserDataById(userId);
      print("response");
      print(userDetailByIdGetResult.Data);
      firstNameController.text =
          userDetailByIdGetResult.Data.data.firstName.toString();
      print("firstName");
      print(firstNameController.text);
      lastNameController.text =
          userDetailByIdGetResult.Data.data.lastName.toString();
      emailController.text =
          userDetailByIdGetResult.Data.data.emailId.toString();
      descriptionController.text =
          userDetailByIdGetResult.Data.data.description.toString();
      mobileNumberController.text =
          userDetailByIdGetResult.Data.data.mobileNumber.toString();
      userTypeId.value = userDetailByIdGetResult.Data.data.userType;

      String location = userDetailByIdGetResult.Data.data.location;
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
          cityController.text = address.toString();
          print("cityController.text");
          print(cityController.text);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  void clearData() {
    print("clearing data");
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    cityController.text = '';
    mobileNumberController.text = '';
    descriptionController.text = '';
  }

  @override
  void onClose() {
    super.onClose();
  }
}
