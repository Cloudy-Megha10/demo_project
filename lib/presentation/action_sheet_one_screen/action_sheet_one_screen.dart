import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/action_sheet_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/custom_button.dart';

class ActionSheetOneScreen extends GetWidget<ActionSheetOneController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 32, top: 40, right: 32, bottom: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          width: getHorizontalSize(134),
                          text: "lbl_switch_to_admin".tr,
                          margin: getMargin(top: 4),
                          shape: ButtonShape.Square,
                          fontStyle: ButtonFontStyle.Aller14Gray600,
                          prefixWidget: Container(
                              margin: getMargin(right: 8),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgUser)),
                          onTap: () {
                            onTapSwitchtoadmin();
                          }),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgSettings,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 8, top: 5, bottom: 1),
                                child: Text("msg_settings_and_privacy".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAller14))
                          ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgShareGray500,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 8, top: 3, bottom: 3),
                                child: Text("lbl_archive".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAller14))
                          ])),
                      Padding(
                          padding: getPadding(top: 24),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgBookmark,
                                height: getSize(24),
                                width: getSize(24)),
                            Padding(
                                padding: getPadding(left: 8, top: 3, bottom: 3),
                                child: Text("lbl_saved".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAller14))
                          ]))
                    ]))));
  }

  onTapSwitchtoadmin() {
    Get.toNamed(
      AppRoutes.adminDashboardScreen,
    );
  }
}
