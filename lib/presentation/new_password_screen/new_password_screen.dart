import 'package:fluttertoast/fluttertoast.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/validation_functions.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class NewPasswordScreen extends GetWidget<NewPasswordController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String emailIdOrMobile = data['emailIdOrMobile'].toString();
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA70001,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomAppBar(
                              height: getVerticalSize(76),
                              title: CustomButton(
                                width: getHorizontalSize(200),
                                text: "lbl_new_password".tr,
                                margin: getMargin(top: 60, bottom: 50),
                                variant: ButtonVariant.FillWhiteA700cc,
                                shape: ButtonShape.CircleBorder14,
                                padding: ButtonPadding.PaddingAll6,
                                fontStyle: ButtonFontStyle.AllerBold16,
                              ),
                              styleType: Style.bgFillWhiteA700_1),
                          Obx(() => CustomTextFormField(
                              // focusNode: FocusNode(),
                              controller: controller.newPasswordController,
                              hintText: "msg_enter_new_password".tr,
                              labelText: "New Password",
                              margin: getMargin(left: 24, top: 25, right: 23),
                              padding: TextFormFieldPadding.PaddingT17_2,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPasswordOne.value =
                                        !controller.isShowPasswordOne.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPasswordOne.value
                                                  ? ImageConstant.imgCut
                                                  : ImageConstant.imgCut))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText:
                                  controller.isShowPasswordOne.value)),
                          Obx(() => CustomTextFormField(
                              // focusNode: FocusNode(),
                              controller: controller.confirmpasswordController,
                              hintText: "msg_confirm_password".tr,
                              labelText: "Confirm Password",
                              margin: getMargin(left: 24, top: 24, right: 23),
                              padding: TextFormFieldPadding.PaddingT17_2,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPasswordTwo.value =
                                        !controller.isShowPasswordTwo.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 16,
                                          bottom: 14),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPasswordTwo.value
                                                  ? ImageConstant.imgCut
                                                  : ImageConstant.imgCut))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText:
                                  controller.isShowPasswordTwo.value)),
                          CustomButton(
                              height: getVerticalSize(54),
                              text: "lbl_submit".tr,
                              margin: getMargin(
                                  left: 24, top: 24, right: 23, bottom: 5),
                              variant: ButtonVariant.FillGray90002,
                              padding: ButtonPadding.PaddingAll18,
                              onTap: () {
                                onTapSubmitPassword(emailIdOrMobile);
                              })
                        ])))));
  }

  onTapSubmitPassword(String emailIdOrMobile) {
    (controller.newPasswordController.text ==
            controller.confirmpasswordController.text)
        ? onTapSubmit(controller.newPasswordController.text, emailIdOrMobile)
        : Fluttertoast.showToast(
            msg: "msg_same_password".tr,
            backgroundColor: ColorConstant.gray100,
          );
  }

  onTapSubmit(String newPassword, String emailIdOrMobile) {
    controller.newPasswordUpdateApi(newPassword, emailIdOrMobile);
    // Get.toNamed(
    //   AppRoutes.passwordUpdatedScreen,
    // );
  }
}
