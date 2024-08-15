import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/validation_functions.dart';
import 'package:demo_project/widgets/app_bar/appbar_button_1.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            // appBar: CustomAppBar(
            //     height: getVerticalSize(76),
            //     title: AppbarButton1(
            //         margin: getMargin(left: 24),
            //         onTap: () {
            //           onTapForgotpassword();
            //         }),
            //     styleType: Style.bgFillWhiteA700_1),
            // appBar: CustomAppBar(
            //     height: getVerticalSize(76),
            //     title: CustomButton(
            //         width: getHorizontalSize(200),
            //         text: "lbl_forgot_password".tr,
            //         margin: getMargin(left: 24),
            //         variant: ButtonVariant.FillWhiteA700cc,
            //         shape: ButtonShape.CircleBorder14,
            //         padding: ButtonPadding.PaddingAll6,
            //         fontStyle: ButtonFontStyle.AllerBold16,
            //         prefixWidget: Container(
            //             margin: getMargin(right: 16),
            //             child: CustomImageView(
            //                 svgPath: ImageConstant.imgArrowleftGray900)),
            //         onTap: () {
            //           Get.back();
            //         }),
            //     styleType: Style.bgFillWhiteA700_1),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 23, top: 24, right: 23, bottom: 24),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.phonenumberController,
                              hintText: "msg_enter_email_address".tr,
                              labelText: "Email Address",
                              padding: TextFormFieldPadding.PaddingT17,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_send".tr,
                              margin: getMargin(top: 24),
                              variant: ButtonVariant.FillGray90002,
                              padding: ButtonPadding.PaddingAll18,
                              onTap: () {
                                onTapSend(
                                    controller.phonenumberController.text);
                              }),
                          Padding(
                              padding: getPadding(top: 31),
                              child: Text("lbl_or".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtAller14Gray700)),
                          Container(
                              margin: getMargin(left: 51, top: 49, right: 51),
                              padding: getPadding(
                                  left: 39, top: 16, right: 39, bottom: 16),
                              decoration: AppDecoration.outlineBlack90099
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder20),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgIcbaselineapple,
                                        height: getSize(24),
                                        width: getSize(24)),
                                    Padding(
                                        padding: getPadding(
                                            left: 8,
                                            top: 4,
                                            right: 8,
                                            bottom: 2),
                                        child: Text(
                                            "msg_continue_with_apple".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtAller14))
                                  ])),
                          GestureDetector(
                            onTap: () {
                              onTapGoogleSignIn();
                            },
                            child: Container(
                                margin: getMargin(left: 51, top: 15, right: 51),
                                padding: getPadding(
                                    left: 35, top: 16, right: 39, bottom: 16),
                                decoration: AppDecoration.outlineBlack90099
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder20),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CustomImageView(
                                          svgPath:
                                              ImageConstant.imgLogosgoogleicon,
                                          height: getSize(20),
                                          width: getSize(20)),
                                      Padding(
                                          padding: getPadding(
                                              left: 8,
                                              top: 4,
                                              right: 8,
                                              bottom: 2),
                                          child: Text(
                                              "msg_continue_with_google".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAller14))
                                    ])),
                          ),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveankainok();
                              },
                              child: Padding(
                                  padding: getPadding(top: 26, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "lbl_don_t_have_an".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Aller',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: "lbl_kainok".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Aller',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: "lbl_account".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Aller',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: " ",
                                            style: TextStyle(
                                                color: ColorConstant.gray700,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Aller',
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline)),
                                        TextSpan(
                                            text: "lbl_sign_up".tr,
                                            style: TextStyle(
                                                color: ColorConstant.gray90001,
                                                fontSize: getFontSize(14),
                                                fontFamily: 'Aller',
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.underline))
                                      ]),
                                      textAlign: TextAlign.left)))
                        ])))));
  }

  onTapSend(String phoneNumberOrEmailId) {
    (controller.phonenumberController.text.isEmpty)
        ? Fluttertoast.showToast(
            msg: "Please enter valid Email Id or Mobile Number",
            backgroundColor: Colors.grey,
          )
        : controller.forgotPasswordGetApi(phoneNumberOrEmailId);

    // Get.toNamed(
    //   AppRoutes.forgotPasswordOtpVerificationScreen,
    // );
  }

  onTapTxtDonthaveankainok() {
    Get.toNamed(
      AppRoutes.createAccountScreen,
    );
  }

  onTapForgotpassword() {
    // Get.toNamed(
    //   AppRoutes.imageDetailsScreenContainer1Screen,
    // );
  }

  Future<String?> onTapGoogleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null && googleUser.serverAuthCode == null) {
      print("googleUser");
      print(googleUser);
      print("onTapGoogleSignIn Sign");
      print(googleUser);
      String displayName = googleUser.displayName!;

      // Extract the first name and last name from the display name
      List<String> nameParts = displayName.split(' ');
      String firstName = nameParts.first;
      String lastName = nameParts.last;
      String response = '$googleUser';
      // Find the index of the email value
      int emailStartIndex = response.indexOf('email:') + 'email:'.length;
      int emailEndIndex = response.indexOf(',', emailStartIndex);

      // Extract the email from the response
      String email = response.substring(emailStartIndex, emailEndIndex).trim();

      // Display the extracted email
      print('Email: $email');

      print('First Name: $firstName');
      print('Last Name: $lastName');
      controller.registerPost(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      Get.snackbar('Success', 'Success');
      //Get.toNamed(AppRoutes.homeScreenPage, arguments: {
      //   'latitude': controller.currentLatitude.value,
      //   'longitude': controller.currentLongitude.value
      // });
    } else {
      print('Google user is null');
    }
  }
}
