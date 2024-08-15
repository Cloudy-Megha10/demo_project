import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.labelText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator,
      this.labelStyle,
      this.onTap,
      this.readOnly = false,
      this.inputFormatters});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  String? labelText;

  String? labelStyle;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  bool readOnly;

  VoidCallback? onTap;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        inputFormatters: inputFormatters,
        onTap: onTap,
        controller: controller,
        readOnly: readOnly,
        focusNode: focusNode,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      labelText: labelText ?? "",
      labelStyle: TextStyle(
        color: ColorConstant.black900, // Specify the desired label color
      ),
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.Aller14Gray900:
        return TextStyle(
          color: ColorConstant.black900Dd,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.AllerBold16:
        return TextStyle(
          color: ColorConstant.black900Dd,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w700,
        );
      case TextFormFieldFontStyle.Aller14Gray600:
        return TextStyle(
          color: ColorConstant.black900Dd,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.Aller12:
        return TextStyle(
          color: ColorConstant.black900Dd,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900Dd,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aller',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case TextFormFieldShape.CircleBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.None:
        return InputBorder.none;
      case TextFormFieldVariant.FillWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.FillGray200:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineGray900:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray900,
            width: 1,
          ),
        );
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      default:
        return ColorConstant.gray100;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingT31:
        return getPadding(
          left: 16,
          top: 31,
          right: 16,
          bottom: 31,
        );
      case TextFormFieldPadding.PaddingT4:
        return getPadding(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case TextFormFieldPadding.PaddingT52:
        return getPadding(
          left: 30,
          top: 52,
          right: 31,
          bottom: 52,
        );
      case TextFormFieldPadding.PaddingT2:
        return getPadding(
          top: 2,
          bottom: 2,
        );
      case TextFormFieldPadding.PaddingT17_2:
        return getPadding(
          left: 16,
          top: 17,
          bottom: 17,
        );
      default:
        return getPadding(
          left: 15,
          top: 17,
          right: 15,
          bottom: 17,
        );
    }
  }
}

enum TextFormFieldShape { RoundedBorder16, RoundedBorder20, CircleBorder12 }

enum TextFormFieldPadding {
  PaddingT17,
  PaddingT31,
  PaddingT17_2,
  PaddingT2,
  PaddingT52,
  PaddingT4
}

enum TextFormFieldVariant {
  None,
  FillGray100,
  OutlineGray900,
  FillWhiteA700,
  FillGray200
}

enum TextFormFieldFontStyle {
  Aller14,
  Aller14Gray900,
  Aller14Gray600,
  AllerBold16,
  Aller12
}
