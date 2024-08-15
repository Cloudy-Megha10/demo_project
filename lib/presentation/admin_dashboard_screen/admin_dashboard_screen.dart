import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import '../admin_dashboard_screen/widgets/admindashboard_item_widget.dart';
import 'controller/admin_dashboard_controller.dart';
import 'models/admindashboard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';
import 'package:demo_project/widgets/custom_button.dart';

class AdminDashboardScreen extends GetWidget<AdminDashboardController> {
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
                backgroundColor: ColorConstant.gray5001,
                // appBar: CustomAppBar(
                //     height: getVerticalSize(76),
                //     title: CustomButton(
                //         width: getHorizontalSize(260),
                //         text: "lbl_dashboard".tr,
                //         variant: ButtonVariant.FillWhiteA700cc,
                //         shape: ButtonShape.CircleBorder14,
                //         padding: ButtonPadding.PaddingAll6,
                //         fontStyle: ButtonFontStyle.AllerBold16,
                //         prefixWidget: Container(
                //             margin: getMargin(right: 120),
                //             child: CustomImageView(
                //                 svgPath: ImageConstant.imgMenu)),
                //         onTap: () {
                //           onTapDashboard();
                //         }),
                //     actions: [
                //       CustomImageView(
                //           imagePath: ImageConstant.imgImage1232x32,
                //           height: getSize(32),
                //           width: getSize(32),
                //           radius: BorderRadius.circular(getHorizontalSize(16)),
                //           margin: getMargin(
                //               left: 23, top: 21, right: 23, bottom: 22))
                //     ],
                //     styleType: Style.bgShadowBlack9000c),
                // appBar: CustomAppBar(
                //     height: getVerticalSize(76),
                //     title: CustomButton(
                //         width: getHorizontalSize(119),
                //         text: "lbl_dashboard".tr,
                //         margin: getMargin(left: 24),
                //         shape: ButtonShape.Square,
                //         fontStyle: ButtonFontStyle.AllerBold16,
                //         prefixWidget: Container(
                //             margin: getMargin(right: 16),
                //             child: CustomImageView(svgPath: ImageConstant.imgMenu)),
                //         onTap: () {
                //           onTapDashboard();
                //         }),
                //     actions: [
                //       CustomImageView(
                //           imagePath: ImageConstant.imgImage1232x32,
                //           height: getSize(32),
                //           width: getSize(32),
                //           radius: BorderRadius.circular(getHorizontalSize(16)),
                //           margin:
                //               getMargin(left: 23, top: 21, right: 23, bottom: 22))
                //     ],
                //     styleType: Style.bgShadowBlack9000c),
                body: SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                        padding: getPadding(top: 19),
                        child: Padding(
                            padding: getPadding(left: 24, bottom: 5),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("msg_voting_statistics".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAller16),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: Text("msg_4_may_2023_10".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtCaption)),
                                  Container(
                                      width: getHorizontalSize(342),
                                      margin: getMargin(top: 7, right: 24),
                                      padding: getPadding(
                                          left: 8,
                                          top: 16,
                                          right: 8,
                                          bottom: 16),
                                      decoration: AppDecoration.outlineGray200
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      width:
                                                          getHorizontalSize(63),
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 8,
                                                          right: 16,
                                                          bottom: 8),
                                                      decoration: AppDecoration
                                                          .txtFillGray900
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .txtCircleBorder16),
                                                      child: Text("lbl_week".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtAller12)),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(67),
                                                      text: "lbl_month".tr,
                                                      margin:
                                                          getMargin(left: 8),
                                                      variant: ButtonVariant
                                                          .FillGray100,
                                                      shape: ButtonShape
                                                          .CircleBorder14,
                                                      padding: ButtonPadding
                                                          .PaddingAll6,
                                                      fontStyle: ButtonFontStyle
                                                          .Aller12Gray500),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(74),
                                                      text: "lbl_quarter".tr,
                                                      margin:
                                                          getMargin(left: 8),
                                                      variant: ButtonVariant
                                                          .FillGray100,
                                                      shape: ButtonShape
                                                          .CircleBorder14,
                                                      padding: ButtonPadding
                                                          .PaddingAll6,
                                                      fontStyle: ButtonFontStyle
                                                          .Aller12Gray500)
                                                ]),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                    padding: getPadding(
                                                        top: 25, right: 26),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      bottom:
                                                                          32),
                                                              child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "lbl_10k"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtCaption),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                47),
                                                                        child: Text(
                                                                            "lbl_10k"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtCaption)),
                                                                    Padding(
                                                                        padding: getPadding(
                                                                            top:
                                                                                46),
                                                                        child: Text(
                                                                            "lbl_1k"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtCaption))
                                                                  ])),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgFrame289,
                                                              height:
                                                                  getVerticalSize(
                                                                      172),
                                                              width:
                                                                  getHorizontalSize(
                                                                      260),
                                                              margin: getMargin(
                                                                  left: 15))
                                                        ]))),
                                            Padding(
                                                padding: getPadding(
                                                    left: 36,
                                                    top: 2,
                                                    right: 26),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("lbl_sun".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtCaption),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 18),
                                                          child: Text(
                                                              "lbl_mon".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 18),
                                                          child: Text(
                                                              "lbl_tue".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 17),
                                                          child: Text(
                                                              "lbl_wed".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 17),
                                                          child: Text(
                                                              "lbl_thu".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 21),
                                                          child: Text(
                                                              "lbl_fri".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 24),
                                                          child: Text(
                                                              "lbl_sat".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtCaption))
                                                    ])),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                    padding: getPadding(
                                                        top: 9,
                                                        right: 84,
                                                        bottom: 13),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                              height:
                                                                  getSize(8),
                                                              width: getSize(8),
                                                              margin: getMargin(
                                                                  top: 3,
                                                                  bottom: 2),
                                                              decoration: BoxDecoration(
                                                                  color: ColorConstant
                                                                      .greenA700,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              getHorizontalSize(4)))),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 4),
                                                              child: Text(
                                                                  "lbl_likes"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtCaptionGray900)),
                                                          Container(
                                                              height:
                                                                  getSize(8),
                                                              width: getSize(8),
                                                              margin: getMargin(
                                                                  left: 40,
                                                                  top: 3,
                                                                  bottom: 2),
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      ColorConstant
                                                                          .red500,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              getHorizontalSize(4)))),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 4),
                                                              child: Text(
                                                                  "lbl_dislikes"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtCaptionGray900))
                                                        ])))
                                          ])),
                                  Padding(
                                      padding: getPadding(top: 27),
                                      child: Text("msg_highest_number_of".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtAller16)),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: Text("msg_4_may_2023_10".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtCaption)),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                          width: getHorizontalSize(400),
                                          margin: getMargin(top: 7),
                                          padding:
                                              getPadding(top: 19, bottom: 19),
                                          decoration: AppDecoration
                                              .outlineGray200
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .circleBorder16),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height:
                                                        getVerticalSize(105),
                                                    child: Obx(() =>
                                                        ListView.separated(
                                                            padding: getPadding(
                                                                left: 19,
                                                                top: 5),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            separatorBuilder:
                                                                (context, index) {
                                                              return SizedBox(
                                                                  height:
                                                                      getVerticalSize(
                                                                          16));
                                                            },
                                                            itemCount: controller
                                                                .adminDashboardModelObj
                                                                .value
                                                                .admindashboardItemList
                                                                .value
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              AdmindashboardItemModel
                                                                  model =
                                                                  controller
                                                                      .adminDashboardModelObj
                                                                      .value
                                                                      .admindashboardItemList
                                                                      .value[index];
                                                              return AdmindashboardItemWidget(
                                                                  model);
                                                            })))
                                              ]))),
                                  Padding(
                                      padding: getPadding(top: 27),
                                      child: Text("msg_photos_selected".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtAller16)),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: Text("msg_51_gold_members".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtCaption)),
                                  GestureDetector(
                                      onTap: () {
                                        onTapRow();
                                      },
                                      child: Padding(
                                          padding:
                                              getPadding(top: 15, right: 24),
                                          child: Row(children: [
                                            Padding(
                                                padding: getPadding(bottom: 5),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage314,
                                                          height:
                                                              getVerticalSize(
                                                                  153),
                                                          width:
                                                              getHorizontalSize(
                                                                  163),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      16))),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage315,
                                                          height:
                                                              getVerticalSize(
                                                                  153),
                                                          width:
                                                              getHorizontalSize(
                                                                  163),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      16)),
                                                          margin: getMargin(
                                                              top: 16)),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage316,
                                                          height:
                                                              getVerticalSize(
                                                                  153),
                                                          width:
                                                              getHorizontalSize(
                                                                  163),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      16)),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ])),
                                            Padding(
                                                padding: getPadding(left: 16),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage317,
                                                          height:
                                                              getVerticalSize(
                                                                  240),
                                                          width:
                                                              getHorizontalSize(
                                                                  163),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      16))),
                                                      CustomImageView(
                                                          imagePath:
                                                              ImageConstant
                                                                  .imgImage318,
                                                          height:
                                                              getVerticalSize(
                                                                  240),
                                                          width:
                                                              getHorizontalSize(
                                                                  163),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      16)),
                                                          margin: getMargin(
                                                              top: 16))
                                                    ]))
                                          ])))
                                ])))))));
  }

  onTapRow() {
    Get.toNamed(
      AppRoutes.previewScreen,
    );
  }

  onTapDashboard() {
    Get.toNamed(
      AppRoutes.navigationScreen,
    );
  }
}
