import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import '../forgot_password_screen/controller/forgot_password_controller.dart';
import 'controller/forgot_password_otp_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordOtpVerificationScreen
    extends GetWidget<ForgotPasswordOtpVerificationController> {
  ForgotPasswordController forgotPasswordController =
      ForgotPasswordController();
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print("data");
    print(data['emailIdOrMobile']);
    print(data['createdOtp']);
    String emailIdOrMobile = data['emailIdOrMobile'];
    String createdOtp = data['createdOtp'];
    controller.otpController.value.text = createdOtp;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(796),
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
                                        margin: getMargin(top: 80),
                                        padding: getPadding(
                                            left: 23,
                                            top: 24,
                                            right: 23,
                                            bottom: 24),
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
                                                  padding: getPadding(top: 39),
                                                  child: Text(
                                                      "lbl_enter_otp".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtAllerBold23)),
                                              Padding(
                                                  padding: getPadding(top: 19),
                                                  child: Text(
                                                      "msg_enter_the_code_we_ve"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style:
                                                          AppStyle.txtAller14)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 35,
                                                      top: 13,
                                                      right: 35),
                                                  child: Obx(() => PinCodeTextField(
                                                      appContext: context,
                                                      controller: controller
                                                          .otpController.value,
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
                                                              getFontSize(14),
                                                          fontFamily: 'Aller',
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
                                              GestureDetector(
                                                child: Padding(
                                                    padding:
                                                        getPadding(top: 58),
                                                    child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text:
                                                                  "msg_haven_t_received2"
                                                                      .tr,
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .gray700,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Aller',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                          TextSpan(
                                                              text:
                                                                  "lbl_send_again"
                                                                      .tr,
                                                              style: TextStyle(
                                                                  color: ColorConstant
                                                                      .gray90001,
                                                                  fontSize:
                                                                      getFontSize(
                                                                          14),
                                                                  fontFamily:
                                                                      'Aller',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline))
                                                        ]),
                                                        textAlign:
                                                            TextAlign.left)),
                                                onTap: () {
                                                  print("SendAgain");
                                                  print(
                                                      data['emailIdOrMobile']);
                                                  onTapSend(
                                                      data['emailIdOrMobile']);
                                                },
                                              ),
                                              Spacer(),
                                              CustomButton(
                                                  height: getVerticalSize(54),
                                                  text: "lbl_verify".tr,
                                                  variant: ButtonVariant
                                                      .FillGray90002,
                                                  padding: ButtonPadding
                                                      .PaddingAll18,
                                                  onTap: () {
                                                    onTapVerify(
                                                        createdOtp,
                                                        emailIdOrMobile);
                                                  })
                                            ])))
                              ]))
                    ]))));
  }

  onTapImgClose() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapVerify(String otpValidate, String emailIdOrMobile) {
    controller.otpVerificationGetApi(otpValidate, emailIdOrMobile);
    // Get.toNamed(
    //   AppRoutes.newPasswordScreen,
    // );
  }

  onTapSend(String emailAddressOrMobile) {
    print("emailAddressOrMobile");
    print(emailAddressOrMobile);
    forgotPasswordController.forgotPasswordGetApi(emailAddressOrMobile);
    // Get.toNamed(
    //   AppRoutes.newPasswordScreen,
    // );
  }
}
