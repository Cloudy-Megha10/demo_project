import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/create_account_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CreateAccountScreen extends GetWidget<CreateAccountController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                child: Container(
                    height: 900,
                    // width: double.maxFinite,
                    child: SingleChildScrollView(
                        // reverse: true, // this is new
                        // physics: BouncingScrollPhysics(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Container(
                              // height: size.height,
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
                                                color:
                                                    ColorConstant.whiteA70090,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            16))))),
                                    SingleChildScrollView(
                                        child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                padding: getPadding(
                                                    left: 24,
                                                    top: 15,
                                                    right: 24,
                                                    bottom: 45),
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
                                                              top: 2),
                                                          child: Text(
                                                              "lbl_create_account"
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
                                                      Platform.isIOS
                                                          ? GestureDetector(
                                                              onTap: () {
                                                                onTapAppleSignIn();
                                                              },
                                                              child: Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        MediaQuery.of(context).size.width *
                                                                            0.13, // 13% of the screen width
                                                                        MediaQuery.of(context).size.height *
                                                                            0.049, // 4.9% of the screen height
                                                                        MediaQuery.of(context).size.width *
                                                                            0.13, // 13% of the screen width
                                                                        0),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.09, // 9% of the screen width
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.016, // 1.6% of the screen height
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.09, // 9% of the screen width
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.016, // 1.6% of the screen height
                                                                ),
                                                                decoration:
                                                                    AppDecoration
                                                                        .outlineBlack90099
                                                                        .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder20,
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgIcbaselineapple,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.036, // 3.6% of the screen height
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.06, // 6% of the screen width
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: MediaQuery.of(context).size.width *
                                                                            0.02, // 2% of the screen width
                                                                        top: MediaQuery.of(context).size.height *
                                                                            0.008, // 0.8% of the screen height
                                                                        bottom: MediaQuery.of(context).size.height *
                                                                            0.004, // 0.4% of the screen height
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "msg_continue_with_apple"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: AppStyle
                                                                            .txtAller14,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          onTapGoogleSignIn();
                                                        },
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.13, // 13% of the screen width
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.015, // 1.5% of the screen height
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.13,
                                                                    0 // 13% of the screen width
                                                                    ),
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.09, // 9% of the screen width
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02, // 2% of the screen height
                                                              0,
                                                              // MediaQuery.of(context)
                                                              //         .size
                                                              //         .width *
                                                              //     0.1, // 10% of the screen width
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.02, // 2% of the screen height
                                                            ),
                                                            decoration: AppDecoration
                                                                .outlineBlack90099
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder20),
                                                            child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgLogosgoogleicon,
                                                                      height:
                                                                          getSize(
                                                                              20),
                                                                      width: getSize(
                                                                          20)),
                                                                  Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: MediaQuery.of(context).size.width *
                                                                            0.02, // 2% of the screen width
                                                                        top: MediaQuery.of(context).size.height *
                                                                            0.008, // 0.8% of the screen height
                                                                        // right: MediaQuery.of(context)
                                                                        //         .size
                                                                        //         .width *
                                                                        //     0.02, // 2% of the screen width
                                                                        bottom: MediaQuery.of(context).size.height *
                                                                            0.004, // 0.4% of the screen height
                                                                      ),
                                                                      child: Text(
                                                                          "msg_continue_with_google"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              AppStyle.txtAller14))
                                                                ])),
                                                      ),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 17),
                                                          child: Text(
                                                              "lbl_or".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAller13
                                                                  .copyWith(
                                                                      letterSpacing:
                                                                          getHorizontalSize(
                                                                              0.25)))),
                                                      CustomTextFormField(
                                                          // focusNode:
                                                          //     FocusNode(),
                                                          controller: controller
                                                              .firstnameController,
                                                          hintText:
                                                              "lbl_first_name"
                                                                  .tr,
                                                          labelText:
                                                              "lbl_first_name"
                                                                  .tr,
                                                          margin: getMargin(
                                                              top: 16),
                                                          validator: (value) {
                                                            if (!isText(
                                                                value)) {
                                                              return "Please enter valid text";
                                                            }
                                                            return null;
                                                          }),
                                                      CustomTextFormField(
                                                          // focusNode:
                                                          //     FocusNode(),
                                                          controller: controller
                                                              .lastnameController,
                                                          hintText:
                                                              "lbl_last_name"
                                                                  .tr,
                                                          labelText:
                                                              "lbl_last_name"
                                                                  .tr,
                                                          margin: getMargin(
                                                              top: 16),
                                                          validator: (value) {
                                                            if (!isText(
                                                                value)) {
                                                              return "Please enter valid text";
                                                            }
                                                            return null;
                                                          }),
                                                      CustomTextFormField(
                                                          // focusNode:
                                                          //     FocusNode(),
                                                          controller: controller
                                                              .emailController,
                                                          hintText:
                                                              "lbl_email".tr,
                                                          labelText:
                                                              "lbl_email".tr,
                                                          margin: getMargin(
                                                              top: 16),
                                                          textInputType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                (!isValidEmail(
                                                                    value,
                                                                    isRequired:
                                                                        true))) {
                                                              return "Please enter valid email";
                                                            }
                                                            return null;
                                                          }),
                                                      CustomTextFormField(
                                                          // focusNode:
                                                          //     FocusNode(),
                                                          controller: controller
                                                              .mobileNoController,
                                                          hintText:
                                                              "lbl_phone_number"
                                                                  .tr,
                                                          labelText:
                                                              "lbl_phone_number"
                                                                  .tr,
                                                          margin: getMargin(
                                                              top: 16),
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          textInputType:
                                                              TextInputType
                                                                  .phone,
                                                          validator: (value) {
                                                            if (!isValidPhone(
                                                                value)) {
                                                              return "Please enter valid mobile no.";
                                                            }
                                                            return null;
                                                          }),
                                                      // CustomDropDown(
                                                      //     focusNode:
                                                      //         FocusNode(),
                                                      //     icon: Container(
                                                      //         margin: getMargin(
                                                      //             left: 30,
                                                      //             right: 14),
                                                      //         child: CustomImageView(
                                                      //             svgPath:
                                                      //                 ImageConstant
                                                      //                     .imgArrowdown)),
                                                      //     hintText:
                                                      //         "lbl_city".tr,
                                                      //     margin: getMargin(
                                                      //         top: 16),
                                                      //     items: controller
                                                      //         .createAccountModelObj
                                                      //         .value
                                                      //         .dropdownItemList
                                                      //         .value,
                                                      //     onChanged: (value) {
                                                      //       controller
                                                      //           .onSelected(
                                                      //               value);
                                                      //     }),
                                                      CustomTextFormField(
                                                          // focusNode:
                                                          //     FocusNode(),
                                                          controller: controller
                                                              .cityController,
                                                          readOnly: true,
                                                          hintText:
                                                              "lbl_city".tr,
                                                          labelText:
                                                              "lbl_city".tr,
                                                          margin: getMargin(
                                                              top: 16),
                                                          textInputType:
                                                              TextInputType
                                                                  .name,
                                                          validator: (value) {
                                                            if (!isText(
                                                                value)) {
                                                              return "Please enter valid text";
                                                            }
                                                            return null;
                                                          }),
                                                      Obx(() =>
                                                          CustomTextFormField(
                                                              // focusNode:
                                                              //     FocusNode(),
                                                              controller: controller
                                                                  .passwordController,
                                                              hintText:
                                                                  "lbl_password"
                                                                      .tr,
                                                              labelText:
                                                                  "lbl_password"
                                                                      .tr,
                                                              margin: getMargin(
                                                                  top: 16),
                                                              padding: TextFormFieldPadding
                                                                  .PaddingT17_2,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              textInputType:
                                                                  TextInputType
                                                                      .visiblePassword,
                                                              suffix: InkWell(
                                                                  onTap: () {
                                                                    controller
                                                                            .isShowPassword
                                                                            .value =
                                                                        !controller
                                                                            .isShowPassword
                                                                            .value;
                                                                  },
                                                                  child: Container(
                                                                      margin: getMargin(
                                                                          left:
                                                                              30,
                                                                          top:
                                                                              14,
                                                                          right:
                                                                              16,
                                                                          bottom:
                                                                              14),
                                                                      child: CustomImageView(
                                                                          svgPath: controller.isShowPassword.value
                                                                              ? ImageConstant.imgCut
                                                                              : ImageConstant.imgCut))),
                                                              suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(52)),
                                                              validator: (value) {
                                                                if (value ==
                                                                        null ||
                                                                    (!isValidPassword(
                                                                        value,
                                                                        isRequired:
                                                                            true))) {
                                                                  return "Please enter valid password";
                                                                }
                                                                return null;
                                                              },
                                                              isObscureText: controller.isShowPassword.value)),
                                                      Padding(
                                                          padding: getPadding(
                                                              left: 4,
                                                              top: 12,
                                                              right: 11),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Obx(
                                                                  () =>
                                                                      CustomCheckbox(
                                                                    iconSize:
                                                                        20,
                                                                    padding:
                                                                        getPadding(
                                                                      left: 1,
                                                                      bottom:
                                                                          54,
                                                                    ),
                                                                    value: controller
                                                                        .selected
                                                                        .value,
                                                                    onChange:
                                                                        (value) {
                                                                      controller
                                                                          .selected
                                                                          .value = value;
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    child: Container(
                                                                        width: getHorizontalSize(302),
                                                                        margin: getMargin(left: 8, top: 1),
                                                                        child: RichText(
                                                                            text: TextSpan(children: [
                                                                              TextSpan(text: "msg_by_creating_an_account4".tr, style: TextStyle(color: ColorConstant.gray700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25))),
                                                                              TextSpan(text: " ", style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25))),
                                                                              TextSpan(text: "msg_terms_conditions".tr, style: TextStyle(color: ColorConstant.gray900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25), decoration: TextDecoration.underline)),
                                                                              TextSpan(text: "lbl".tr, style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25))),
                                                                              TextSpan(text: "lbl2".tr, style: TextStyle(color: ColorConstant.gray700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25))),
                                                                              TextSpan(text: " ", style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25))),
                                                                              TextSpan(text: "lbl_privacy_policy".tr, style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25), decoration: TextDecoration.underline)),
                                                                              TextSpan(text: "lbl3".tr, style: TextStyle(color: ColorConstant.indigo700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400, letterSpacing: getHorizontalSize(0.25), decoration: TextDecoration.underline))
                                                                            ]),
                                                                            textAlign: TextAlign.left)))
                                                              ])),
                                                      CustomButton(
                                                          height:
                                                              getVerticalSize(
                                                                  52),
                                                          text:
                                                              "lbl_continue".tr,
                                                          margin: getMargin(
                                                              top: 19),
                                                          onTap: () {
                                                            onTapContinue();
                                                          }),
                                                      Padding(
                                                          // this is new
                                                          padding: EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets
                                                                  .bottom)),
                                                      GestureDetector(
                                                        child: Padding(
                                                            padding: getPadding(
                                                                top: 18),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text: "msg_already_have_an2"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray700,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400,
                                                                              letterSpacing: getHorizontalSize(0.25))),
                                                                      TextSpan(
                                                                          text: "lbl_sign_in"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray900,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400,
                                                                              letterSpacing: getHorizontalSize(0.25),
                                                                              decoration: TextDecoration.underline))
                                                                    ]),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left)),
                                                        onTap: () {
                                                          onTapSignIn();
                                                        },
                                                      ),
                                                    ]))))
                                  ]))
                        ]))))));
  }

  onTapImgClose() {
    Get.back();
  }

  Future<String?> onTapGoogleSignIn() async {
    SecureStorage _secureStorage = SecureStorage();

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

      dynamic userId = await _secureStorage.getUserId();

      (userId == "0" || userId == null)
          ? controller.registerThroughGoogle(
              firstName: firstName,
              lastName: lastName,
              email: email,
            )
          : controller.loginPost(email: "$email", password: "");
    } else {
      print('Google user is null');
    }
  }

  void onTapAppleSignIn() async {
    SecureStorage _secureStorage = SecureStorage();

    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId:
              '133027224119-puf6ulpffb2njfio3p05b9oi1nebj70d.apps.googleusercontent.com',
          redirectUri:
              Uri.parse('https://your-domain.com/apple-signin-redirect'),
        ),
      );

      // Obtain the necessary user data from the credential
      final String email = credential.email ?? '';
      final String firstName = credential.givenName ?? '';
      final String lastName = credential.familyName ?? '';

      // Use the obtained data as needed, e.g., authenticate the user
      // with your backend server or store the user information locally.
      dynamic userId = await _secureStorage.getUserId();

      (userId == "0" || userId == null)
          ? controller.registerThroughGoogle(
              firstName: firstName,
              lastName: lastName,
              email: email,
            )
          : controller.loginPost(email: "$email", password: "");
    } catch (e) {
      // Handle any errors that occur during the Sign in with Apple flow
      Get.snackbar('Error', e.toString());
    }
  }

  onTapContinue() async {
    print("controller.firstnameController.text.isEmpty");
    print(controller.firstnameController.text.isEmpty);
    if (controller.firstnameController.text.isEmpty ||
        controller.lastnameController.text.isEmpty ||
        controller.emailController.text.isEmpty ||
        controller.mobileNoController.text.isEmpty ||
        controller.passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter all the mandatory details",
        backgroundColor: ColorConstant.gray100,
      );
    } else {
      onTapSaveDetails();
    }
  }

  onTapSignIn() {
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }

  onTapSaveDetails() async {
    if (controller.selected.value == true) {
      await controller.saveRegisterDetails(
          firstName: controller.firstnameController.text,
          lastName: controller.lastnameController.text,
          email: controller.emailController.text,
          city: controller.currentLatitude.toString() +
              "," +
              controller.currentLongitude.toString(),
          password: controller.passwordController.text,
          mobileNo: controller.mobileNoController.text);
      Get.toNamed(
        AppRoutes.enterOtpScreen,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Please enable terms and conditions",
        backgroundColor: ColorConstant.gray100,
      );
    }
  }
}
