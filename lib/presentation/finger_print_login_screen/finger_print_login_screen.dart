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
import 'controller/finger_print_controller.dart';

class FingerPrintScreen extends GetWidget<FingerPrintController> {
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
                                                      "msg_set_quick_access_pin"
                                                          .tr,
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
                                                      "msg_set_permanent_pin"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 20,
                                                              top: 30,
                                                              bottom: 20,
                                                              right: 100),
                                                          child: Text(
                                                              "enable_finger_print"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAller14)),
                                                      Obx(() => FlutterSwitch(
                                                            width: 55.0,
                                                            height: 25.0,
                                                            valueFontSize: 0.0,
                                                            toggleSize: 24.0,
                                                            value: controller
                                                                .isSwitched1
                                                                .value,
                                                            borderRadius: 20.0,
                                                            padding: 2.0,
                                                            showOnOff: true,
                                                            activeToggleColor:
                                                                ColorConstant
                                                                    .whiteA700,
                                                            inactiveToggleColor:
                                                                ColorConstant
                                                                    .whiteA700,
                                                            activeColor:
                                                                ColorConstant
                                                                    .gray100,
                                                            inactiveColor:
                                                                ColorConstant
                                                                    .black900,
                                                            onToggle: (val) {
                                                              print(
                                                                  "onToggleValue");
                                                              print(val);

                                                              controller
                                                                      .isSwitched1
                                                                      .value =
                                                                  !controller
                                                                      .isSwitched1
                                                                      .value;
                                                            },
                                                          ))
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 20,
                                                              top: 10,
                                                              bottom: 10,
                                                              right: 125),
                                                          child: Text(
                                                              "enable_face_id"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAller14)),
                                                      Obx(() => FlutterSwitch(
                                                            width: 55.0,
                                                            height: 25.0,
                                                            valueFontSize: 0.0,
                                                            toggleSize: 24.0,
                                                            value: controller
                                                                .isSwitched2
                                                                .value,
                                                            borderRadius: 20.0,
                                                            padding: 2.0,
                                                            showOnOff: true,
                                                            activeToggleColor:
                                                                ColorConstant
                                                                    .whiteA700,
                                                            inactiveToggleColor:
                                                                ColorConstant
                                                                    .whiteA700,
                                                            activeColor:
                                                                ColorConstant
                                                                    .gray100,
                                                            inactiveColor:
                                                                ColorConstant
                                                                    .black900,
                                                            onToggle: (val) {
                                                              print(
                                                                  "onToggleValue");
                                                              print(val);

                                                              controller
                                                                      .isSwitched2
                                                                      .value =
                                                                  !controller
                                                                      .isSwitched2
                                                                      .value;
                                                            },
                                                          ))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  left: 10.0,
                                                  right: 10.0,
                                                ),
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 25,
                                                ),
                                              ),
                                              Padding(
                                                  padding: getPadding(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                      "msg_set_new_pin".tr,
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
                                                  padding: getPadding(
                                                      top: 10, bottom: 10),
                                                  child: Text(
                                                      "msg_re-enter_new_pin".tr,
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
                                                          .otpController2.value,
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
                                                  padding: getPadding(
                                                      top: 12, bottom: 10),
                                                  child: Text(
                                                      "msg_pls_ensure_pin".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Padding(
                                                  padding: getPadding(top: 12),
                                                  child: Text(
                                                      "msg_pin_digits".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Text("msg_three_consecutive".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtAller14),
                                              Text("msg_three_same".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtAller14),
                                              Text("msg_birth_date".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtAller14),
                                              Text("msg_at_least".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtAller14),
                                              Spacer(),
                                              CustomButton(
                                                  height: getVerticalSize(52),
                                                  text: "lbl_login".tr,
                                                  margin: getMargin(bottom: 31),
                                                  onTap: () {
                                                    onTapLogin();
                                                  })
                                            ])))
                              ]))
                    ])))));
  }

  onTapImgClose() {
    Get.toNamed(
      AppRoutes.votingScreenPage,
    );
  }

  onTapLogin() {
    //controller.logInPost(username: "username", password: "password");
    // Get.toNamed(
    //   AppRoutes.imageDetailsScreenContainerScreen,
    // );
    Get.toNamed(
      AppRoutes.loginFingerPrintScreen,
    );
  }
}
