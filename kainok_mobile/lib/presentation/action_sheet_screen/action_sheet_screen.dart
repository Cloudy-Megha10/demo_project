import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/action_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/custom_button.dart';

class ActionSheetScreen extends GetWidget<ActionSheetController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 32, top: 44, right: 32, bottom: 44),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                          width: getHorizontalSize(89),
                          text: "lbl_edit_user".tr,
                          shape: ButtonShape.Square,
                          fontStyle: ButtonFontStyle.Aller14Gray600,
                          prefixWidget: Container(
                              margin: getMargin(right: 8),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgEdit)),
                          onTap: () {
                            onTapEdituser();
                          }),
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
                      CustomButton(
                          width: getHorizontalSize(107),
                          text: "lbl_delete_user".tr,
                          margin: getMargin(top: 24),
                          shape: ButtonShape.Square,
                          fontStyle: ButtonFontStyle.Aller14Gray600,
                          prefixWidget: Container(
                              margin: getMargin(right: 8),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgTrash)),
                          onTap: () {
                            onTapDeleteuser();
                          })
                    ]))));
  }

  onTapEdituser() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  onTapDeleteuser() {
    Get.toNamed(
      AppRoutes.deleteUserScreen,
    );
  }
}
