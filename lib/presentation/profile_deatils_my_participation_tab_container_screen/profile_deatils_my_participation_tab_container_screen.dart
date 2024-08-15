import 'package:flutter/material.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/core/utils/image_constant.dart';
import 'package:demo_project/core/utils/size_utils.dart';
import 'package:demo_project/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:demo_project/presentation/my_competitions_screen/controller/my_competitions_controller.dart';
import 'package:demo_project/presentation/my_competitions_screen/my_competitions_screen.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/controller/profile_deatils_my_participation_tab_container_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/controller/profile_deatils_my_vote_controller.dart';
import 'package:demo_project/presentation/profile_deatils_my_winnings_page/controller/profile_deatils_my_winnings_controller.dart';
import 'package:demo_project/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/theme/app_decoration.dart';
import 'package:demo_project/theme/app_style.dart';
import 'package:demo_project/widgets/custom_alert_dialog.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_page/profile_deatils_my_participation_page.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/profile_deatils_my_vote_page.dart';
import 'package:demo_project/presentation/profile_deatils_my_winnings_page/profile_deatils_my_winnings_page.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';
import 'package:demo_project/widgets/custom_bottom_bar.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:demo_project/widgets/custom_image_view.dart';

class ProfileDeatilsMyParticipationTabContainerScreen
    extends GetWidget<ProfileDeatilsMyParticipationTabContainerController> {
  ProfileDeatilsMyParticipationController
      profileDeatilsMyParticipationController =
      Get.put(ProfileDeatilsMyParticipationController());

  ProfileDeatilsMyVoteController profileDeatilsMyVoteController =
      Get.put(ProfileDeatilsMyVoteController());

  ProfileDeatilsMyWinningsController profileDeatilsMyWinnerController =
      Get.put(ProfileDeatilsMyWinningsController());

  MyCompetitionsController myCompetitionsController =
      Get.put(MyCompetitionsController());

  List<Tab> tabs = [
    Tab(
        child: Container(
            child: Text(
      "msg_my_participation".tr,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13),
    ))),
    Tab(
        child: Container(
            child: Text(
      "lbl_my_vote".tr,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13),
    ))),
    Tab(
        child: Container(
            child: Text(
      "lbl_my_winnings".tr,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13),
    ))),
    Tab(
        child: Container(
            child: Text(
      "lbl_my_competition".tr,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 13),
    ))),
  ];

  List<Widget> tabsContent = [
    ProfileDeatilsMyParticipationPage(),
    ProfileDeatilsMyVotePage(),
    ProfileDeatilsMyWinningsPage(),
    MyCompetitionsScreen()
  ];

  Future<void> _refreshPage() async {
    controller.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // Return false to prevent default back button behavior
        },
        child: DefaultTabController(
            length: 4,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: ColorConstant.whiteA70001,
                // appBar: CustomAppBar(
                //     height: getVerticalSize(76),
                //     title: GestureDetector(
                //         child: CustomButton(
                //           width: getHorizontalSize(130),
                //           text: "lbl_profile".tr,
                //           margin: getMargin(top: 30),
                //           variant: ButtonVariant.FillWhiteA700cc,
                //           shape: ButtonShape.CircleBorder14,
                //           padding: ButtonPadding.PaddingAll6,
                //           fontStyle: ButtonFontStyle.AllerBold16,
                //           prefixWidget: Container(
                //               margin: getMargin(right: 16),
                //               child: CustomImageView(
                //                   svgPath: ImageConstant.imgArrowleftGray900)),
                //         ),
                //         onTap: () {
                //           onTapProfile();
                //         }),
                //     styleType: Style.bgFillWhiteA700_1),
                body: RefreshIndicator(
                  onRefresh: () async {
                    await _refreshPage();
                  },
                  child: SingleChildScrollView(
                      child: SizedBox(
                          width: size.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.black900,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder50,
                                  ),
                                  child: Container(
                                    height: getSize(
                                      100,
                                    ),
                                    width: getSize(
                                      100,
                                    ),
                                    decoration:
                                        AppDecoration.fillBlack900.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder50,
                                    ),
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Obx(
                                            () => Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: controller
                                                          .userPhoto
                                                          .value
                                                          .isNotEmpty
                                                      ? NetworkImage(controller
                                                          .userPhoto.value)
                                                      : null,
                                                  radius: 50,
                                                  backgroundColor:
                                                      Colors.grey[100],
                                                ),
                                                GestureDetector(
                                                  child: Icon(Icons.add_a_photo,
                                                      size: 20,
                                                      color: ColorConstant
                                                          .whiteA700),
                                                  onTap: () {
                                                    onTapDocumentUpload();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                      padding: getPadding(top: 16),
                                      child: Text(
                                          controller.firstName.value +
                                              " " +
                                              controller.lastName.value,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtAllerBold14Gray900)),
                                ),
                                Obx(
                                  () => controller
                                          .shouldProfileButtonEnable.value
                                      ? Padding(
                                          padding: getPadding(top: 2),
                                          child: Text(
                                              (controller.firstName.value !=
                                                      "null")
                                                  ? controller.email.value
                                                  : "",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAller14Gray900
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline)))
                                      : Container(),
                                ),
                                Obx(
                                  () => controller
                                          .shouldProfileButtonEnable.value
                                      ? Container(
                                          width: getHorizontalSize(306),
                                          margin: getMargin(
                                              left: 40, top: 15, right: 44),
                                          child: Text(
                                              controller.description.value,
                                              maxLines: null,
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppStyle.txtAller14Gray900))
                                      : Container(),
                                ),
                                Padding(
                                    padding: getPadding(top: 12),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          (controller.shouldProfileButtonEnable
                                                  .value)
                                              ? CustomButton(
                                                  height: getVerticalSize(28),
                                                  width: getHorizontalSize(108),
                                                  text: "lbl_edit_profile".tr,
                                                  variant: ButtonVariant
                                                      .OutlineGray90002,
                                                  shape: ButtonShape
                                                      .CircleBorder14,
                                                  padding:
                                                      ButtonPadding.PaddingAll6,
                                                  fontStyle:
                                                      ButtonFontStyle.Aller12,
                                                  onTap: () {
                                                    onTapEditProfile(context);
                                                  },
                                                )
                                              : Container(),
                                          Obx(() => (controller
                                                  .shouldProfileButtonEnable
                                                  .value)
                                              ? CustomButton(
                                                  height: getVerticalSize(28),
                                                  width: getHorizontalSize(108),
                                                  text:
                                                      "lbl_manage_settings".tr,
                                                  margin: getMargin(left: 8),
                                                  shape: ButtonShape
                                                      .CircleBorder14,
                                                  variant: ButtonVariant
                                                      .FillWhiteA700,
                                                  padding:
                                                      ButtonPadding.PaddingAll6,
                                                  fontStyle: ButtonFontStyle
                                                      .Aller11Gray90003,
                                                  onTap: () {
                                                    onTapShowBottomSheet();
                                                  },
                                                )
                                              : Container())
                                        ])),
                                Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 2, right: 2, top: 10),
                                          child: TabBar(
                                            controller:
                                                controller.tabController,
                                            tabs: tabs,
                                            indicatorColor:
                                                ColorConstant.black900,
                                            labelColor: ColorConstant.black900,
                                            unselectedLabelColor:
                                                ColorConstant.black90099,
                                            labelPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                          )),
                                    ),
                                    Container(
                                        height: 2000,
                                        width: size.width,
                                        child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              TabBarView(
                                                  controller:
                                                      controller.tabController,
                                                  children: tabsContent),
                                            ]))
                                  ],
                                )
                              ]))),
                ),
                floatingActionButton: GestureDetector(
                    onTap: () {
                      onTapCreateCompetition(context, controller.userId);
                    },
                    child: Padding(
                      padding: getPadding(top: 40),
                      child: Stack(children: [
                        Container(
                            height: getVerticalSize(88),
                            width: getHorizontalSize(59),
                            padding: getPadding(
                                left: 17, top: 32, right: 17, bottom: 32),
                            decoration: AppDecoration.outlineBlack90019
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder28),
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
                    getCurrentWidget(controller.type.value);
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterDocked,
              ),
            )));
  }

  // Handling page based on route
  void getCurrentWidget(BottomBarEnum type) {
    if (type == BottomBarEnum.Voting) {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    } else if (type == BottomBarEnum.Winner) {
      Get.toNamed(AppRoutes.winnerContainerScreen);
    } else if (type == BottomBarEnum.Profile) {
      Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
          ?.then((value) => Get.delete<
              ProfileDeatilsMyParticipationTabContainerController>());
    } else if (type == BottomBarEnum.Competition) {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
    }
  }

  onTapColumntrending() {
    Get.toNamed(AppRoutes.previewScreen);
  }

  onTapLogOut() async {
    SecureStorage _secureStorage = SecureStorage();

    await showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "Confirm Exit",
          content: "Are you sure you want to exit?",
          buttonText: "Confirm",
          onTap: () async {
            var userId = await _secureStorage.getUserId();
            var deviceId = await _secureStorage.getIemiNo();
            controller.logout(userId, deviceId);
          },
        );
      },
    );
  }

  onTapShowBottomSheet() async {
    SecureStorage _secureStorage = SecureStorage();
    final userId = await _secureStorage.getUserId();
    final isAdmin = await _secureStorage.getUserTypeAsAdmin();
    final isGuestUser = await _secureStorage.getIsGuestUser();
    final isLoggedOut = await _secureStorage.getIsLoggedOut();
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (builder) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 20, top: 10),
          child: (userId != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      (isAdmin == "true" && isLoggedOut == "false")
                          ? GestureDetector(
                              child: Padding(
                                  padding: getPadding(top: 24),
                                  child: Row(children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getSize(24),
                                      width: getSize(24),
                                      color: ColorConstant.gray600Dd,
                                    ),
                                    Padding(
                                        padding: getPadding(
                                            left: 8, top: 5, bottom: 1),
                                        child: Text("lbl_switch_to_admin".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtAller14))
                                  ])),
                              onTap: () {
                                onTapSwitchtoadmin();
                              },
                            )
                          : Container(),
                      // Padding(
                      //     padding: getPadding(top: 24),
                      //     child: Row(children: [
                      //       CustomImageView(
                      //           svgPath: ImageConstant.imgSettings,
                      //           height: getSize(24),
                      //           width: getSize(24)),
                      //       Padding(
                      //           padding: getPadding(left: 8, top: 5, bottom: 1),
                      //           child: Text("msg_settings_and_privacy".tr,
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style: AppStyle.txtAller14))
                      //     ])),
                      (isGuestUser == "false" && isLoggedOut == "false")
                          ? GestureDetector(
                              child: Padding(
                                  padding: getPadding(top: 24),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: getSize(24),
                                        width: getSize(24)),
                                    Padding(
                                        padding: getPadding(
                                            left: 8, top: 3, bottom: 3),
                                        child: Text("lbl_logout".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtAller14))
                                  ])),
                              onTap: () {
                                onTapLogOut();
                              },
                            )
                          : GestureDetector(
                              child: Padding(
                                  padding: getPadding(top: 24),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgClock,
                                        height: getSize(24),
                                        width: getSize(24)),
                                    Padding(
                                        padding: getPadding(
                                            left: 8, top: 3, bottom: 3),
                                        child: Text("lbl_login".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtAller14))
                                  ])),
                              onTap: () async {
                                SecureStorage _secureStorage = SecureStorage();
                                dynamic isGuestUser =
                                    await _secureStorage.getIsGuestUser();
                                dynamic userId =
                                    await _secureStorage.getUserId();
                                (userId != "0" && isGuestUser == "true")
                                    ? Get.toNamed(
                                        AppRoutes.signUpGuestUserScreen,
                                      )
                                    : Get.toNamed(
                                        AppRoutes.signInScreen,
                                      );
                              },
                            ),
                    ])
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      // Padding(
                      //     padding: getPadding(top: 24),
                      //     child: Row(children: [
                      //       CustomImageView(
                      //           svgPath: ImageConstant.imgSettings,
                      //           height: getSize(24),
                      //           width: getSize(24)),
                      //       Padding(
                      //           padding: getPadding(left: 8, top: 5, bottom: 1),
                      //           child: Text("msg_settings_and_privacy".tr,
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style: AppStyle.txtAller14))
                      //     ])),
                      GestureDetector(
                        child: Padding(
                            padding: getPadding(top: 24),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgClock,
                                  height: getSize(24),
                                  width: getSize(24)),
                              Padding(
                                  padding:
                                      getPadding(left: 8, top: 3, bottom: 3),
                                  child: Text("lbl_login".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAller14))
                            ])),
                        onTap: () {
                          Get.offNamed(
                            AppRoutes.signInScreen,
                          );
                        },
                      ),
                    ]),
        ));
      },
    );
  }

  onTapProfile() {
    Get.toNamed(AppRoutes.competitionsScreen)
        ?.then((value) => Get.delete<CompetitionsScreenController>());
  }

  onTapDocumentUpload() async {
    await controller.saveDocument();
  }
}

onTapEditProfile(BuildContext context) async {
  SecureStorage _secureStorage = SecureStorage();
  dynamic isGuestUser = await _secureStorage.getIsGuestUser();
  dynamic userId = await _secureStorage.getUserId();
  dynamic isLoggedOut = await _secureStorage.getIsLoggedOut();
  (isGuestUser == "true" || isLoggedOut == "true")
      ? showAlertDialogBox(context, "Please sign up or log in to view profile",
          userId, isGuestUser)
      : Get.toNamed(
          AppRoutes.editUserProfileScreen,
        );
}

onTapSwitchtoadmin() {
  Get.toNamed(
    AppRoutes.adminDashboardScreen,
  );
}

onTapModalCreateCompetition() {
  Get.toNamed(
    AppRoutes.createCompetitionScreen,
  );
}

onTapCreateCompetition(BuildContext context, String userId) async {
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
