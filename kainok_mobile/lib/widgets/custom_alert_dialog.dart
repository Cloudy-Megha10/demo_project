import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import 'custom_button.dart';
import 'custom_image_view.dart';

// ignore: must_be_immutable
class CustomAlertDialog extends StatelessWidget 
//with PreferredSizeWidget 
{
  CustomAlertDialog({
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.content,
    this.buttonText,
    this.shape,
    this.onTap,
  });

  double? height;

  double? leadingWidth;

  Widget? leading;

  String? title;

  bool? centerTitle;

  List<Widget>? actions;

  String? content;

  String? buttonText;

  ShapeBorder? shape;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgClose,
                      height: getSize(24),
                      width: getSize(24),
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapImgClose();
                      }),
                  SizedBox(width: 60.0),
                  Text(
                    "lbl_alert_msg".tr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Aller',
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ]),
                SizedBox(height: 30.0),
                CustomImageView(
                    alignment: Alignment.center,
                    svgPath: ImageConstant.alertLogo,
                    height: getSize(50),
                    width: getSize(50),
                    onTap: onTap),
                SizedBox(height: 20.0),
                Text(
                  content!,
                  style: TextStyle(
                    color: ColorConstant.alertMsgContent,
                    fontSize: 14.0,
                    fontFamily: 'Aller',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          // Padding(
          //     padding: getPadding(right: 10, left: 10),
          //     child: Divider(
          //         height: getVerticalSize(0.5),
          //         thickness: getVerticalSize(1.5),
          //         color: ColorConstant.gray300)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: getPadding(bottom: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            height: getVerticalSize(50),
                            width: getHorizontalSize(120),
                            text: "lbl_cancel".tr,
                            variant: ButtonVariant.FillWhiteA700,
                            shape: ButtonShape.RoundedBorder20,
                            padding: ButtonPadding.PaddingAll6,
                            fontStyle: ButtonFontStyle.Aller11Gray90003,
                            onTap: () {
                              onTapImgClose();
                            }),
                        CustomButton(
                            height: getVerticalSize(50),
                            width: getHorizontalSize(120),
                            text: buttonText!,
                            margin: getMargin(left: 8),
                            shape: ButtonShape.RoundedBorder20,
                            variant: ButtonVariant.OutlineGray90002,
                            padding: ButtonPadding.PaddingAll6,
                            fontStyle: ButtonFontStyle.Aller12,
                            onTap: onTap)
                      ])),
            ],
          ),
        ],
      ),
    );
  }

  onTapImgClose() {
    Get.back();
  }

  @override
  Size get preferredSize => Size(
        width,
        height!,
      );
}
