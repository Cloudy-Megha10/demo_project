import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import '../create_edit_user_one_screen/widgets/listnonregister_item_widget.dart';
import 'controller/create_edit_user_one_controller.dart';
import 'models/listnonregister_item_model.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/app_bar/appbar_title.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';
import 'package:demo_project/widgets/custom_button.dart';

class CreateEditUserOneScreen extends GetWidget<CreateEditUserOneController> {
  Future<void> _refreshPage() async {
    controller.getAllUserType();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.toNamed(
            AppRoutes.adminDashboardScreen,
          );
          return false;
        },
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                // appBar: CustomAppBar(
                //     height: getVerticalSize(76),
                //     leadingWidth: 48,
                //     leading: AppbarImage(
                //         height: getSize(24),
                //         width: getSize(24),
                //         svgPath: ImageConstant.imgArrowleftGray900,
                //         margin: getMargin(left: 24, top: 26, bottom: 25),
                //         onTap: () {
                //           onTapRoleSettingsBack();
                //         }),
                //     title: AppbarTitle(
                //         text: "lbl_role_settings".tr,
                //         margin: getMargin(left: 16)),
                //     actions: [
                //       GestureDetector(
                //         child: Padding(
                //             padding: getPadding(
                //                 left: 24, top: 32, right: 24, bottom: 28),
                //             child: Text("Create new",
                //                 overflow: TextOverflow.ellipsis,
                //                 textAlign: TextAlign.left,
                //                 style: AppStyle.txtAller14Gray900.copyWith(
                //                     decoration: TextDecoration.underline))),
                //         onTap: () {
                //           onTapCreateNewSettings();
                //         },
                //       )
                //       // AppbarTitle(
                //       //     text: "msg_create_new_settings".tr,
                //       //     margin:
                //       //         getMargin(left: 24, top: 28, right: 24, bottom: 28))
                //     ],
                //     styleType: Style.bgFillWhiteA700_1),
                body: RefreshIndicator(
                    onRefresh: () async {
                      await _refreshPage();
                    },
                    child: Container(
                        // height: getVerticalSize(720),
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 24, top: 16, right: 24, bottom: 16),
                        child: Stack(alignment: Alignment.topCenter, children: [
                          // Align(
                          //     alignment: Alignment.bottomCenter,
                          //     child: Padding(
                          //         padding: getPadding(bottom: 176),
                          //         child: Text("msg_swipe_right_to_vote".tr,
                          //             overflow: TextOverflow.ellipsis,
                          //             textAlign: TextAlign.left,
                          //             style: AppStyle.txtPoppinsRegular13.copyWith(
                          //                 letterSpacing:
                          //                     getHorizontalSize(0.25))))),
                          SingleChildScrollView(
                            child: Column(
                                // alignment: Alignment.topCenter,
                                children: [
                                  // child:
                                  Obx(() => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                            height: getVerticalSize(16));
                                      },
                                      itemCount: controller
                                          .createEditUserOneModelObj
                                          .value
                                          .userTypeDetails
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            width: double.maxFinite,
                                            child: Container(
                                              padding: getPadding(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                              decoration:
                                                  AppDecoration.outlineGray2001,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                  children: [
                                                                    Obx(
                                                                      () =>
                                                                          Text(
                                                                        controller
                                                                            .createEditUserOneModelObj
                                                                            .value
                                                                            .userTypeDetails[index]
                                                                            .userTypeName,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: AppStyle
                                                                            .txtAller16,
                                                                      ),
                                                                    ),
                                                                  ]),
                                                            ),
                                                            GestureDetector(
                                                              child: Padding(
                                                                  padding:
                                                                      getPadding(),
                                                                  child: Text(
                                                                      "Edit",
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style: AppStyle
                                                                          .txtAller14Gray900
                                                                          .copyWith(
                                                                              decoration: TextDecoration.underline))),
                                                              onTap: () {
                                                                onTapUpdateRoleSettings(
                                                                  controller
                                                                      .createEditUserOneModelObj
                                                                      .value
                                                                      .userTypeDetails[
                                                                          index]
                                                                      .userTypeName
                                                                      .toString(),
                                                                  controller
                                                                      .createEditUserOneModelObj
                                                                      .value
                                                                      .userTypeDetails[
                                                                          index]
                                                                      .likedPoints
                                                                      .toString(),
                                                                  controller
                                                                      .createEditUserOneModelObj
                                                                      .value
                                                                      .userTypeDetails[
                                                                          index]
                                                                      .disLikedPoints
                                                                      .toString(),
                                                                  controller
                                                                      .createEditUserOneModelObj
                                                                      .value
                                                                      .userTypeDetails[
                                                                          index]
                                                                      .userTypeId
                                                                      .toString(),
                                                                );
                                                              },
                                                            ),
                                                          ])),
                                                  Padding(
                                                    padding: getPadding(
                                                      top: 10,
                                                      bottom: 12,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // CustomTextFormField(
                                                            //   width: getHorizontalSize(
                                                            //     163,
                                                            //   ),
                                                            //   focusNode: FocusNode(),
                                                            //   hintText: "lbl_1_points".tr,
                                                            // ),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top:
                                                                            10),
                                                                child:
                                                                    Container(
                                                                  height: 50,
                                                                  width: 150,

                                                                  // padding: EdgeInsets.all(50),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: ColorConstant
                                                                        .gray100,
                                                                    // Set border width
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10.0)), // Set rounded corner radius
                                                                    // boxShadow: [
                                                                    //   BoxShadow(
                                                                    //       blurRadius: 10,
                                                                    //       color:
                                                                    //           Colors.grey,
                                                                    //       offset: Offset(
                                                                    //           1, 3))
                                                                    // ] // Make rounded corner of border
                                                                  ),
                                                                  child: Text(
                                                                    controller
                                                                        .createEditUserOneModelObj
                                                                        .value
                                                                        .userTypeDetails[
                                                                            index]
                                                                        .likedPoints
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAller14Black900,
                                                                  ),
                                                                )),
                                                            Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 8,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgInfoGray500,
                                                                    height:
                                                                        getSize(
                                                                      24,
                                                                    ),
                                                                    width:
                                                                        getSize(
                                                                      24,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 4,
                                                                      top: 5,
                                                                      bottom: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "msg_swipe_right_to_vote2"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtCaption,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            left: 16,
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              // CustomTextFormField(
                                                              //   width: getHorizontalSize(
                                                              //     163,
                                                              //   ),
                                                              //   focusNode: FocusNode(),
                                                              //   hintText:
                                                              //       "lbl_1_points2".tr,
                                                              // ),

                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              10),
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 150,
                                                                    // margin: EdgeInsets.only(
                                                                    //     left: 100,
                                                                    //     right: 100),
                                                                    // padding: EdgeInsets.all(50),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: ColorConstant
                                                                          .gray100,
                                                                      // Set border width
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10.0)), // Set rounded corner radius
                                                                      //     boxShadow: [
                                                                      //   BoxShadow(
                                                                      //       blurRadius:
                                                                      //           10,
                                                                      //       color: Colors
                                                                      //           .grey,
                                                                      //       offset:
                                                                      //           Offset(
                                                                      //               1, 3))
                                                                      // ] // Make rounded corner of border
                                                                    ),
                                                                    child: Text(
                                                                      controller
                                                                          .createEditUserOneModelObj
                                                                          .value
                                                                          .userTypeDetails[
                                                                              index]
                                                                          .disLikedPoints
                                                                          .toString(),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtAller14Black900,
                                                                    ),
                                                                  )),
                                                              Padding(
                                                                padding:
                                                                    getPadding(
                                                                  top: 8,
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgInfoGray500,
                                                                      height:
                                                                          getSize(
                                                                        24,
                                                                      ),
                                                                      width:
                                                                          getSize(
                                                                        24,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          getPadding(
                                                                        left: 4,
                                                                        top: 5,
                                                                        bottom:
                                                                            3,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "msg_swipe_left_to_vote"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: AppStyle
                                                                            .txtCaption,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // CustomButton(
                                  //     height: getVerticalSize(52),
                                  //     width: getHorizontalSize(240),
                                  //     text: "lbl_save".tr,
                                  //     // margin: getMargin(top: 620),
                                  //     onTap: () {
                                  //       // onTapCreateNewSettings();
                                  //     }),
                                ]),
                          )
                        ]))))));
  }

  onTapRoleSettingsBack() {
    Get.toNamed(
      AppRoutes.adminDashboardScreen,
    );
  }

  onTapCreateNewSettings() {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 30, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("msg_create_role_settings".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAllerBold16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomTextFormField(
                      focusNode: FocusNode(),
                      controller: controller.enterUserNameController,
                      hintText: "Enter name".tr,
                      labelText: "Enter name".tr,
                      margin: getMargin(top: 40)),
                ),
                Padding(
                  padding: getPadding(
                    top: 10,
                    bottom: 12,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            width: getHorizontalSize(
                              165,
                            ),
                            controller: controller.likedController,
                            focusNode: FocusNode(),
                            hintText: "Liked Points".tr,
                            labelText: "Liked Points".tr,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgInfoGray500,
                                  height: getSize(
                                    24,
                                  ),
                                  width: getSize(
                                    24,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 5,
                                    bottom: 3,
                                  ),
                                  child: Text(
                                    "msg_swipe_right_to_vote2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtCaption,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              width: getHorizontalSize(
                                165,
                              ),
                              controller: controller.disLikedController,
                              focusNode: FocusNode(),
                              hintText: "Disliked Points".tr,
                              labelText: "Disliked Points".tr,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 8,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgInfoGray500,
                                    height: getSize(
                                      24,
                                    ),
                                    width: getSize(
                                      24,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                      top: 5,
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      "msg_swipe_left_to_vote".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtCaption,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 29, right: 6, bottom: 4, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        height: getVerticalSize(60),
                        width: getHorizontalSize(157),
                        text: "lbl_cancel".tr,
                        onTap: onTapCancel,
                        margin: getMargin(left: 8),
                        variant: ButtonVariant.FillWhiteA700cc,
                        padding: ButtonPadding.PaddingAll18,
                        shape: ButtonShape.RoundedBorder20,
                        fontStyle: ButtonFontStyle.Aller14,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: getPadding(right: 35),
                          child: CustomButton(
                            height: getVerticalSize(54),
                            width: getHorizontalSize(139),
                            text: "msg_create_new_settings".tr,
                            variant: ButtonVariant.FillGray90002,
                            padding: ButtonPadding.PaddingAll18,
                          ),
                        ),
                        onTap: () {
                          onTapCreateUserType();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapUpdateRoleSettings(dynamic userType, String likedPoints,
      String dislikedPoints, String userTypeId) {
    TextEditingController userTypeController =
        TextEditingController(text: userType);
    TextEditingController likedPointsController =
        TextEditingController(text: likedPoints);
    TextEditingController dislikedPointsController =
        TextEditingController(text: dislikedPoints);
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 30, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("msg_update_role_settings".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAllerBold16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomTextFormField(
                      focusNode: FocusNode(),
                      controller: userTypeController,
                      hintText: "Enter name".tr,
                      labelText: "Enter name".tr,
                      margin: getMargin(top: 40)),
                ),
                Padding(
                  padding: getPadding(
                    top: 10,
                    bottom: 12,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            width: getHorizontalSize(
                              165,
                            ),
                            controller: likedPointsController,
                            focusNode: FocusNode(),
                            hintText: "Liked Points".tr,
                            labelText: "Liked Points".tr,
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgInfoGray500,
                                  height: getSize(
                                    24,
                                  ),
                                  width: getSize(
                                    24,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 4,
                                    top: 5,
                                    bottom: 3,
                                  ),
                                  child: Text(
                                    "msg_swipe_right_to_vote2".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtCaption,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: getPadding(
                          left: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              width: getHorizontalSize(
                                165,
                              ),
                              controller: dislikedPointsController,
                              focusNode: FocusNode(),
                              hintText: "Disliked Points".tr,
                              labelText: "Disliked Points".tr,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 8,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    svgPath: ImageConstant.imgInfoGray500,
                                    height: getSize(
                                      24,
                                    ),
                                    width: getSize(
                                      24,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 4,
                                      top: 5,
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      "msg_swipe_left_to_vote".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtCaption,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 29, right: 6, bottom: 4, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        height: getVerticalSize(60),
                        width: getHorizontalSize(157),
                        text: "lbl_cancel".tr,
                        onTap: onTapCancel,
                        margin: getMargin(left: 8),
                        variant: ButtonVariant.FillWhiteA700cc,
                        padding: ButtonPadding.PaddingAll18,
                        shape: ButtonShape.RoundedBorder20,
                        fontStyle: ButtonFontStyle.Aller14,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: getPadding(right: 35),
                          child: CustomButton(
                            height: getVerticalSize(54),
                            width: getHorizontalSize(139),
                            text: "msg_update".tr,
                            variant: ButtonVariant.FillGray90002,
                            padding: ButtonPadding.PaddingAll18,
                          ),
                        ),
                        onTap: () {
                          onTapUpdateUserType(
                              userTypeController,
                              likedPointsController,
                              dislikedPoints,
                              userTypeId);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapCreateUserType() async {
    await controller.createUserType(
        userTypeName: controller.enterUserNameController.text,
        likedPoints: controller.likedController.text,
        disLikedPoints: controller.disLikedController.text);
  }

  onTapUpdateUserType(
      dynamic userType, dynamic liked, dynamic disliked, userTypeId) async {
    await controller.updateUserTypeDetails(
        userTypeName: userType.text,
        likedPoints: liked.text,
        disLikedPoints: disliked,
        userTypeId: userTypeId);
  }

  onTapCancel() {
    Get.back();
  }
}
