import 'package:country_code_picker/country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../core/utils/validation_functions.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/enter_mobile_number_one_controller.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EnterMobileNumberOneScreen
    extends GetWidget<EnterMobileNumberOneController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: [Locale('en', 'US')],
        localizationsDelegates: [CountryLocalizations.delegate],
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
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
                            child:
                                // SingleChildScrollView(
                                //     child:
                                Column(
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
                                                    height:
                                                        getVerticalSize(771),
                                                    width:
                                                        getHorizontalSize(371),
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
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgClose,
                                                              height:
                                                                  getSize(24),
                                                              width:
                                                                  getSize(24),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              margin: getMargin(
                                                                  top: 8),
                                                              onTap: () {
                                                                onTapImgClose();
                                                              }),
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 45,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "msg_enter_mobile_number"
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
                                                                              getHorizontalSize(0.25)))),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      256),
                                                              margin: getMargin(
                                                                  left: 42,
                                                                  top: 13,
                                                                  right: 44,
                                                                  bottom: 20),
                                                              child: Text(
                                                                  "msg_create_an_account"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtAller14)),
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    ColorConstant
                                                                        .gray100),
                                                            child:
                                                                CountryCodePicker(
                                                              initialSelection:
                                                                  'AE',
                                                              showCountryOnly:
                                                                  false,
                                                              showOnlyCountryWhenClosed:
                                                                  false,
                                                              favorite: [
                                                                '+971',
                                                                'UAE'
                                                              ],
                                                              enabled: true,
                                                              hideMainText:
                                                                  false,
                                                              showFlagMain:
                                                                  true,
                                                              showFlag: true,
                                                              hideSearch: false,
                                                              showFlagDialog:
                                                                  true,
                                                              alignLeft: true,
                                                            ),

                                                            // CountryCodePicker(
                                                            //   onChanged:
                                                            //       (country) {
                                                            //     //dialCodeDigits = country.dialCode!;
                                                            //   },
                                                            //   initialSelection:
                                                            //       'دولة الإمارات العربية المتحدة',
                                                            //   showCountryOnly:
                                                            //       true,
                                                            //   showOnlyCountryWhenClosed:
                                                            //       true,
                                                            //   favorite: [
                                                            //     '+971',
                                                            //     'UAE',
                                                            //     '+966',
                                                            //     'KSA'
                                                            //   ],
                                                            //   //padding: EdgeInsets.symmetric(horizontal: ),
                                                            //   textStyle: TextStyle(
                                                            //       color: Color(
                                                            //           0xff000000),
                                                            //       fontSize:
                                                            //           14,
                                                            //       wordSpacing:
                                                            //           5),
                                                            //   enabled:
                                                            //       true,
                                                            //   hideMainText:
                                                            //       false,
                                                            //   showFlagMain:
                                                            //       true,
                                                            //   showFlag:
                                                            //       true,
                                                            //   hideSearch:
                                                            //       false,
                                                            //   showFlagDialog:
                                                            //       true,
                                                            //   alignLeft:
                                                            //       true,
                                                            //   padding: EdgeInsets.symmetric(
                                                            //       horizontal:
                                                            //           12),
                                                            // ),
                                                          ),
                                                          // Container(
                                                          //   decoration: AppDecoration
                                                          //       .outlineBlack90099
                                                          //       .copyWith(
                                                          //           borderRadius:
                                                          //               BorderRadiusStyle
                                                          //                   .roundedBorder20),
                                                          //   child:
                                                          //       CountryCodePicker(
                                                          //     initialSelection:
                                                          //         'دولة الإمارات العربية المتحدة',
                                                          //     showCountryOnly:
                                                          //         false,
                                                          //     showOnlyCountryWhenClosed:
                                                          //         false,
                                                          //     favorite: [
                                                          //       '+971',
                                                          //       'UAE'
                                                          //     ],
                                                          //     enabled: true,
                                                          //     hideMainText: false,
                                                          //     showFlagMain: true,
                                                          //     showFlag: true,
                                                          //     hideSearch: false,
                                                          //     showFlagDialog: true,
                                                          //     alignLeft: true,
                                                          //   ),
                                                          // ),
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
                                                          //         "lbl_india_91".tr,
                                                          //     margin: getMargin(
                                                          //         top: 16),
                                                          //     items: controller
                                                          //         .enterMobileNumberOneModelObj
                                                          //         .value
                                                          //         .dropdownItemList
                                                          //         .value,
                                                          //     onChanged: (value) {
                                                          //       controller
                                                          //           .onSelected(
                                                          //               value);
                                                          //     }),
                                                          CustomTextFormField(
                                                              focusNode:
                                                                  FocusNode(),
                                                              controller: controller
                                                                  .phonenumberController,
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
                                                              validator:
                                                                  (value) {
                                                                if (!isValidPhone(
                                                                    value)) {
                                                                  return "Please enter valid phone number";
                                                                }
                                                                return null;
                                                              }),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      350),
                                                              margin: getMargin(
                                                                left: 3,
                                                                top: 13,
                                                              ),
                                                              child: Text(
                                                                  "msg_we_call_or_text"
                                                                      .tr,
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPoppinsRegular11)),
                                                          SizedBox(
                                                            height: 230,
                                                          ),
                                                          CustomButton(
                                                              height:
                                                                  getVerticalSize(
                                                                      52),
                                                              text:
                                                                  "lbl_continue"
                                                                      .tr,
                                                              margin: getMargin(
                                                                  bottom: 31),
                                                              onTap: () {
                                                                onTapContinue();
                                                              })
                                                        ])))
                                          ]))
                                ])))))));
  }

  onTapImgClose() {
    Get.back();
  }

  onTapContinue() async {
    (controller.phonenumberController.text.isEmpty)
        ? Fluttertoast.showToast(
            msg: "Please enter valid mobile Number",
            backgroundColor: ColorConstant.gray100,
          )
        : await controller.saveMobileNumber(
            mobileNumber: controller.phonenumberController.text);

    // Get.toNamed(
    //   AppRoutes.enterOtpScreen,
    // );
  }
}
