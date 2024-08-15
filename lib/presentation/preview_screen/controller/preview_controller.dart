import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/presentation/category_listing_screen/models/vote_item_model.dart';
import 'package:demo_project/presentation/my_competitions_screen/controller/my_competitions_controller.dart';
import 'package:demo_project/presentation/preview_screen/controller/preview_repository.dart';
import 'package:demo_project/presentation/preview_screen/models/preview_model.dart';
import 'package:demo_project/presentation/preview_screen/models/preview_vote_response.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import 'package:demo_project/routes/app_routes.dart';

class PreviewController extends GetxController {
  Rx<PreviewModel> previewModelObj = PreviewModel().obs;
  PreviewRepository _previewRepository = PreviewRepository();
  RxBool likedPhoto = false.obs;
  final profileDeatilsMyParticipationController =
      Get.put(ProfileDeatilsMyParticipationController());

  final ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
      Get.put(ProfileDeatilsMyVoteController());

  final ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
      Get.put(ProfileDeatilsMyWinningsController());

  final MyCompetitionsController myCompetitionsController =
      Get.put(MyCompetitionsController());
  SecureStorage _secureStorage = SecureStorage();

  @override
  void onReady() {
    super.onReady();
  }

  ///////////////////// POST Login Create

  Future<void> votePost({required List<VoteItemModel> votedImages}) async {
    try {
      CommonResponse<VotePostResponse> votedResult =
          await _previewRepository.votePostedData(votedImages);

      if (votedResult.Status == false) {
        print(votedResult.Data);
        print(votedResult.Message);
        Fluttertoast.showToast(
          msg: votedResult.Message,
          backgroundColor: Colors.grey,
        );
      } else {
        Fluttertoast.showToast(
          msg: votedResult.Message,
          backgroundColor: Colors.grey,
        );
        refreshProfileTabsData();
        Get.toNamed(AppRoutes.imageDetailsScreenContainerScreen);
      }
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      print("error");
      print(errormsg);
    }
  }

  refreshProfileTabsData() async {
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

  @override
  void onClose() {
    super.onClose();
  }
}
