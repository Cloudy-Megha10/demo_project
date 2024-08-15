import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';

import '../../core/utils/color_constant.dart';
import '../../theme/app_style.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({required this.text, this.margin, this.onTap});

  String text;

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
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtAllerBold17.copyWith(
            color: ColorConstant.gray900,
          ),
        ),
      ),
    );
  }
}
