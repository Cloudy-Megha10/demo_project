import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';
import '../data/models/selectionPopupModel/selection_popup_model.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    this.shape,
    this.padding,
    this.variant,
    this.fontStyle,
    this.alignment,
    this.width,
    this.height,
    this.margin,
    this.focusNode,
    this.icon,
    this.hintText,
    this.labelText,
    this.prefix,
    this.prefixConstraints,
    this.items,
    this.onChanged,
    this.validator,
    this.value,
  });

  DropDownShape? shape;

  DropDownPadding? padding;

  DropDownVariant? variant;

  DropDownFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  double? height;

  EdgeInsetsGeometry? margin;

  FocusNode? focusNode;

  Widget? icon;

  String? hintText;
  String? labelText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  List<SelectionPopupModel>? items;

  Function(SelectionPopupModel)? onChanged;

  FormFieldValidator<SelectionPopupModel>? validator;

  SelectionPopupModel? value;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildDropDownWidget(),
          )
        : _buildDropDownWidget();
  }

  _buildDropDownWidget() {
    return Container(
      width: getHorizontalSize(width ?? 0),
      height: height,
      margin: margin,
      child: DropdownButtonFormField<SelectionPopupModel>(
        isExpanded: true,
        focusNode: focusNode,
        value: value,
        icon: icon,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
        items: items?.map((SelectionPopupModel item) {
          return DropdownMenuItem<SelectionPopupModel>(
            value: item,
            child: Text(
              item.title,
              overflow: TextOverflow.ellipsis,
              selectionColor: ColorConstant.black900,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (onChanged != null && value != null) {
            onChanged!(value);
          }
        },
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      labelText: labelText ?? "",
      labelStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      //contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.black900,
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
      case DropDownVariant.None:
        return InputBorder.none;
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
      case DropDownVariant.None:
        return false;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          left: 15,
          top: 17,
          bottom: 17,
        );
    }
  }
}

enum DropDownShape {
  RoundedBorder16,
}

enum DropDownPadding {
  PaddingT17,
}

enum DropDownVariant {
  None,
  FillGray100,
}

enum DropDownFontStyle {
  Aller14,
}
