import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/flutter_secure_storage.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_image_view.dart';
import '../voting_screen_page/controller/voting_screen_controller.dart';
import 'controller/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/custom_button.dart';

class NavigationScreen extends GetWidget<NavigationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 32, top: 28, right: 32, bottom: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 7),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(top: 16),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            Obx(
                                              () => CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    controller.userPhoto.value),
                                                radius: 32,
                                                backgroundColor:
                                                    Colors.grey[100],
                                              ),
                                            ),
                                            Padding(
                                                padding: getPadding(
                                                    left: 16,
                                                    top: 11,
                                                    bottom: 10),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Obx(
                                                        () => Text(
                                                            controller.firstName
                                                                .value,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtAllerBold14Gray900),
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 7),
                                                          child: Obx(() => Text(
                                                              controller
                                                                  .city.value,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAller14Gray500)))
                                                    ]))
                                          ]),

                                          // CustomButton(
                                          //     width: getHorizontalSize(150),
                                          //     text: "lbl_user_management2".tr,
                                          //     margin: getMargin(top: 68),
                                          //     shape: ButtonShape.Square,
                                          //     fontStyle:
                                          //         ButtonFontStyle.Aller14,
                                          //     prefixWidget: Container(
                                          //         margin: getMargin(right: 11),
                                          //         child: CustomImageView(
                                          //             svgPath: ImageConstant
                                          //                 .imgCameraGray500)),
                                          //     onTap: () {
                                          //       onTapUsermanagement();
                                          //     }),
                                          GestureDetector(
                                            child: Padding(
                                                padding: getPadding(top: 40),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgCameraGray500,
                                                      height: getSize(24),
                                                      width: getSize(24)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 5,
                                                          bottom: 1),
                                                      child: Text(
                                                          "lbl_user_management2"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtAller14Gray900))
                                                ])),
                                            onTap: () {
                                              onTapUsermanagement();
                                            },
                                          ),
                                          // Padding(
                                          //     padding: getPadding(top: 40),
                                          //     child: Row(children: [
                                          //       CustomImageView(
                                          //           svgPath: ImageConstant
                                          //               .imgMenuGray500,
                                          //           height: getSize(24),
                                          //           width: getSize(24)),
                                          //       Padding(
                                          //           padding: getPadding(
                                          //               left: 8,
                                          //               top: 5,
                                          //               bottom: 1),
                                          //           child: Text(
                                          //               "lbl_reports".tr,
                                          //               overflow: TextOverflow
                                          //                   .ellipsis,
                                          //               textAlign:
                                          //                   TextAlign.left,
                                          //               style: AppStyle
                                          //                   .txtAller14Gray900))
                                          //     ])),
                                          GestureDetector(
                                            child: Padding(
                                                padding: getPadding(top: 40),
                                                child: Row(children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFavoriteGray500,
                                                      height: getSize(24),
                                                      width: getSize(24)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 8,
                                                          top: 5,
                                                          bottom: 1),
                                                      child: Text(
                                                          "lbl_role_settings"
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtAller14Gray900))
                                                ])),
                                            onTap: () {
                                              onTapUserSettings();
                                            },
                                          ),
                                          // CustomButton(
                                          //     width: getHorizontalSize(115),
                                          //     text: "lbl_vote_settings".tr,
                                          //     margin: getMargin(top: 40),
                                          //     shape: ButtonShape.Square,
                                          //     fontStyle:
                                          //         ButtonFontStyle.Aller14,
                                          //     prefixWidget: Container(
                                          //         margin: getMargin(right: 8),
                                          //         child: CustomImageView(
                                          //             svgPath: ImageConstant
                                          //                 .imgFavoriteGray500)),
                                          //     onTap: () {
                                          //       onTapVotesettings();
                                          //     }),
                                          // Padding(
                                          //     padding: getPadding(top: 40),
                                          //     child: Row(children: [
                                          //       CustomImageView(
                                          //           svgPath: ImageConstant
                                          //               .imgSettings,
                                          //           height: getSize(24),
                                          //           width: getSize(24)),
                                          //       Padding(
                                          //           padding: getPadding(
                                          //               left: 8,
                                          //               top: 5,
                                          //               bottom: 1),
                                          //           child: Text(
                                          //               "msg_settings_and_privacy"
                                          //                   .tr,
                                          //               overflow: TextOverflow
                                          //                   .ellipsis,
                                          //               textAlign:
                                          //                   TextAlign.left,
                                          //               style: AppStyle
                                          //                   .txtAller14Gray900))
                                          //     ]))
                                        ])),
                                CustomImageView(
                                    svgPath: ImageConstant.imgCloseGray500,
                                    onTap: () {
                                      onTapImgClose();
                                    },
                                    height: getSize(24),
                                    width: getSize(24),
                                    margin: getMargin(bottom: 340))
                              ])),
                      Spacer(),
                      // CustomButton(
                      //     width: getHorizontalSize(192),
                      //     text: "msg_switch_to_normal".tr,
                      //     margin: getMargin(left: 7),
                      //     shape: ButtonShape.Square,
                      //     fontStyle: ButtonFontStyle.Aller14,
                      //     prefixWidget: Container(
                      //         margin: getMargin(right: 8),
                      //         child: CustomImageView(
                      //             svgPath: ImageConstant.imgInfoGray50024x24)),
                      //     onTap: () {
                      //       onTapSwitchto();
                      //     }),

                      GestureDetector(
                        child: Padding(
                            padding: getPadding(top: 40),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgInfoGray50024x24,
                                  height: getSize(24),
                                  width: getSize(24)),
                              GestureDetector(
                                child: Padding(
                                    padding:
                                        getPadding(left: 8, top: 5, bottom: 1),
                                    child: Text("msg_switch_to_normal".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtAller14Gray900)),
                                onTap: () {
                                  onTapSwitchto();
                                },
                              )
                            ])),
                        onTap: () {
                          onTapSwitchto();
                        },
                      ),

                      Padding(
                          padding: getPadding(top: 40, bottom: 31),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgClock,
                                height: getSize(24),
                                width: getSize(24)),
                            GestureDetector(
                              child: Padding(
                                  padding:
                                      getPadding(left: 8, top: 5, bottom: 1),
                                  child: Text("lbl_logout".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAller14Gray900)),
                              onTap: () {
                                onTapLogOut();
                              },
                            )
                          ]))
                    ]))));
  }

  onTapUsermanagement() {
    Get.toNamed(
      AppRoutes.userManagementScreen,
    );
  }

  onTapUserSettings() {
    Get.toNamed(
      AppRoutes.voteSettingsScreen,
    );
  }

  onTapLogOut() async {
    SecureStorage _secureStorage = SecureStorage();
    //HomeScreenController homeController = Get.put(HomeScreenController());

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

  onTapImgClose() {
    Get.back();
  }

  onTapSwitchto() {
    Get.toNamed(AppRoutes.competitionsScreen)
        ?.then((value) => Get.delete<CompetitionsScreenController>());
  }
}
