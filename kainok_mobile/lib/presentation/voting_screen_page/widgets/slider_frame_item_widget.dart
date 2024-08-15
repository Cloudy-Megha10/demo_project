import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/voting_screen_controller.dart';

import 'package:flutter/material.dart';

import '../models/slider_frame_item_model.dart';

// ignore: must_be_immutable
class Sliderframe177ItemWidget extends StatelessWidget {
  Sliderframe177ItemWidget(this.sliderframe177ItemModelObj);

  SliderItemModel sliderframe177ItemModelObj;

  var controller = Get.find<VotingScreenController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: ColorConstant.black900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.circleBorder16,
        ),
        child: Container(
          height: getVerticalSize(
            213,
          ),
          width: getHorizontalSize(
            342,
          ),
          decoration: AppDecoration.fillBlack900.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder16,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2,
                height: getVerticalSize(
                  213,
                ),
                width: getHorizontalSize(
                  342,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    16,
                  ),
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: getPadding(
                    left: 19,
                    top: 16,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        height: getVerticalSize(
                          28,
                        ),
                        width: getHorizontalSize(
                          63,
                        ),
                        text: "lbl_4_2_k".tr,
                        variant: ButtonVariant.FillWhiteA700cc,
                        shape: ButtonShape.CircleBorder14,
                        padding: ButtonPadding.PaddingT5,
                        fontStyle: ButtonFontStyle.PoppinsMedium11,
                        suffixWidget: Container(
                          margin: getMargin(
                            left: 4,
                          ),
                          // decoration: BoxDecoration(
                          //   color: ColorConstant.red600,
                          // ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgFavorite,
                          ),
                        ),
                        alignment: Alignment.centerRight,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 89,
                        ),
                        child: Text(
                          "lbl_adventure".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPoppinsSemiBold24.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.25,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "lbl_521".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular13Gray5001.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
