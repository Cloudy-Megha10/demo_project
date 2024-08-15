import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgInfo,
                          height: getSize(78),
                          width: getSize(78)),
                      Padding(
                          padding: getPadding(top: 15, bottom: 5),
                          child: Text("lbl_kainok_app".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAllerBold28))
                    ]))));
  }
}
