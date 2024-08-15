import 'package:kainok_app/presentation/edit_user_profile_screen/widgets/edit_user_profile_search_city.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/validation_functions.dart';
import 'package:kainok_app/widgets/app_bar/appbar_image.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kainok_app/widgets/custom_text_form_field.dart';

import '../../widgets/custom_search_view.dart';
import 'controller/edit_user_profile_controller.dart';

// ignore_for_file: must_be_immutable
class EditUserProfileScreen extends GetWidget<EditUserProfileController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          child: SearchBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onTapImgClose();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorConstant.whiteA700,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                                color: ColorConstant.whiteA70090,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(16)),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: getMargin(top: 30),
                                padding: getPadding(all: 24),
                                height: getVerticalSize(771),
                                decoration:
                                    AppDecoration.fillWhiteA700.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgClose,
                                      height: getSize(24),
                                      width: getSize(24),
                                      alignment: Alignment.centerLeft,
                                      onTap: () {
                                        onTapImgClose();
                                      },
                                    ),
                                    Text(
                                      "lbl_edit_profile2".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtAllerBold23,
                                    ),
                                    SizedBox(height: 10),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      controller:
                                          controller.firstNameController,
                                      hintText: "lbl_first_name".tr,
                                      labelText: "lbl_first_name".tr,
                                      margin: getMargin(top: 40),
                                    ),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      controller: controller.lastNameController,
                                      hintText: "lbl_last_name".tr,
                                      labelText: "lbl_last_name".tr,
                                      margin: getMargin(top: 16),
                                    ),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      controller: controller.emailController,
                                      hintText: "lbl_email".tr,
                                      labelText: "lbl_email".tr,
                                      margin: getMargin(top: 16),
                                      textInputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidEmail(value,
                                                isRequired: true))) {
                                          return "Please enter a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        controller: controller.cityController,
                                        onTap: () {
                                          _showSearchBottomSheet(context);
                                        },
                                        hintText: "lbl_city".tr,
                                        labelText: "lbl_city".tr,
                                        margin: getMargin(top: 16)),
                                    // CustomSearchView(
                                    //     focusNode: FocusNode(),
                                    //     controller: controller.cityController,
                                    //     hintText: "city".tr,
                                    //     //labelText: "city".tr,
                                    //     margin: getMargin(top: 16),
                                    //     //textInputAction: TextInputAction.done,
                                    //     onChanged: (value) {
                                    //       if (value.isNotEmpty) {
                                    //         controller.onChange();
                                    //       } else {}
                                    //     }),
                                    // Obx(() => SingleChildScrollView(
                                    //       child: Column(
                                    //         children: [
                                    //           Card(
                                    //               elevation: 8,
                                    //               child: Container(
                                    //                   height: 100,
                                    //                   width: double.infinity,
                                    //                   decoration: BoxDecoration(
                                    //                     color: Colors.white,
                                    //                     borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(30),
                                    //                   ),
                                    //                   child: Padding(
                                    //                       padding: getPadding(
                                    //                           left: 23,
                                    //                           top: 10,
                                    //                           right: 23),
                                    //                       child: ListView
                                    //                           .separated(
                                    //                               shrinkWrap:
                                    //                                   true,
                                    //                               itemCount:
                                    //                                   controller
                                    //                                       .locationList
                                    //                                       .length,
                                    //                               separatorBuilder:
                                    //                                   (_, __) =>
                                    //                                       const Divider(),
                                    //                               itemBuilder:
                                    //                                   (context,
                                    //                                       int index) {
                                    //                                 return ListTile(
                                    //                                   title: Text(
                                    //                                       controller.locationList[
                                    //                                           index],
                                    //                                       overflow: TextOverflow
                                    //                                           .ellipsis,
                                    //                                       textAlign: TextAlign
                                    //                                           .left,
                                    //                                       style: AppStyle.txtPoppinsRegular11Black9008e.copyWith(
                                    //                                           letterSpacing: 0.25,
                                    //                                           height: 1.29)),
                                    //                                   onTap:
                                    //                                       () {
                                    //                                     controller.selectedValue(controller
                                    //                                         .locationList[index]
                                    //                                         .toString());
                                    //                                   },
                                    //                                 );
                                    //                               }))))
                                    //         ],
                                    //       ),
                                    //     )),
                                    CustomTextFormField(
                                      focusNode: FocusNode(),
                                      controller: controller.msgBioController,
                                      hintText: "bio".tr,
                                      labelText: "bio".tr,
                                      margin: getMargin(top: 16),
                                      textInputAction: TextInputAction.done,
                                    ),
                                    SizedBox(height: 40),
                                    CustomButton(
                                      height: getVerticalSize(56),
                                      text: "lbl_save".tr,
                                      margin: getMargin(
                                          left: 24, right: 24, bottom: 24),
                                      variant: ButtonVariant.FillGray90002,
                                      padding: ButtonPadding.PaddingAll19,
                                      fontStyle: ButtonFontStyle.AllerBold14,
                                      onTap: () {
                                        onTapUpdate();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapImgClose() {
    Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen);
  }

  onTapClose() {
    Get.back();
  }

  onTapUpdate() {
    controller.profileUpdateApi(
        firstName: controller.firstNameController.text,
        lastName: controller.lastNameController.text,
        emailId: controller.emailController.text,
        city: controller.cityController.text,
        bio: controller.msgBioController.text);
  }
}
