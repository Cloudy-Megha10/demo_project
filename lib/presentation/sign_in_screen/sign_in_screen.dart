import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_image_view.dart';
import '../voting_screen_page/controller/voting_screen_controller.dart';
import 'controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/validation_functions.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';
import 'package:demo_project/domain/googleauth/google_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends GetWidget<SignInController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        print("Back button handled");
        return false;
      },
      child: SafeArea(
          child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: ColorConstant.whiteA700,
                  body: Form(
                      key: _formKey,
                      child: Container(
                          width: double.maxFinite,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    height: getVerticalSize(796),
                                    width: double.maxFinite,
                                    decoration: AppDecoration.fillBlack900,
                                    child: Stack(
                                        alignment: Alignment.center,
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
                                                  margin: getMargin(top: 30),
                                                  padding: getPadding(all: 24),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgClose,
                                                            height: getSize(24),
                                                            width: getSize(24),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            onTap: () {
                                                              onTapImgClose();
                                                            }),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 9),
                                                            child: Text(
                                                                "Sign In".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtAllerBold23)),
                                                        Platform.isIOS
                                                            ? GestureDetector(
                                                                onTap: () {
                                                                  onTapAppleSignIn();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          MediaQuery.of(context).size.width *
                                                                              0.13, // 13% of the screen width
                                                                          MediaQuery.of(context).size.height *
                                                                              0.020, // 2.0% of the screen height
                                                                          MediaQuery.of(context).size.width *
                                                                              0.13, // 13% of the screen width
                                                                          0),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.09, // 9% of the screen width
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.016, // 1.6% of the screen height
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.09, // 9% of the screen width
                                                                    MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.016, // 1.6% of the screen height
                                                                  ),
                                                                  decoration: AppDecoration
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
                                                                            ImageConstant.imgIcbaselineapple,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.036, // 3.6% of the screen height
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.06, // 6% of the screen width
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          left: MediaQuery.of(context).size.width *
                                                                              0.02, // 2% of the screen width
                                                                          top: MediaQuery.of(context).size.height *
                                                                              0.008, // 0.8% of the screen height
                                                                          bottom:
                                                                              MediaQuery.of(context).size.height * 0.004, // 0.4% of the screen height
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "msg_continue_with_apple"
                                                                              .tr,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style:
                                                                              AppStyle.txtAller14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ))
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
                                                                        height: getSize(
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
                                                                          bottom:
                                                                              MediaQuery.of(context).size.height * 0.004, // 0.4% of the screen height
                                                                        ),
                                                                        child: Text(
                                                                            "msg_continue_with_google"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtAller14))
                                                                  ])),
                                                        ),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 15),
                                                            child: Text(
                                                                "lbl_or".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtAller14Gray700)),
                                                        CustomTextFormField(
                                                            // focusNode: FocusNode(),
                                                            controller: controller
                                                                .emailController,
                                                            hintText:
                                                                "lbl_email".tr,
                                                            labelText:
                                                                "lbl_email".tr,
                                                            margin: getMargin(
                                                                top: 13),
                                                            textInputType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  (!isValidEmail(
                                                                      value,
                                                                      isRequired:
                                                                          true))) {
                                                                return "Please enter valid email";
                                                              }
                                                              return null;
                                                            }),
                                                        Obx(() =>
                                                            CustomTextFormField(
                                                                focusNode:
                                                                    passwordFocusNode,
                                                                controller:
                                                                    controller
                                                                        .passwordController,
                                                                hintText:
                                                                    "lbl_password"
                                                                        .tr,
                                                                labelText:
                                                                    "lbl_password"
                                                                        .tr,
                                                                margin: getMargin(
                                                                    top: 16),
                                                                padding:
                                                                    TextFormFieldPadding
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
                                                              top: 11,
                                                            ),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Obx(
                                                                    () =>
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .requestFocus(passwordFocusNode);
                                                                      },
                                                                      child:
                                                                          CustomCheckbox(
                                                                        iconSize:
                                                                            20,
                                                                        padding:
                                                                            getPadding(
                                                                          left:
                                                                              1,
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
                                                                  ),
                                                                  Container(
                                                                      width: getHorizontalSize(
                                                                          300),
                                                                      margin: getMargin(
                                                                          left:
                                                                              8),
                                                                      child: RichText(
                                                                          text: TextSpan(children: [
                                                                            TextSpan(
                                                                                text: "msg_by_creating_an_account4".tr,
                                                                                style: TextStyle(color: ColorConstant.gray700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: " ",
                                                                                style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: "msg_terms_conditions".tr,
                                                                                style: TextStyle(color: ColorConstant.gray90001, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: "lbl".tr,
                                                                                style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: "lbl2".tr,
                                                                                style: TextStyle(color: ColorConstant.gray700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: " ",
                                                                                style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: "lbl_privacy_policy".tr,
                                                                                style: TextStyle(color: ColorConstant.black900, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400)),
                                                                            TextSpan(
                                                                                text: "lbl3".tr,
                                                                                style: TextStyle(color: ColorConstant.indigo700, fontSize: getFontSize(14), fontFamily: 'Aller', fontWeight: FontWeight.w400))
                                                                          ]),
                                                                          textAlign: TextAlign.left))
                                                                ])),
                                                        CustomButton(
                                                            height:
                                                                getVerticalSize(
                                                                    52),
                                                            width:
                                                                getHorizontalSize(
                                                                    240),
                                                            text: "lbl_sign_in"
                                                                .tr,
                                                            margin: getMargin(
                                                                top: 34),
                                                            onTap: () {
                                                              onTapSigninwith();
                                                            }),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapTxtForgotpassword();
                                                            },
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top:
                                                                            40),
                                                                child: Text(
                                                                    "lbl_forgot_password"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAller14Gray900
                                                                        .copyWith(
                                                                            decoration:
                                                                                TextDecoration.underline)))),
                                                        Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              onTapTxtDonthaveankainok();
                                                            },
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text: "lbl_don_t_have_an"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray700,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "lbl_kainok"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray700,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "lbl_account"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray700,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text:
                                                                              " ",
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray700,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400,
                                                                              decoration: TextDecoration.underline)),
                                                                      TextSpan(
                                                                          text: "lbl_sign_up"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray90001,
                                                                              fontSize: getFontSize(14),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400,
                                                                              decoration: TextDecoration.underline))
                                                                    ]),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left)),
                                                        Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    322),
                                                            margin: getMargin(
                                                                left: 9,
                                                                top: 30,
                                                                right: 9),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text: "msg_by_creating_an_account2"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray50001,
                                                                              fontSize: getFontSize(12),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "msg_terms_of_service2"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray90001,
                                                                              fontSize: getFontSize(12),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "lbl_and"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray50001,
                                                                              fontSize: getFontSize(12),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "lbl_cookie_policy"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray90001,
                                                                              fontSize: getFontSize(12),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400)),
                                                                      TextSpan(
                                                                          text: "msg_i_understand_that"
                                                                              .tr,
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray50001,
                                                                              fontSize: getFontSize(12),
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w400))
                                                                    ]),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center))
                                                      ])))
                                        ]))
                              ])))))));

  onTapImgClose() {
    Get.toNamed(AppRoutes.competitionsScreen)
        ?.then((value) => Get.delete<CompetitionsScreenController>());
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
      print("UserIddd");
      print(controller.userId);

      dynamic userId = await _secureStorage.getUserId();
      print("userIdsecure");
      print(userId);

      (userId == "0" || userId == null)
          ? controller.registerPost(
              firstName: firstName,
              lastName: lastName,
              email: email,
            )
          : controller.loginPost(email: "$email", password: "");
    } else {
      print('Google user is null');
    }
  }

  Future<String?> onTapAppleSignIn() async {
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
      print("userIdsecure");
      print(userId);

      (userId == "0" || userId == null)
          ? controller.registerPost(
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

  onTapTxtDonthaveankainok() {
    Get.toNamed(
      AppRoutes.createAccountScreen,
    );
  }

  onTapSigninwith() async {
    print("login true");
    print(controller.emailController.text);
    print(controller.passwordController.text);

    if (controller.emailController.text.isEmpty ||
        controller.passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter valid credentials",
        backgroundColor: Colors.grey,
      );
    } else {
      (controller.selected.value == true)
          ? await controller.loginPost(
              email: controller.emailController.text,
              password: controller.passwordController.text)
          : Fluttertoast.showToast(
              msg: "Please enable terms and conditions",
              backgroundColor: Colors.grey,
            );
    }

    // Get.toNamed(AppRoutes.imageDetailsScreenContainerScreen);
    // Get.toNamed(
    //   AppRoutes.createAccountScreen,
    // );
  }

  onTapSignIn() {
    Get.toNamed(
      AppRoutes.signInScreen,
    );
  }

  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }
}
