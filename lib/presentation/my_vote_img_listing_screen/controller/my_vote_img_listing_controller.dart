import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/my_comp_img_listing_screen/models/my_comp_img_listing_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../routes/app_routes.dart';
import '../models/my_vote_img_list_response.dart';
import '../models/my_vote_img_listing_item_model.dart';
import '../models/my_vote_img_listing_model.dart';
import 'my_vote_img_listing_repository.dart';

class MyVoteImgListingController extends GetxController {
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
  MyVoteImgListingModel myVotesImgListingModelObj = MyVoteImgListingModel();

  RxString likedController = "".obs;
  RxString disLikedController = "".obs;

  MyVoteImgListingRepository myCompImgListingRepository =
      MyVoteImgListingRepository();

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

  void getMyVotesImageDetails(String compId, String compTitle) async {
    try {
      CommonResponse<GetMyVoteImgListResponse> getMyVoteImgListResult =
          await myCompImgListingRepository.getCompAllImagesData(compId);
      print("getMyVoteImgListResult");
      print(getMyVoteImgListResult.Status);
      print(getMyVoteImgListResult.Data.data.length);
      myVotesImgListingModelObj.ImagesDetailsList.value.clear();
      for (var getMyVoteImgList in getMyVoteImgListResult.Data.data) {
        counts.value = getMyVoteImgListResult.Data.data.length.toString();

        MyVoteImgListingItemModel myVoteImgListingModel =
            MyVoteImgListingItemModel(
                images: getMyVoteImgList.imageLocation != null
                    ? getMyVoteImgList.imageLocation.toString()
                    : "",
                imageTitle: getMyVoteImgList.imageTitle.toString(),
                categoryTitle: getMyVoteImgList.categoryTitle.toString(),
                totalDisLikes: getMyVoteImgList.imageTitle.toString(),
                liked: getMyVoteImgList.liked,
                totalLikes: getMyVoteImgList.imageTitle.toString());

        myVotesImgListingModelObj.ImagesDetailsList.add(myVoteImgListingModel);
      }
      Get.toNamed(AppRoutes.myVotesImgListingScreen,
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

  @override
  void onClose() {
    super.onClose();
  }
}
