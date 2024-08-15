import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:demo_project/core/utils/image_constant.dart';
import 'package:demo_project/core/utils/size_utils.dart';
import 'package:demo_project/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:demo_project/presentation/image_details_screen_container_screen/controller/image_details_screen_container_controller.dart';
import 'package:demo_project/presentation/upload_competition_screen/upload_competition_screen.dart';
import 'package:demo_project/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/theme/app_decoration.dart';
import 'package:demo_project/widgets/custom_bottom_bar.dart';
import 'package:demo_project/widgets/custom_image_view.dart';

class ImageDetailsScreenContainerScreen
    extends GetWidget<ImageDetailsScreenContainerController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    BottomBarEnum selectedType = data?['home'] ?? BottomBarEnum.Competition;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToWidget(selectedType);
    });

    return SafeArea(
      child: Scaffold(
        body: Obx(() => navigateToWidget(selectedType)),
        floatingActionButton: GestureDetector(
          onTap: onTapStackcamerafour,
          child: Padding(
            padding: getPadding(top: 40),
            child: Stack(
              children: [
                Container(
                  height: getVerticalSize(88),
                  width: getHorizontalSize(59),
                  padding: getPadding(left: 17, top: 32, right: 17, bottom: 32),
                  decoration: AppDecoration.outlineBlack90019
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder28),
                  child: Stack(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgCamera4,
                        height: getSize(24),
                        width: getSize(24),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            controller.type.value = type;
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  navigateToWidget(BottomBarEnum selectedType) {
    switch (selectedType) {
      case BottomBarEnum.Voting:
        Get.offAllNamed(AppRoutes.votingScreenPage)
            ?.then((value) => Get.delete<VotingScreenController>());
        break;
      case BottomBarEnum.Competition:
        Get.offAllNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>());
        break;
      case BottomBarEnum.Voting:
        Get.offAllNamed(AppRoutes.voteScreen);
        break;
      case BottomBarEnum.Winner:
        Get.offAllNamed(AppRoutes.winnerContainerScreen);
        break;
      case BottomBarEnum.Profile:
        Get.offAllNamed(
            AppRoutes.profileDeatilsMyParticipationTabContainerScreen);
        break;
      default:
        // Handle default case or do nothing
        break;
    }
  }

  void onTapStackcamerafour() {
    Get.offAll(() => UploadCompetitionScreen(),
        arguments: {'competitionId': ''});
  }
}
