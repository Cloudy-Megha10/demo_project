import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/enter_otp_controller.dart';

class EnterOtpScreen extends GetWidget<EnterOtpController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Handle back button press here
          return false; // Return false to prevent default back button behavior
        },
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              Container(
                                  //height: size.height,
                                  width: double.maxFinite,
                                  decoration: AppDecoration.fillBlack900,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                height: getVerticalSize(771),
                                                width: getHorizontalSize(371),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .whiteA70090,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                16))))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 15,
                                                    right: 24,
                                                    bottom: 15),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL16),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgClose,
                                                          height: getSize(24),
                                                          width: getSize(24),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          margin:
                                                              getMargin(top: 8),
                                                          onTap: () {
                                                            onTapImgClose();
                                                          }),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 45,
                                                              bottom: 10),
                                                          child: Text(
                                                              "lbl_enter_otp"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAllerBold24
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.25)))),
                                                      Obx(
                                                        () => Container(
                                                            width: getHorizontalSize(
                                                                256),
                                                            margin: getMargin(
                                                                left: 42,
                                                                top: 13,
                                                                right: 44),
                                                            child: Text(
                                                                "msg_enter_the_code_we_ve"
                                                                        .tr +
                                                                    " ${controller.mobileNumber.value} :",
                                                                maxLines: null,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .txtAller14)),
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 35,
                                                              top: 14,
                                                              right: 35),
                                                          child: Obx(() => PinCodeTextField(
                                                              appContext:
                                                                  context,
                                                              controller: controller
                                                                  .otpController
                                                                  .value,
                                                              length: 4,
                                                              obscureText:
                                                                  false,
                                                              obscuringCharacter:
                                                                  '*',
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              autoDismissKeyboard:
                                                                  true,
                                                              enableActiveFill:
                                                                  true,
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly
                                                              ],
                                                              onChanged:
                                                                  (value) {},
                                                              textStyle: TextStyle(
                                                                  color: ColorConstant
                                                                      .black90054,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          16),
                                                                  fontFamily:
                                                                      'Avenir',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              pinTheme: PinTheme(
                                                                  fieldHeight:
                                                                      getHorizontalSize(52),
                                                                  fieldWidth: getHorizontalSize(56),
                                                                  shape: PinCodeFieldShape.box,
                                                                  borderRadius: BorderRadius.circular(getHorizontalSize(16)),
                                                                  selectedFillColor: ColorConstant.gray100,
                                                                  activeFillColor: ColorConstant.gray100,
                                                                  inactiveFillColor: ColorConstant.gray100,
                                                                  inactiveColor: ColorConstant.fromHex("#1212121D"),
                                                                  selectedColor: ColorConstant.fromHex("#1212121D"),
                                                                  activeColor: ColorConstant.fromHex("#1212121D"))))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 57),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                        text: "msg_haven_t_received2"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .gray700,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Aller',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            letterSpacing: getHorizontalSize(0.25))),
                                                                    TextSpan(
                                                                        text: "lbl_send_again"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            color: ColorConstant
                                                                                .gray900,
                                                                            fontSize: getFontSize(
                                                                                14),
                                                                            fontFamily:
                                                                                'Aller',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            letterSpacing: getHorizontalSize(0.25),
                                                                            decoration: TextDecoration.underline))
                                                                  ]),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)),
                                                      SizedBox(
                                                        height: 265,
                                                      ),
                                                      CustomButton(
                                                          height:
                                                              getVerticalSize(
                                                                  52),
                                                          text: "lbl_login".tr,
                                                          margin: getMargin(
                                                              bottom: 31),
                                                          onTap: () {
                                                            onTapLogin();
                                                          })
                                                    ])))
                                      ]))
                            ])))))));
  }

  onTapImgClose() {
    Get.back();
  }

  onTapLogin() {
    if (controller.otpController.value.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter otp",
        backgroundColor: Colors.grey,
      );
    } else {
      controller.registerPost();
    }

    // Get.toNamed(
    //   AppRoutes.imageDetailsScreenContainerScreen,
    // );
    // Get.toNamed(
    //   AppRoutes.fingerPrintScreen,
    // );
  }
}
