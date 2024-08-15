import 'package:flutter/material.dart';

import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/core/utils/image_constant.dart';
import 'package:kainok_app/core/utils/size_utils.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/voting_screen_page/controller/voting_screen_controller.dart';
import 'package:kainok_app/routes/app_routes.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import 'package:kainok_app/theme/app_style.dart';
import 'package:kainok_app/widgets/app_bar/appbar_image.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kainok_app/widgets/custom_alert_dialog.dart';
import 'package:kainok_app/widgets/custom_button.dart';
import 'package:kainok_app/widgets/custom_guest_user_alert_dialog.dart';
import 'package:kainok_app/widgets/custom_image_view.dart';

class CategoryListingScreen extends GetWidget<CategoryListingController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    bool isCompScreen = data['isCompScreen'];
    dynamic categoryId = data['categoryId'];
    return WillPopScope(
        onWillPop: () async {
          isCompScreen
              ? Get.toNamed(AppRoutes.competitionsScreen)
                  ?.then((value) => Get.delete<CompetitionsScreenController>())
              : Get.toNamed(AppRoutes.votingScreenPage)
                  ?.then((value) => Get.delete<VotingScreenController>());
          return false;
        },
        child: Obx(() => SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                // appBar: CustomAppBar(
                //     height: getVerticalSize(74),
                //     leadingWidth: 48,
                //     leading: AppbarImage(
                //         height: getSize(24),
                //         width: getSize(24),
                //         svgPath: ImageConstant.imgArrowleftGray900,
                //         margin: getMargin(left: 24, top: 23, bottom: 23),
                //         onTap: () {
                //           onTapBackArrow(isCompScreen);
                //         }),
                //     title: Padding(
                //         padding: getPadding(left: 16),
                //         child: Row(
                //           children: [
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   AppbarTitle(
                //                       text:
                //                           controller.competitionCategory.value),
                //                 ]),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   AppbarSubTitle(
                //                     text:
                //                         '(${controller.counts.value} Competitions)',
                //                   )
                //                 ]),
                //           ],
                //         ))),
                body: SizedBox(
                    width: size.width,
                    child: Padding(
                        padding: getPadding(left: 24, right: 24, top: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getSize(70),
                                decoration: AppDecoration
                                    .searchViewBoxDecoration
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder28),
                                child: Padding(
                                  padding: getPadding(left: 5, right: 10),
                                  child: TextField(
                                      decoration: InputDecoration(
                                          hintStyle: AppStyle.txtCaption,
                                          hintText: "msg_be_a_part_of_our".tr,
                                          border: InputBorder.none,
                                          labelStyle: AppStyle.txtAllerBold16,
                                          labelText: "lbl_search".tr,
                                          prefixIcon: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgSearchGray50024x24,
                                              height: getSize(24),
                                              width: getSize(24),
                                              margin: getMargin(
                                                  left: 8, top: 8, bottom: 8))),
                                      onChanged: (value) {
                                        controller.filterCmopetition(value);
                                      },
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAllerBold16),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Obx(() => ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller
                                          .foundCompetitions.value.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            margin: getMargin(top: 16),
                                            padding: getPadding(
                                                bottom: 13, left: 10, top: 5),
                                            decoration:
                                                AppDecoration.outlineGray2001,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: controller
                                                            .foundCompetitions
                                                            .value[index]
                                                            .image
                                                            .isNotEmpty
                                                        ? NetworkImage(controller
                                                            .foundCompetitions
                                                            .value[index]
                                                            .image)
                                                        : AssetImage(ImageConstant
                                                                .imgUploadPng)
                                                            as ImageProvider,
                                                    radius: 30,
                                                    backgroundColor:
                                                        Colors.grey[100],
                                                  ),
                                                  GestureDetector(
                                                    child: Padding(
                                                        padding: getPadding(
                                                            left: 16,
                                                            top: 9,
                                                            bottom: 9),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        150),
                                                                child: Text(
                                                                  controller
                                                                      .foundCompetitions
                                                                      .value[
                                                                          index]
                                                                      .competitionTitle,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtAllerBold14Gray900,
                                                                ),
                                                              ),
                                                            ])),
                                                    onTap: () async {
                                                      SecureStorage
                                                          _secureStorage =
                                                          SecureStorage();

                                                      dynamic isGuestUser =
                                                          await _secureStorage
                                                              .getIsGuestUser();
                                                      dynamic userId =
                                                          await _secureStorage
                                                              .getUserId();
                                                      if (isGuestUser ==
                                                              "true" &&
                                                          userId == "0") {
                                                        showGuestUserAlertDialogBox(
                                                          context,
                                                          "You haven't Registered!! Do You want to continue as a guest user??",
                                                          controller
                                                              .foundCompetitions
                                                              .value[index]
                                                              .competitionId
                                                              .toString(),
                                                          controller
                                                              .foundCompetitions
                                                              .value[index]
                                                              .competitionTitle,
                                                        );
                                                      } else {
                                                        isCompScreen
                                                            ? onTapCompetitions(
                                                                controller
                                                                    .foundCompetitions
                                                                    .value[
                                                                        index]
                                                                    .competitionId
                                                                    .toString(),
                                                                controller
                                                                    .foundCompetitions
                                                                    .value[
                                                                        index]
                                                                    .competitionTitle,
                                                                categoryId)
                                                            : controller
                                                                .getCompetitionDetailsById1(
                                                                context,
                                                                controller
                                                                    .foundCompetitions
                                                                    .value[
                                                                        index]
                                                                    .competitionId
                                                                    .toString(),
                                                                controller
                                                                    .foundCompetitions
                                                                    .value[
                                                                        index]
                                                                    .competitionTitle,
                                                              );
                                                      }
                                                    },
                                                  ),
                                                  Spacer(
                                                    flex: 5,
                                                  ),
                                                  // SizedBox(
                                                  //   width: 160,
                                                  // ),
                                                  isCompScreen
                                                      ? GestureDetector(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgUser,
                                                              height:
                                                                  getSize(24),
                                                              width:
                                                                  getSize(24),
                                                              color:
                                                                  ColorConstant
                                                                      .gray600Dd,
                                                            ),
                                                          ),
                                                          onTap: () async {
                                                            SecureStorage
                                                                _secureStorage =
                                                                SecureStorage();

                                                            dynamic
                                                                isGuestUser =
                                                                await _secureStorage
                                                                    .getIsGuestUser();
                                                            dynamic userId =
                                                                await _secureStorage
                                                                    .getUserId();
                                                            dynamic
                                                                isLoggedOut =
                                                                await _secureStorage
                                                                    .getIsLoggedOut();

                                                            if (isGuestUser ==
                                                                    "true" ||
                                                                isLoggedOut ==
                                                                    "true") {
                                                              showAlertDialogBox(
                                                                  context,
                                                                  "Please sign up or log in to participate in a Competition",
                                                                  userId,
                                                                  isGuestUser);
                                                            } else {
                                                              onTapParticipateCompetition(
                                                                  controller
                                                                      .foundCompetitions
                                                                      .value[
                                                                          index]
                                                                      .competitionId
                                                                      .toString(),
                                                                  controller
                                                                      .foundCompetitions
                                                                      .value[
                                                                          index]
                                                                      .competitionTitle);
                                                            }
                                                          },
                                                        )
                                                      : Container(),
                                                  Spacer(),
                                                ]));
                                      })),
                                ),
                              )
                            ])))))));
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

  onTapParticipateCompetition(String competitionId, String competitionTitle) {
    Get.toNamed(AppRoutes.participateInCompScreen, arguments: {
      'competitionId': competitionId,
      'competitionTitle': competitionTitle,
      'isCompImageListingScreen': false
    });
  }

  onTapCompetitions(String compId, String compTitle, dynamic categoryId) {
    Get.toNamed(AppRoutes.compImageListingScreen, arguments: {
      'competitionId': compId,
      'competitionTitle': compTitle,
      "isCompImageListingScreen": false,
      'categoryId': categoryId
    });
  }

  onTapImgOverflowmenu() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (builder) {
        return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Padding(
                            padding: getPadding(top: 24),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgEdit,
                                  height: getSize(24),
                                  width: getSize(24)),
                              Padding(
                                  padding:
                                      getPadding(left: 8, top: 5, bottom: 1),
                                  child: Text("lbl_edit_user".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAller14))
                            ])),
                        onTap: () {
                          onTapEdituser();
                        },
                      ),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgPencil,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 8, top: 5, bottom: 1),
                                child: Text("lbl_report_user".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAller14))
                          ])),
                      GestureDetector(
                        child: Padding(
                            padding: getPadding(top: 24),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgTrash,
                                  height: getSize(24),
                                  width: getSize(24)),
                              Padding(
                                  padding:
                                      getPadding(left: 8, top: 5, bottom: 1),
                                  child: Text("lbl_delete_user".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAller14))
                            ])),
                        onTap: () {
                          onTapDeleteuser();
                        },
                      )
                    ])));
      },
    );
  }

  onTapBackArrow(bool isCompScreen) {
    isCompScreen
        ? Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>())
        : Get.toNamed(AppRoutes.votingScreenPage)
            ?.then((value) => Get.delete<VotingScreenController>());
  }

  onTapEdituser() {
    Get.toNamed(
      AppRoutes.createEditUserScreen,
    );
  }

  onTapDeleteuser() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (builder) {
        return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 30, top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("msg_delete_the_user".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtAllerBold16),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("msg_are_you_sure_to".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAller14)),
                      GestureDetector(
                          onTap: () {
                            onTapRowdeleteuserye();
                          },
                          child: Padding(
                              padding: getPadding(
                                  top: 29, right: 6, bottom: 4, left: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                        height: getVerticalSize(60),
                                        width: getHorizontalSize(157),
                                        text: "msg_yes_delete_the".tr,
                                        margin: getMargin(left: 8),
                                        variant: ButtonVariant.FillWhiteA700cc,
                                        padding: ButtonPadding.PaddingAll18,
                                        shape: ButtonShape.RoundedBorder20,
                                        fontStyle: ButtonFontStyle.Aller14),
                                    Padding(
                                        padding: getPadding(right: 35),
                                        child: CustomButton(
                                            height: getVerticalSize(54),
                                            width: getHorizontalSize(139),
                                            text: "lbl_cancel".tr,
                                            variant:
                                                ButtonVariant.FillGray90002,
                                            padding:
                                                ButtonPadding.PaddingAll18))
                                  ])))
                    ])));
      },
    );
  }

  onTapRowdeleteuserye() {
    Get.toNamed(
      AppRoutes.userManagementScreen,
    );
  }
}
