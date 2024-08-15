import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../voting_screen_page/controller/voting_screen_controller.dart';
import 'controller/login_using_finger_print_controller.dart';

class LoginFingerPrintScreen extends GetWidget<LoginFingerPrintController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Container(
                          height: size.height,
                          width: double.maxFinite,
                          decoration: AppDecoration.fillBlack900,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: getVerticalSize(760),
                                        width: getHorizontalSize(370),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.whiteA70090,
                                            borderRadius: BorderRadius.circular(
                                                getHorizontalSize(16))))),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        margin: getMargin(top: 50),
                                        padding: getPadding(
                                            left: 23,
                                            top: 24,
                                            right: 23,
                                            bottom: 10),
                                        decoration: AppDecoration.fillWhiteA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .customBorderTL16),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgClose,
                                                  height: getSize(24),
                                                  width: getSize(24),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  onTap: () {
                                                    onTapImgClose();
                                                  }),
                                              Padding(
                                                  padding: getPadding(top: 31),
                                                  child: Text(
                                                      "msg_welcome_megha".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtAllerBold24
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.25)))),
                                              Padding(
                                                  padding: getPadding(
                                                      top: 12, bottom: 10),
                                                  child: Text(
                                                      "msg_tap_login_fingerprint"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Padding(
                                                  padding: getPadding(
                                                    top: 12,
                                                    bottom: 10,
                                                    left: 100,
                                                  ),
                                                  child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgFingerPrint,
                                                      height: getSize(150),
                                                      width: getSize(150),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      onTap: () {
                                                        onTapImgClose();
                                                      })),
                                              Padding(
                                                  padding: getPadding(
                                                      top: 12, bottom: 10),
                                                  child: Text(
                                                      "msg_enter_login_pin".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 35,
                                                      top: 14,
                                                      right: 35),
                                                  child: Obx(() => PinCodeTextField(
                                                      appContext: context,
                                                      controller: controller
                                                          .otpController1.value,
                                                      length: 4,
                                                      obscureText: false,
                                                      obscuringCharacter: '*',
                                                      keyboardType:
                                                          TextInputType.number,
                                                      autoDismissKeyboard: true,
                                                      enableActiveFill: true,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      onChanged: (value) {},
                                                      textStyle: TextStyle(
                                                          color: ColorConstant
                                                              .black90054,
                                                          fontSize:
                                                              getFontSize(16),
                                                          fontFamily: 'Avenir',
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      pinTheme: PinTheme(
                                                          fieldHeight:
                                                              getHorizontalSize(
                                                                  52),
                                                          fieldWidth:
                                                              getHorizontalSize(
                                                                  56),
                                                          shape:
                                                              PinCodeFieldShape
                                                                  .box,
                                                          borderRadius:
                                                              BorderRadius.circular(getHorizontalSize(16)),
                                                          selectedFillColor: ColorConstant.gray100,
                                                          activeFillColor: ColorConstant.gray100,
                                                          inactiveFillColor: ColorConstant.gray100,
                                                          inactiveColor: ColorConstant.fromHex("#1212121D"),
                                                          selectedColor: ColorConstant.fromHex("#1212121D"),
                                                          activeColor: ColorConstant.fromHex("#1212121D"))))),
                                              Padding(
                                                  padding: getPadding(top: 18),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: "lbl_forgot_pin"
                                                                .tr,
                                                            style: TextStyle(
                                                                color:
                                                                    ColorConstant
                                                                        .gray900,
                                                                fontSize:
                                                                    getFontSize(
                                                                        14),
                                                                fontFamily:
                                                                    'Aller',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    getHorizontalSize(
                                                                        0.25),
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline))
                                                      ]),
                                                      textAlign:
                                                          TextAlign.left)),
                                              SizedBox(
                                                height: 170,
                                              ),
                                              CustomButton(
                                                  height: getVerticalSize(52),
                                                  text: "lbl_login".tr,
                                                  //margin: getMargin(bottom: 50),
                                                  onTap: () {
                                                    onTapLogin();
                                                  })
                                            ])))
                              ]))
                    ])))));
  }

  onTapImgClose() {
    Get.toNamed(AppRoutes.votingScreenPage)
        ?.then((value) => Get.delete<VotingScreenController>());
  }

  onTapLogin() {
    //controller.logInPost(username: "username", password: "password");
    Get.toNamed(
      AppRoutes.imageDetailsScreenContainerScreen,
    );
  }
}
