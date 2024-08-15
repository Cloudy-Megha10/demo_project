import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/custom_button.dart';

import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarButton1 extends StatelessWidget {
  AppbarButton1({this.margin, this.onTap});

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomButton(
          width: getHorizontalSize(
            161,
          ),
          text: "lbl_forgot_password".tr,
          shape: ButtonShape.Square,
          fontStyle: ButtonFontStyle.AllerBold16,
          prefixWidget: Container(
            margin: getMargin(
              right: 16,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowleftGray900,
            ),
          ),
        ),
      ),
    );
  }
}
