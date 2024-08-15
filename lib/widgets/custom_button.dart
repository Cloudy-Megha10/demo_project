import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT5:
        return getPadding(left: 5, top: 5, bottom: 5, right: 5);
      case ButtonPadding.PaddingT18:
        return getPadding(
          top: 18,
          right: 18,
          bottom: 18,
        );
      case ButtonPadding.PaddingT7:
        return getPadding(
          left: 7,
          top: 7,
          bottom: 7,
        );
      case ButtonPadding.PaddingAll19:
        return getPadding(
          all: 19,
        );
      case ButtonPadding.PaddingT1:
        return getPadding(
          top: 1,
          bottom: 1,
        );
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      default:
        return getPadding(
          all: 15,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700cc:
        return ColorConstant.whiteA700Cc;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700Cc;
      case ButtonVariant.OutlineGray90002:
        return ColorConstant.gray900;
      case ButtonVariant.FillGray100:
        return ColorConstant.gray100;
      default:
        return ColorConstant.gray900;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray90002:
        return BorderSide(
          color: ColorConstant.gray90002,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray90002_1:
        return BorderSide(
          color: ColorConstant.gray90002,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillGray90002:
      case ButtonVariant.FillWhiteA700cc:
        return null;
      case ButtonVariant.FillWhiteA700:
        return BorderSide(
          color: ColorConstant.gray90002,
          width: getHorizontalSize(
            1.00,
          ),
        );

      case ButtonVariant.FillGray100:
        return null;
      default:
        return BorderSide(
          color: ColorConstant.gray90002,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.CircleBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.PoppinsMedium11:
        return TextStyle(
          color: ColorConstant.gray90003,
          fontSize: getFontSize(
            11,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.Aller12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Aller14:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Aller12Gray500:
        return TextStyle(
          color: ColorConstant.gray500,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AllerBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.Aller12Gray90004:
        return TextStyle(
          color: ColorConstant.gray90004,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.AllerBold16:
        return TextStyle(
          color: ColorConstant.gray900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.Aller14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.Aller11Gray90003:
        return TextStyle(
          color: ColorConstant.gray90003,
          fontSize: getFontSize(
            11,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder20,
  CircleBorder14,
}

enum ButtonPadding {
  PaddingAll15,
  PaddingT5,
  PaddingT1,
  PaddingAll6,
  PaddingAll19,
  PaddingT7,
  PaddingAll18,
  PaddingT18
}

enum ButtonVariant {
  FillGray900,
  FillWhiteA700cc,
  FillWhiteA700,
  OutlineGray90002,
  FillGray90002,
  OutlineGray90002_1,
  FillGray100,
}

enum ButtonFontStyle {
  PoppinsSemiBold14,
  PoppinsMedium11,
  AllerBold16,
  Aller12,
  Aller12Gray90004,
  Aller14Gray600,
  AllerBold14,
  Aller11Gray90003,
  Aller12Gray500,
  Aller14
}
