import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../theme/app_style.dart';

// ignore: must_be_immutable
class AppbarSubTitle extends StatelessWidget {
  AppbarSubTitle({required this.text, this.margin, this.onTap});

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
          style: AppStyle.txtAller13.copyWith(
            color: ColorConstant.gray500,
          ),
        ),
      ),
    );
  }
}
