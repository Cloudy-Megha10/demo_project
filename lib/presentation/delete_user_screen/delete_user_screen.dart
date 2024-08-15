import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import 'controller/delete_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/custom_button.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';

class DeleteUserScreen extends GetWidget<DeleteUserController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 40, top: 35, right: 40, bottom: 35),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("msg_delete_the_user".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtAllerBold16),
                      Padding(
                          padding: getPadding(top: 10),
                          child: Text("msg_are_you_sure_to".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtAller14)),
                      GestureDetector(
                          onTap: () {
                            onTapRowdeleteuserye();
                          },
                          child: Padding(
                              padding: getPadding(top: 29, right: 6, bottom: 4),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextFormField(
                                        width: getHorizontalSize(157),
                                        focusNode: FocusNode(),
                                        controller:
                                            controller.deleteuseryesController,
                                        hintText: "msg_yes_delete_the".tr,
                                        variant:
                                            TextFormFieldVariant.OutlineGray900,
                                        shape:
                                            TextFormFieldShape.RoundedBorder20,
                                        fontStyle: TextFormFieldFontStyle
                                            .Aller14Gray900,
                                        textInputAction: TextInputAction.done),
                                    CustomButton(
                                        height: getVerticalSize(54),
                                        width: getHorizontalSize(139),
                                        text: "lbl_cancel".tr,
                                        variant: ButtonVariant.FillGray90002,
                                        padding: ButtonPadding.PaddingAll18)
                                  ])))
                    ]))));
  }

  onTapRowdeleteuserye() {
    Get.toNamed(
      AppRoutes.userManagementScreen,
    );
  }
}
