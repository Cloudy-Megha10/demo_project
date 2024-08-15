import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/password_updated_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/custom_button.dart';

class PasswordUpdatedScreen extends GetWidget<PasswordUpdatedController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA70001,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: getSize(34),
                          width: getSize(34),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgStar1,
                                height: getSize(34),
                                width: getSize(34),
                                radius:
                                    BorderRadius.circular(getHorizontalSize(2)),
                                alignment: Alignment.center),
                            CustomImageView(
                                svgPath: ImageConstant.imgCheckmarkWhiteA700,
                                height: getSize(24),
                                width: getSize(24),
                                alignment: Alignment.center)
                          ])),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text("msg_password_updated".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAllerBold23)),
                      Padding(
                          padding: getPadding(top: 8, bottom: 5),
                          child: Text("msg_your_password_has".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAller14))
                    ])),
            bottomNavigationBar: CustomButton(
                height: getVerticalSize(54),
                text: "lbl_login".tr,
                margin: getMargin(left: 24, right: 24, bottom: 24),
                variant: ButtonVariant.FillGray90002,
                padding: ButtonPadding.PaddingAll18,
                onTap: () {
                  onTapLogin();
                })));
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }
}
