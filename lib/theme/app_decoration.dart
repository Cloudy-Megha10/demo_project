import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get outlineGray200 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1,
          ),
        ),
      );

  static BoxDecoration get searchViewBoxDecoration => BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadiusStyle.circleBorder28,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
        border: Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillGray500 => BoxDecoration(
        color: ColorConstant.gray500,
      );
  static BoxDecoration get outlineGray2001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border(
          bottom: BorderSide(
            color: ColorConstant.gray200,
            width: getHorizontalSize(
              1,
            ),
          ),
        ),
      );
  static BoxDecoration get outlineBlack9000c => BoxDecoration(
        color: ColorConstant.gray900,
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
      );
  static BoxDecoration get txtFillGray900 => BoxDecoration(
        color: ColorConstant.gray900,
      );
  static BoxDecoration get fillYellow700 => BoxDecoration(
        color: ColorConstant.yellow700,
      );
  static BoxDecoration get outlineBlack900191 => BoxDecoration();
  static BoxDecoration get outlineGray50 => BoxDecoration(
        color: ColorConstant.whiteA700,
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
      );
  static BoxDecoration get outlineBlack90019 => BoxDecoration(
        color: ColorConstant.gray900,
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
      );
  static BoxDecoration get fillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get outlineGray300 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack90099 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black90099,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get fillOrange300 => BoxDecoration(
        color: ColorConstant.orange300,
      );
  static BoxDecoration get fillWhiteA70001 => BoxDecoration(
        color: ColorConstant.whiteA70001,
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: ColorConstant.black900,
      );
  static BoxDecoration get outlineLightblue100 => BoxDecoration(
        color: ColorConstant.gray900,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.lightBlue100,
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
      );
  static BoxDecoration get fillGray90002 => BoxDecoration(
        color: ColorConstant.gray90002,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );

  static BoxDecoration get lightGray => BoxDecoration(
        color: ColorConstant.gray200,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder40 = BorderRadius.circular(
    getHorizontalSize(
      40,
    ),
  );

  static BorderRadius txtCircleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius customBorder = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        100,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        100,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        100,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        100,
      ),
    ),
  );

  static BorderRadius customBorderTL16 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        16,
      ),
    ),
  );
  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );

  static BorderRadius circleBorder50 = BorderRadius.circular(
    getHorizontalSize(
      50,
    ),
  );

  static BorderRadius circleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16,
    ),
  );

  static BorderRadius circleBorder28 = BorderRadius.circular(
    getHorizontalSize(
      28,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
