import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../create_edit_user_screen/controller/create_edit_user_controller.dart';
import '../edit_profile_screen/controller/edit_profile_controller.dart';
import '../edit_user_profile_screen/controller/edit_user_profile_controller.dart';
import 'controller/user_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/app_bar/appbar_image.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kainok_app/widgets/custom_icon_button.dart';
import 'package:kainok_app/widgets/custom_text_form_field.dart';

class UserManagementScreen extends GetWidget<UserManagementController> {
  Future<void> _refreshPage() async {
    controller.getAllUserDetails();
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
                //     height: getVerticalSize(74),
                //     leadingWidth: 48,
                //     leading: AppbarImage(
                //         height: getSize(24),
                //         width: getSize(24),
                //         svgPath: ImageConstant.imgArrowleftGray900,
                //         margin: getMargin(left: 24, top: 23, bottom: 23),
                //         onTap: () {
                //           onTapArrowleft2();
                //         }),
                //     title: Padding(
                //         padding: getPadding(left: 16, top: 10),
                //         child: Column(
                //           children: [
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   AppbarTitle(text: "lbl_user_management".tr),
                //                 ]),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   // AppbarSubtitle(
                //                   //     text: controller.competitionCategory.value),
                //                   Obx(() => Padding(
                //                       padding: getPadding(right: 60),
                //                       child: AppbarSubTitle(
                //                         text:
                //                             '${controller.counts.value} Users',
                //                       )))
                //                 ]),
                //           ],
                //         ))),
                body: RefreshIndicator(
                    onRefresh: () async {
                      await _refreshPage();
                    },
                    child: Obx(() => SizedBox(
                        height: size.height,
                        width: size.width,
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: getPadding(left: 24, right: 24),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //     padding: getPadding(all: 8),
                                      //     decoration: AppDecoration.outlineGray200
                                      //         .copyWith(
                                      //             borderRadius: BorderRadiusStyle
                                      //                 .circleBorder28),
                                      //     child: Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.end,
                                      //         children: [
                                      //           CustomImageView(
                                      //               svgPath: ImageConstant
                                      //                   .imgSearchGray50024x24,
                                      //               height: getSize(24),
                                      //               width: getSize(24),
                                      //               margin: getMargin(
                                      //                   left: 8,
                                      //                   top: 8,
                                      //                   bottom: 8)),
                                      //           Padding(
                                      //               padding: getPadding(
                                      //                   left: 18, bottom: 1),
                                      //               child: Column(
                                      //                   crossAxisAlignment:
                                      //                       CrossAxisAlignment
                                      //                           .start,
                                      //                   mainAxisAlignment:
                                      //                       MainAxisAlignment.start,
                                      //                   children: [
                                      //                     Text("lbl_search".tr,
                                      //                         overflow: TextOverflow
                                      //                             .ellipsis,
                                      //                         textAlign:
                                      //                             TextAlign.left,
                                      //                         style: AppStyle
                                      //                             .txtAllerBold16),
                                      //                     Padding(
                                      //                         padding: getPadding(
                                      //                             top: 3),
                                      //                         child: Text(
                                      //                             "msg_be_a_part_of_our"
                                      //                                 .tr,
                                      //                             overflow:
                                      //                                 TextOverflow
                                      //                                     .ellipsis,
                                      //                             textAlign:
                                      //                                 TextAlign
                                      //                                     .left,
                                      //                             style: AppStyle
                                      //                                 .txtCaption))
                                      //                   ])),
                                      //           Spacer(),
                                      //         ])),
                                      Container(
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          itemCount: controller
                                              .userManagementModelObj
                                              .usersList
                                              .length,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(
                                                margin: getMargin(top: 16),
                                                padding: getPadding(all: 16),
                                                decoration: AppDecoration
                                                    .outlineGray2001,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // CustomImageView(
                                                      //     url: controller
                                                      //         .userManagementModelObj
                                                      //         .usersList[index]
                                                      //         .images,
                                                      //     height: getSize(64),
                                                      //     width: getSize(64),
                                                      //     radius: BorderRadius.circular(
                                                      //         getHorizontalSize(32))),
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(controller
                                                                .userManagementModelObj
                                                                .usersList[
                                                                    index]
                                                                .images),
                                                        radius: 30,
                                                        backgroundColor:
                                                            Colors.grey[100],
                                                      ),
                                                      Padding(
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
                                                                Text(
                                                                    controller
                                                                        .userManagementModelObj
                                                                        .usersList[
                                                                            index]
                                                                        .userName,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAllerBold14Gray900),
                                                                Text(
                                                                    controller
                                                                        .userManagementModelObj
                                                                        .usersList[
                                                                            index]
                                                                        .userTypeName,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtCaption)
                                                                // CustomButton(
                                                                //   height:
                                                                //       getVerticalSize(
                                                                //           28),
                                                                //   width:
                                                                //       getHorizontalSize(
                                                                //           100),
                                                                //   text: controller
                                                                //       .userManagementModelObj
                                                                //       .usersList[index]
                                                                //       .userTypeName,
                                                                //   variant: ButtonVariant
                                                                //       .FillGray100,
                                                                //   shape: ButtonShape
                                                                //       .RoundedBorder20,
                                                                //   padding: ButtonPadding
                                                                //       .PaddingT5,
                                                                //   fontStyle:
                                                                //       ButtonFontStyle
                                                                //           .PoppinsMedium11,
                                                                //   prefixWidget:
                                                                //       Container(
                                                                //     child:
                                                                //         CustomImageView(
                                                                //       svgPath: (controller
                                                                //                   .userManagementModelObj
                                                                //                   .usersList[
                                                                //                       index]
                                                                //                   .userTypeName ==
                                                                //               "Participant")
                                                                //           ? ImageConstant
                                                                //               .imgTrophy
                                                                //           : (controller
                                                                //                       .userManagementModelObj
                                                                //                       .usersList[
                                                                //                           index]
                                                                //                       .userTypeName ==
                                                                //                   "Gold")
                                                                //               ? ImageConstant
                                                                //                   .imgStar
                                                                //               : ImageConstant
                                                                //                   .imgTrophy,
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                              ])),
                                                      Expanded(
                                                          // padding: getPadding(
                                                          //     left: 37, bottom: 12),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgOverflowmenu,
                                                                height:
                                                                    getSize(24),
                                                                width:
                                                                    getSize(24),
                                                                onTap: () {
                                                                  onTapImgOverflowmenu(controller
                                                                      .userManagementModelObj
                                                                      .usersList[
                                                                          index]
                                                                      .userId
                                                                      .toString());
                                                                }),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top:
                                                                            12),
                                                                child: Text(
                                                                    controller
                                                                        .userManagementModelObj
                                                                        .usersList[
                                                                            index]
                                                                        .createdByDate,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtCaption))
                                                          ]))
                                                    ]));
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ])))))),
                floatingActionButton: GestureDetector(
                    onTap: () {
                      onTapEdituser();
                    },
                    child: Padding(
                      padding: getPadding(top: 40),
                      child: CustomImageView(
                          svgPath: ImageConstant.imgAddProfile,
                          height: getSize(64),
                          width: getSize(64),
                          radius: BorderRadius.circular(getHorizontalSize(32)),
                          margin: getMargin(left: 1)),
                    )))));
  }

  onTapImgOverflowmenu(String userId) {
    controller.selectedUserId.value = userId;
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
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
                          controller.getUserDetailsById(userId);
                          print(
                              "createEditUserController.getUserDetailsById(userId)");
                          print(controller.firstNameController.text);
                        },
                      ),
                      // Padding(
                      //     padding: getPadding(top: 24),
                      //     child: Row(children: [
                      //       CustomImageView(
                      //           svgPath: ImageConstant.imgPencil,
                      //           height: getSize(24),
                      //           width: getSize(24)),
                      //       Padding(
                      //           padding: getPadding(left: 8, top: 5, bottom: 1),
                      //           child: Text("lbl_report_user".tr,
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.left,
                      //               style: AppStyle.txtAller14))
                      //     ])),
                      // GestureDetector(
                      //   child: Padding(
                      //       padding: getPadding(top: 24),
                      //       child: Row(children: [
                      //         CustomImageView(
                      //             svgPath: ImageConstant.imgTrash,
                      //             height: getSize(24),
                      //             width: getSize(24)),
                      //         Padding(
                      //             padding:
                      //                 getPadding(left: 8, top: 5, bottom: 1),
                      //             child: Text("lbl_delete_user".tr,
                      //                 overflow: TextOverflow.ellipsis,
                      //                 textAlign: TextAlign.left,
                      //                 style: AppStyle.txtAller14))
                      //       ])),
                      //   onTap: () {
                      //     onTapDeleteuser();
                      //   },
                      // )
                    ])));
      },
    );
  }

  onTapArrowleft2() {
    Get.toNamed(
      AppRoutes.adminDashboardScreen,
    );
  }

  onTapEdituser() {
    Get.toNamed(
      AppRoutes.createEditUserScreen,
    );
  }

  onTapDeleteuser() {
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
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
