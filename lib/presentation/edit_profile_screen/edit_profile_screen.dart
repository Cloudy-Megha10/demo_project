import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/validation_functions.dart';
import 'package:demo_project/widgets/app_bar/appbar_image.dart';
import 'package:demo_project/widgets/app_bar/appbar_title.dart';
import 'package:demo_project/widgets/app_bar/appbar_title.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends GetWidget<EditProfileController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorConstant.whiteA700,
            // appBar: CustomAppBar(
            //     height: getVerticalSize(76),
            //     leadingWidth: 48,
            //     leading: AppbarImage(
            //         height: getSize(24),
            //         width: getSize(24),
            //         svgPath: ImageConstant.imgArrowleftGray900,
            //         margin: getMargin(left: 24, top: 26, bottom: 25),
            //         onTap: () {
            //           onTapArrowleft3();
            //         }),
            //     title: AppbarTitle(
            //         text: "lbl_edit_profile2".tr, margin: getMargin(left: 16)),
            //     actions: [
            //       GestureDetector(
            //         child: Container(
            //             child: Text(
            //               "lbl_save".tr,
            //               style: TextStyle(
            //                   color: ColorConstant.black900,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             margin: getMargin(
            //                 left: 24, top: 28, right: 24, bottom: 28)),
            //         onTap: () {
            //           print("update");
            //           onTapUpdate();
            //         },
            //       )
            //     ],
            //     styleType: Style.bgFillWhiteA700_1),
            body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(left: 24, right: 24),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 0,
                                  margin: EdgeInsets.all(0),
                                  color: ColorConstant.black900,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder50),
                                  child: Container(
                                      height: getSize(100),
                                      width: getSize(100),
                                      decoration: AppDecoration.fillBlack900
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder50),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgImage12100x100,
                                                height: getSize(100),
                                                width: getSize(100),
                                                radius: BorderRadius.circular(
                                                    getHorizontalSize(50)),
                                                alignment: Alignment.center),
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgUserWhiteA700,
                                                height: getSize(24),
                                                width: getSize(24),
                                                alignment: Alignment.center)
                                          ]))),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.firstNameController,
                                  hintText: "lbl_first_name".tr,
                                  labelText: "lbl_first_name".tr,
                                  margin: getMargin(top: 40)),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.lastNameController,
                                  hintText: "lbl_last_name".tr,
                                  labelText: "lbl_last_name".tr,
                                  margin: getMargin(top: 16)),
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
                                      return "Please enter valid email";
                                    }
                                    return null;
                                  }),
                              CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: controller.cityController,
                                  hintText: "city".tr,
                                  labelText: "city".tr,
                                  margin: getMargin(top: 16),
                                  textInputAction: TextInputAction.done),
                              Container(
                                  width: double.maxFinite,
                                  child: Container(
                                      margin: getMargin(top: 16),
                                      padding: getPadding(
                                          top: 17, right: 16, bottom: 17),
                                      decoration: AppDecoration.fillGray100
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder16),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                controller:
                                                    controller.msgBioController,
                                                hintText: "bio".tr,
                                                labelText: "bio".tr,
                                                margin: getMargin(top: 16),
                                                textInputAction:
                                                    TextInputAction.done),
                                          ]))),
                            ]))))));
  }

  onTapArrowleft3() {
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
