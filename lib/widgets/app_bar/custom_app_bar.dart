import 'package:flutter/material.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget 
//with PreferredSizeWidget 
{
  CustomAppBar(
      {required this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions});

  double height;

  Style? styleType;

  double? leadingWidth;

  Widget? leading;

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFillWhiteA700_1:
        return Container(
          height: getVerticalSize(
            76,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
          ),
        );
      case Style.bgFillWhiteA700_2:
        return Stack(
          children: [
            Container(
              height: getVerticalSize(
                76,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
            ),
            Container(
              height: getVerticalSize(
                56,
              ),
              width: getHorizontalSize(
                342,
              ),
              margin: getMargin(
                left: 24.12,
                top: 18,
                right: 23.880005,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    28,
                  ),
                ),
                border: Border.all(
                  color: ColorConstant.gray50,
                  width: getHorizontalSize(
                    1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.black90019,
                    spreadRadius: getHorizontalSize(
                      2,
                    ),
                    blurRadius: getHorizontalSize(
                      2,
                    ),
                    offset: Offset(
                      0,
                      0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case Style.bgFillWhiteA700:
        return Stack(
          children: [
            Container(
              height: getVerticalSize(
                85,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
              ),
            ),
            Container(
              height: getVerticalSize(
                56,
              ),
              width: getHorizontalSize(
                342,
              ),
              margin: getMargin(
                left: 24.07,
                top: 12,
                right: 23.929993,
                bottom: 17,
              ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    28,
                  ),
                ),
                border: Border.all(
                  color: ColorConstant.gray50,
                  width: getHorizontalSize(
                    1,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.black90028,
                    spreadRadius: getHorizontalSize(
                      2,
                    ),
                    blurRadius: getHorizontalSize(
                      2,
                    ),
                    offset: Offset(
                      0,
                      6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case Style.bgShadowBlack9000c:
        return Container(
          height: getVerticalSize(
            76,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            boxShadow: [
              BoxShadow(
                color: ColorConstant.black9000c,
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: Offset(
                  0,
                  3,
                ),
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadowBlack9000c,
  bgFillWhiteA700_1,
  bgFillWhiteA700,
  bgFillWhiteA700_2
}
