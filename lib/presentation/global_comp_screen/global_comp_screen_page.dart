import 'package:get/get.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/winner_container_screen/controller/winner_container_controller.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/flutter_secure_storage.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_guest_user_alert_dialog.dart';
import '../../widgets/custom_image_view.dart';
import '../category_listing_screen/controller/category_listing_controller.dart';
import '../voting_screen_page/controller/voting_screen_controller.dart';

import 'package:flutter/material.dart';

import 'controller/global_comp_screen_controller.dart';
import 'models/competition_model.dart';

class GlobalCompScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    GlobalCompScreenController controller =
        Get.put(GlobalCompScreenController());
    CategoryListingController categoryListingController =
        Get.put(CategoryListingController());
    Future<void> _refreshPage() async {
      controller.refreshData();
    }

    return WillPopScope(onWillPop: () async {
      return false;
    }, child: Obx(() {
      final Map<String, List<CompetitionModel>> groupedCompetitions = {};
      for (final competition in controller.competitions) {
        if (groupedCompetitions.containsKey(competition.categoryTitle)) {
          groupedCompetitions[competition.categoryTitle]!.add(competition);
        } else {
          groupedCompetitions[competition.categoryTitle] = [competition];
        }
      }

      // Render the home screen with or without competitions
      return DefaultTabController(
          length: 5,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: ColorConstant.whiteA70001,
            // appBar: CustomAppBar(
            //     height: getVerticalSize(75),
            //     centerTitle: true,
            //     title: Container(
            //         child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //           CustomImageView(
            //               svgPath: ImageConstant.imgSearchGray50024x24,
            //               height: getSize(24),
            //               width: getSize(24),
            //               margin: getMargin(left: 40, top: 25, bottom: 8)),
            //           Padding(
            //               padding: getPadding(left: 18, bottom: 1, top: 20),
            //               child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Text("Global Competitions",
            //                         overflow: TextOverflow.ellipsis,
            //                         textAlign: TextAlign.left,
            //                         style: AppStyle.txtAllerBold16),
            //                     Padding(
            //                         padding: getPadding(top: 3),
            //                         child: Text("msg_be_a_part_of_our".tr,
            //                             overflow: TextOverflow.ellipsis,
            //                             textAlign: TextAlign.left,
            //                             style: AppStyle.txtCaption))
            //                   ])),
            //         ])),
            //     styleType: Style.bgFillWhiteA700_2),
            body: RefreshIndicator(
              onRefresh: () async {
                await _refreshPage();
              },
              child: (groupedCompetitions.entries.isEmpty)
                  ? Center(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: getPadding(left: 50, right: 50, top: 10),
                          child: CustomImageView(
                            alignment: Alignment.center,
                            svgPath: ImageConstant.trophy,
                            height: getSize(50),
                            width: getSize(50),
                          ),
                        ),
                        Padding(
                            padding: getPadding(left: 50, right: 50, top: 10),
                            child: Text("lbl_no_global_at_this_time".tr,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtAllerBold17)),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: getPadding(left: 50, right: 50, top: 10),
                            child: CustomButton(
                              height: getVerticalSize(50),
                              width: getHorizontalSize(150),
                              text: "+  Create Competition",
                              margin: getMargin(left: 8),
                              shape: ButtonShape.RoundedBorder20,
                              variant: ButtonVariant.OutlineGray90002,
                              padding: ButtonPadding.PaddingAll6,
                              fontStyle: ButtonFontStyle.Aller12,
                              onTap: () {
                                onTapCreateCompetitionScreen(
                                    context, controller.userId.value);
                              },
                            )),
                      ],
                    ))
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Column(
                                    children: groupedCompetitions.entries
                                        .map((entry) {
                                      final categoryTitle = entry.key;
                                      final competitions = entry.value;
                                      bool isViewAllButtonDisplayed = false;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 25),
                                                    child: Text(categoryTitle,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtAllerBold17),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      '(${competitions.length})',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey[700],
                                                        letterSpacing: 0.25,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: isViewAllButtonDisplayed
                                                      ? Container() // Empty container if button already displayed
                                                      : GestureDetector(
                                                          onTap: () {
                                                            categoryListingController
                                                                .participationCompetitionsByCategoryGetApi(
                                                                    competitions
                                                                        .first
                                                                        .categoryId,
                                                                    false);
                                                          },
                                                          child: CustomButton(
                                                            height:
                                                                getVerticalSize(
                                                                    20),
                                                            width:
                                                                getHorizontalSize(
                                                                    80),
                                                            text: "lbl_view_all"
                                                                .tr,
                                                            margin: getMargin(
                                                                left: 8,
                                                                right: 10),
                                                            shape: ButtonShape
                                                                .CircleBorder14,
                                                            variant: ButtonVariant
                                                                .FillWhiteA700,
                                                            padding:
                                                                ButtonPadding
                                                                    .PaddingAll6,
                                                            fontStyle:
                                                                ButtonFontStyle
                                                                    .Aller11Gray90003,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: competitions
                                                  .take(3)
                                                  .map((competition) {
                                                // Limit to three elements
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 15,
                                                    right: 10,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      // Handle competition selection
                                                    },
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(competition
                                                                    .imageLocation
                                                                    .toString()),
                                                            radius: 50,
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[100],
                                                          ),
                                                          onTap: () async {
                                                            SecureStorage
                                                                _secureStorage =
                                                                SecureStorage();

                                                            dynamic
                                                                isGuestUser =
                                                                await _secureStorage
                                                                    .getIsGuestUser();
                                                            String? userId =
                                                                await _secureStorage
                                                                    .getUserId();
                                                            if (isGuestUser ==
                                                                    "true" &&
                                                                userId == "0") {
                                                              showGuestUserAlertDialogBox(
                                                                  context,
                                                                  "You haven't Registered!! Do You want to continue as a guest user??",
                                                                  competition
                                                                      .competitionId
                                                                      .toString(),
                                                                  competition
                                                                      .title
                                                                      .toString());
                                                            } else {
                                                              categoryListingController.getCompetitionDetailsById(
                                                                  competition
                                                                      .competitionId
                                                                      .toString(),
                                                                  competition
                                                                      .title
                                                                      .toString());
                                                            }
                                                          },
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text(
                                                          competition.title,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors
                                                                .grey[700],
                                                            letterSpacing: 0.25,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ]),
                      ),
                    ),
            ),
            floatingActionButton: GestureDetector(
                onTap: () {
                  onTapCreateCompetitionScreen(
                      context, controller.userId.value);
                },
                child: Padding(
                  padding: getPadding(top: 40),
                  child: Stack(children: [
                    Container(
                        height: getVerticalSize(88),
                        width: getHorizontalSize(59),
                        padding: getPadding(
                            left: 17, top: 32, right: 17, bottom: 32),
                        decoration: AppDecoration.outlineBlack90019.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder28),
                        child: Stack(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgCamera4,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.center)
                        ]))
                  ]),
                )),
            bottomNavigationBar: CustomBottomBar(
              onChanged: (BottomBarEnum type) {
                controller.type.value = type;
                getCurrentWidget(context, controller);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
          )));
    }));
  }

  onTapColumntrending() {
    Get.toNamed(AppRoutes.previewScreen);
  }

  // Handling page based on route
  void getCurrentWidget(
      BuildContext context, GlobalCompScreenController controller) {
    if (controller.type.value == BottomBarEnum.Voting) {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    } else if (controller.type.value == BottomBarEnum.Winner) {
      Get.toNamed(AppRoutes.winnerContainerScreen)
          ?.then((value) => Get.delete<WinnerContainerController>());
    } else if (controller.type.value == BottomBarEnum.Profile) {
      onTapProfileScreen(context, controller.userId.value);
    } else if (controller.type.value == BottomBarEnum.Competition) {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
      ;
    }
  }

  onTapCreateCompetitionScreen(BuildContext context, String userId) async {
    SecureStorage _secureStorage = SecureStorage();
    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
    dynamic userId = await _secureStorage.getUserId();
    dynamic isLoggedOut = await _secureStorage.getIsLoggedOut();
    (isGuestUser == "true" || isLoggedOut == "true")
        ? showAlertDialogBox(
            context,
            "Please sign up or log in to create a Competition",
            userId,
            isGuestUser)
        : Get.toNamed(
            AppRoutes.createCompetitionScreen,
          );
  }

  onTapProfileScreen(BuildContext context, String userId) async {
    SecureStorage _secureStorage = SecureStorage();
    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
    dynamic userId = await _secureStorage.getUserId();

    (isGuestUser == "true" && userId != "0")
        ? Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
        : (isGuestUser == "true")
            ? showAlertDialogBox(
                context,
                "Please sign up or log in to view the Profile",
                userId,
                isGuestUser)
            : Get.toNamed(
                AppRoutes.profileDeatilsMyParticipationTabContainerScreen);
  }

  showAlertDialogBox(
      BuildContext context, String content, String userId, String isGuestUser) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText: "LOG IN",
          onTap: () {
            (userId != "0" && isGuestUser == "true")
                ? Get.toNamed(
                    AppRoutes.signUpGuestUserScreen,
                  )
                : Get.toNamed(
                    AppRoutes.signInScreen,
                  );
          },
        );
      },
    );
  }

  showGuestUserAlertDialogBox(
      BuildContext context, String content, String compId, String compTitle) {
    GlobalCompScreenController controller =
        Get.put(GlobalCompScreenController());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomGuestUserAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText1: "YES",
          buttonText2: "REGISTER",
          onTapButton1: () {
            controller.createGuestUser(compId, compTitle);
          },
          onTapButton2: () {
            Get.back();
            Get.toNamed(
              AppRoutes.createAccountScreen,
            );
          },
        );
      },
    );
  }

  onTapCategoryListingScreen() {
    Get.toNamed(
      AppRoutes.competitionListScreen,
    );
  }
}
