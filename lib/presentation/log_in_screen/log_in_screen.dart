import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kainok_app/presentation/create_account_screen/create_account_screen.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

import '../voting_screen_page/controller/voting_screen_controller.dart';
import 'controller/log_in_controller.dart';

class LogInScreen extends GetWidget<LogInController> {
  @override
  Widget build(BuildContext context) {
    print("Sign in");
    return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.whiteA700,
                body: Container(
                    width: double.maxFinite,
                    child:
                        // SingleChildScrollView(
                        //     child:
                        Column(
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
                                        alignment: Alignment.center,
                                        child: Container(
                                            height: getVerticalSize(760),
                                            width: getHorizontalSize(370),
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorConstant.whiteA70090,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            16))))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            padding: getPadding(
                                                left: 23,
                                                top: 24,
                                                right: 23,
                                                bottom: 24),
                                            decoration: AppDecoration
                                                .fillWhiteA700
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .customBorderTL16),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgClose,
                                                      height: getSize(24),
                                                      width: getSize(24),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      onTap: () {
                                                        onTapImgClose();
                                                      }),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          204),
                                                      margin:
                                                          getMargin(top: 31),
                                                      child: Text(
                                                          "msg_sign_in_or_create"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppStyle
                                                              .txtAllerBold24
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.25)))),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          256),
                                                      margin: getMargin(
                                                          left: 42,
                                                          top: 11,
                                                          right: 44),
                                                      child: Text(
                                                          "msg_create_an_account"
                                                              .tr,
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: AppStyle
                                                              .txtAller14)),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.13, // 13% of the screen width
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.049, // 4.9% of the screen height
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.13, // 13% of the screen width
                                                        0),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgIcbaselineapple,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.036, // 3.6% of the screen height
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.06, // 6% of the screen width
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.02, // 2% of the screen width
                                                            top: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.008, // 0.8% of the screen height
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.004, // 0.4% of the screen height
                                                          ),
                                                          child: Text(
                                                            "msg_continue_with_apple"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtAller14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      print("on tap log in");
                                                      onTapGoogleSignIn();
                                                    },
                                                    child: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.13, // 13% of the screen width
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.015, // 1.5% of the screen height
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.13,
                                                                0 // 13% of the screen width
                                                                ),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.09, // 9% of the screen width
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02, // 2% of the screen height
                                                          0,
                                                          // MediaQuery.of(context)
                                                          //         .size
                                                          //         .width *
                                                          //     0.1, // 10% of the screen width
                                                          MediaQuery.of(context)
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
                                                                  width:
                                                                      getSize(
                                                                          20)),
                                                              Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.02, // 2% of the screen width
                                                                    top: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.008, // 0.8% of the screen height
                                                                    // right: MediaQuery.of(context)
                                                                    //         .size
                                                                    //         .width *
                                                                    //     0.02, // 2% of the screen width
                                                                    bottom: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.004, // 0.4% of the screen height
                                                                  ),
                                                                  child: Text(
                                                                      "msg_continue_with_google"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtAller14))
                                                            ])),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 33),
                                                      child: Text("lbl_or".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtAller13
                                                              .copyWith(
                                                                  letterSpacing:
                                                                      getHorizontalSize(
                                                                          0.25)))),
                                                  CustomButton(
                                                      height:
                                                          getVerticalSize(52),
                                                      width: getHorizontalSize(
                                                          240),
                                                      text:
                                                          "msg_sign_up_with_email"
                                                              .tr,
                                                      margin:
                                                          getMargin(top: 34),
                                                      onTap: () {
                                                        onTapSigninwith();
                                                      }),
                                                  GestureDetector(
                                                    child: Padding(
                                                        padding:
                                                            getPadding(top: 36),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text: "msg_already_have_an2"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant
                                                                              .gray700,
                                                                          fontSize: getFontSize(
                                                                              14),
                                                                          fontFamily:
                                                                              'Aller',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          letterSpacing:
                                                                              getHorizontalSize(0.25))),
                                                                  TextSpan(
                                                                      text: "lbl_sign_in"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant
                                                                              .gray900,
                                                                          fontSize: getFontSize(
                                                                              14),
                                                                          fontFamily:
                                                                              'Aller',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          letterSpacing: getHorizontalSize(
                                                                              0.25),
                                                                          decoration:
                                                                              TextDecoration.underline))
                                                                ]),
                                                            textAlign: TextAlign
                                                                .left)),
                                                    onTap: () {
                                                      onTapSignIn();
                                                    },
                                                  ),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          302),
                                                      margin: getMargin(
                                                          left: 20,
                                                          top: 59,
                                                          right: 19,
                                                          bottom: 8),
                                                      child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "msg_by_creating_an_account2"
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray500,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                                TextSpan(
                                                                    text:
                                                                        "msg_terms_of_service"
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        decoration:
                                                                            TextDecoration.underline)),
                                                                TextSpan(
                                                                    text: " ",
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                                TextSpan(
                                                                    text:
                                                                        "lbl_and"
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray500,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                                TextSpan(
                                                                    text:
                                                                        "lbl_cookie_policy"
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        decoration:
                                                                            TextDecoration.underline)),
                                                                TextSpan(
                                                                    text:
                                                                        "msg_i_understand_that"
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        color: ColorConstant
                                                                            .gray500,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                12),
                                                                        fontFamily:
                                                                            'Work Sans',
                                                                        fontWeight:
                                                                            FontWeight.w400))
                                                              ]),
                                                          textAlign:
                                                              TextAlign.center))
                                                ])))
                                  ]))
                        ]))))
        //)
        ;
  }

  onTapImgClose() {
    Get.toNamed(AppRoutes.votingScreenPage)
        ?.then((value) => Get.delete<VotingScreenController>());
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

  onTapSigninwith() {
    Get.toNamed(
      AppRoutes.createAccountScreen,
    );
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
