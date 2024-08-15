import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/voting_screen_controller.dart';

import 'package:flutter/material.dart';

import '../models/carousel_item_model.dart';

// ignore: must_be_immutable
class ListtrendingItemWidget extends StatelessWidget {
  ListtrendingItemWidget(this.listtrendingItemModelObj,
      {this.onTapColumntrending});

  CarouselItemModel listtrendingItemModelObj;

  var controller = Get.find<VotingScreenController>();

  VoidCallback? onTapColumntrending;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          onTapColumntrending?.call();
        },
        child: Padding(
          padding: getPadding(
            right: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: ColorConstant.orange300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.circleBorder50,
                ),
                child: Container(
                  height: getSize(
                    100,
                  ),
                  width: getSize(
                    100,
                  ),
                  decoration: AppDecoration.fillOrange300.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder50,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage7,
                        height: getSize(
                          100,
                        ),
                        width: getSize(
                          100,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            50,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgImage12,
                        height: getSize(
                          100,
                        ),
                        width: getSize(
                          100,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            50,
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 9,
                ),
                child: Obx(
                  () => Text(
                    listtrendingItemModelObj.trendingTxt.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtAller14,
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
