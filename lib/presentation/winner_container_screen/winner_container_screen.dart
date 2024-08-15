import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/core/utils/image_constant.dart';
import 'package:kainok_app/core/utils/size_utils.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/controller/profile_deatils_my_participation_tab_container_controller.dart';
import 'package:kainok_app/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:kainok_app/presentation/winner_container_screen/controller/winner_container_controller.dart';
import 'package:kainok_app/routes/app_routes.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import 'package:kainok_app/theme/app_style.dart';
import 'package:kainok_app/widgets/custom_alert_dialog.dart';
import 'package:kainok_app/widgets/custom_bottom_bar.dart';
import 'package:kainok_app/widgets/custom_button.dart';
import 'dart:math' as math;

import 'package:kainok_app/widgets/custom_image_view.dart';

class WinnerContainerScreen extends StatefulWidget {
  @override
  _WinnerContainerScreenState createState() => _WinnerContainerScreenState();
}

class _WinnerContainerScreenState extends State<WinnerContainerScreen> {
  final WinnerContainerController controller =
      Get.put(WinnerContainerController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshPage();
    });
  }

  Future<void> _refreshPage() async {
    await controller.getAllWinners();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      body: Obx(() => controller.winnerItemList.isEmpty
          ? Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: getPadding(left: 50, right: 50, bottom: 30),
                  child: CustomImageView(
                    alignment: Alignment.center,
                    svgPath: ImageConstant.winnerDefault,
                    height: getSize(70),
                    width: getSize(70),
                  ),
                ),
                Text(
                  "lbl_no_winners_at_this_time".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtAllerBold23,
                ),
                Padding(
                    padding: getPadding(left: 50, right: 50, top: 10),
                    child: Text(
                      "lbl_continue_voting_finest_photography".tr,
                      textAlign: TextAlign.center,
                    )),
              ],
            ))
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(
                    height: getVerticalSize(112),
                    width: getHorizontalSize(389),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: getPadding(
                              left: 50,
                              top: 22,
                              right: 50,
                              bottom: 22,
                            ),
                            decoration: AppDecoration.fillWhiteA700,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: getPadding(bottom: 4),
                                  child: Text(
                                    "msg_last_week_winner".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAllerBold23,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: getHorizontalSize(258),
                            child: Text(
                              "msg_words_expressing".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtAller14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        height: MediaQuery.of(context).size.height * 0.5,
                        initialPage: 0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          controller.silderIndex.value = index;
                        },
                      ),
                      itemCount: controller.winnerItemList.length > 2
                          ? 2
                          : controller.winnerItemList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                            padding: getPadding(left: 35, right: 35),
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                          height: getVerticalSize(800),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          decoration: AppDecoration
                                              .fillWhiteA700
                                              .copyWith(
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(20)),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 40),
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              40)),
                                                  child: CustomImageView(
                                                    url: controller
                                                        .winnerItemList[index]
                                                        .winnerImage,
                                                    fit: BoxFit.cover,
                                                    height:
                                                        getVerticalSize(700),
                                                    width: getHorizontalSize(
                                                        342), // Set the image width to match the card's width
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                      left: 220,
                                                      right: 39,
                                                      top: 24),
                                                  child: Column(
                                                    children: [
                                                      CustomButton(
                                                        height:
                                                            getVerticalSize(28),
                                                        width:
                                                            getHorizontalSize(
                                                                63),
                                                        text: controller
                                                            .winnerItemList[
                                                                index]
                                                            .noOfVotes
                                                            .toString(),
                                                        variant: ButtonVariant
                                                            .FillWhiteA700cc,
                                                        shape: ButtonShape
                                                            .RoundedBorder20,
                                                        padding: ButtonPadding
                                                            .PaddingT5,
                                                        fontStyle:
                                                            ButtonFontStyle
                                                                .PoppinsMedium11,
                                                        suffixWidget: Container(
                                                          margin: getMargin(
                                                              left: 4),
                                                          child:
                                                              CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgFavorite,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                      left: 41,
                                                      right: 39,
                                                      top: 230),
                                                  child: Column(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 30,
                                                        backgroundColor:
                                                            ColorConstant
                                                                .whiteA700,
                                                        child: CircleAvatar(
                                                          backgroundImage: controller
                                                                  .winnerItemList[
                                                                      index]
                                                                  .clientImage
                                                                  .isNotEmpty
                                                              ? NetworkImage(controller
                                                                  .winnerItemList[
                                                                      index]
                                                                  .clientImage)
                                                              : null,
                                                          radius: 28,
                                                          backgroundColor:
                                                              ColorConstant
                                                                  .gray300,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(
                                                      left: 41,
                                                      right: 39,
                                                      top: 320),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        controller
                                                            .winnerItemList[
                                                                index]
                                                            .clientName
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtAller14Black900,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Transform.rotate(
                                              angle: -math.pi / 4,
                                              child: Container(
                                                height: 30.0,
                                                width: 30.0,
                                                color: Colors.transparent,
                                                child: Container(
                                                  decoration: AppDecoration
                                                      .fillYellow700,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Transform.rotate(
                                                      angle: math.pi / 4,
                                                      child: Text(
                                                        "${index + 1}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtAllerBold14WhiteA700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgStar,
                                          height: getSize(24),
                                          width: getSize(24),
                                          alignment: Alignment.topCenter,
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgStar,
                                          height: getSize(16),
                                          width: getSize(16),
                                          alignment: Alignment.topCenter,
                                          margin: getMargin(left: 45, top: 20),
                                        ),
                                        CustomImageView(
                                          svgPath: ImageConstant.imgStar,
                                          height: getSize(16),
                                          width: getSize(16),
                                          alignment: Alignment.topCenter,
                                          margin: getMargin(top: 20, right: 42),
                                        ),
                                      ],
                                      // ),
                                    ),
                                  )
                                ]));
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  Obx(() => Container(
                        width: getHorizontalSize(389),
                        padding: getPadding(left: 15, right: 15),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Align(
                            alignment: Alignment.center,
                            child: controller.winnerItemList.length > 2
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      mainAxisSpacing: getHorizontalSize(16),
                                      crossAxisSpacing: getHorizontalSize(16),
                                    ),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.winnerItemList.length - 2,
                                    itemBuilder: (context, index) {
                                      // Build the grid item for items starting from the 11th item
                                      final itemIndex = index +
                                          2; // Adjust the index to start from 10
                                      final item =
                                          controller.winnerItemList[itemIndex];
                                      return Align(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(
                                              height: getVerticalSize(800),
                                              width: getHorizontalSize(183),
                                              decoration: AppDecoration
                                                  .fillWhiteA700
                                                  .copyWith(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(20)),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  20)),
                                                      child: CustomImageView(
                                                        url: item.winnerImage,
                                                        fit: BoxFit.cover,
                                                        height: getVerticalSize(
                                                            700),
                                                        width: getHorizontalSize(
                                                            342), // Set the image width to match the card's width
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          left: 41,
                                                          right: 39,
                                                          top: 24),
                                                      child: Column(
                                                        children: [
                                                          CustomButton(
                                                            height:
                                                                getVerticalSize(
                                                                    28),
                                                            width:
                                                                getHorizontalSize(
                                                                    63),
                                                            text: item.noOfVotes
                                                                .toString(),
                                                            variant: ButtonVariant
                                                                .FillWhiteA700cc,
                                                            shape: ButtonShape
                                                                .RoundedBorder20,
                                                            padding:
                                                                ButtonPadding
                                                                    .PaddingT5,
                                                            fontStyle:
                                                                ButtonFontStyle
                                                                    .PoppinsMedium11,
                                                            suffixWidget:
                                                                Container(
                                                              margin: getMargin(
                                                                  left: 4),
                                                              child:
                                                                  CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgFavorite,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          left: 41,
                                                          right: 39,
                                                          top: 175),
                                                      child: Column(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 20,
                                                            backgroundColor:
                                                                ColorConstant
                                                                    .whiteA700,
                                                            child: CircleAvatar(
                                                              backgroundImage: item
                                                                      .clientImage
                                                                      .isNotEmpty
                                                                  ? NetworkImage(
                                                                      item.clientImage)
                                                                  : null,
                                                              radius: 18,
                                                              backgroundColor:
                                                                  ColorConstant
                                                                      .gray300,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                          left: 41,
                                                          right: 39,
                                                          top: 220),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            item.clientName
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtAller14Black900,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25),
                                              child: Align(
                                                alignment: Alignment.topCenter,
                                                child: Transform.rotate(
                                                  angle: -math.pi / 4,
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 30.0,
                                                    color: Colors.transparent,
                                                    child: Container(
                                                      decoration: AppDecoration
                                                          .fillYellow700,
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Transform.rotate(
                                                          angle: math.pi / 4,
                                                          child: Text(
                                                            "${itemIndex + 1}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtAllerBold14WhiteA700,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant.imgStar,
                                              height: getSize(24),
                                              width: getSize(24),
                                              alignment: Alignment.topCenter,
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant.imgStar,
                                              height: getSize(16),
                                              width: getSize(16),
                                              alignment: Alignment.topCenter,
                                              margin:
                                                  getMargin(left: 45, top: 20),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant.imgStar,
                                              height: getSize(16),
                                              width: getSize(16),
                                              alignment: Alignment.topCenter,
                                              margin:
                                                  getMargin(top: 20, right: 42),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : SizedBox(height: 500),
                          ),
                        ]),
                      )),
                  SizedBox(
                    height: 30,
                  )
                ]))),
      floatingActionButton: GestureDetector(
          onTap: () async {
            SecureStorage _secureStorage = SecureStorage();
            dynamic userId = await _secureStorage.getUserId();
            onTapCreateCompetition(context, userId);
          },
          child: Padding(
            padding: getPadding(top: 40),
            child: Stack(children: [
              Container(
                  height: getVerticalSize(88),
                  width: getHorizontalSize(59),
                  padding: getPadding(left: 17, top: 32, right: 17, bottom: 32),
                  decoration: AppDecoration.outlineBlack90019
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder28),
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
    ));
  }

// Handling page based on route
  void getCurrentWidget(BottomBarEnum type) {
    if (type == BottomBarEnum.Competition) {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
    } else if (type == BottomBarEnum.Winner) {
      Get.toNamed(AppRoutes.winnerContainerScreen)
          ?.then((value) => Get.delete<WinnerContainerController>());
    } else if (type == BottomBarEnum.Profile) {
      onTapProfileScreen(context, controller.userId.value);
    } else if (type == BottomBarEnum.Voting) {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    }
  }

  onTapColumntrending() {
    Get.toNamed(AppRoutes.previewScreen);
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

  onTapProfileScreen(BuildContext context, String userId) async {
    SecureStorage _secureStorage = SecureStorage();
    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
    dynamic userId = await _secureStorage.getUserId();
    dynamic isLoggedOut = await _secureStorage.getIsLoggedOut();

    (isGuestUser == "true" && userId != "0")
        ? Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
            ?.then((value) => Get.delete<
                ProfileDeatilsMyParticipationTabContainerController>())
        : (isGuestUser == "true")
            ? showAlertDialogBox(
                context,
                "Please sign up or log in to view the Profile",
                userId,
                isGuestUser)
            : Get.toNamed(
                    AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
                ?.then((value) => Get.delete<
                    ProfileDeatilsMyParticipationTabContainerController>());
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
}
