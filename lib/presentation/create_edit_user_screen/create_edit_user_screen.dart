import 'package:kainok_app/presentation/create_edit_user_screen/widgets/search_city_bottomModalSheet.dart';
import 'package:kainok_app/widgets/custom_check_box.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../user_management_screen/controller/user_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/validation_functions.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kainok_app/widgets/custom_drop_down.dart';
import 'package:kainok_app/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class CreateEditUserScreen extends GetView<UserManagementController> {
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
    print("firstName");
    print(controller.firstNameController.text);
    return WillPopScope(
        onWillPop: () async {
          controller.clearData();
          Get.toNamed(
            AppRoutes.userManagementScreen,
          );
          return false;
        },
        child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
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
                //         text: "msg_create_edit_user".tr,
                //         margin: getMargin(left: 16)),
                //     styleType: Style.bgFillWhiteA700_1),
                body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: getPadding(
                                left: 24, right: 24, bottom: 5, top: 5),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                      child: Container(
                                          width: getHorizontalSize(342),
                                          child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SingleChildScrollView(
                                                    child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CustomTextFormField(
                                                                focusNode:
                                                                    FocusNode(),
                                                                controller:
                                                                    controller
                                                                        .firstNameController,
                                                                hintText:
                                                                    "lbl_first_name"
                                                                        .tr,
                                                                labelText:
                                                                    "lbl_first_name"
                                                                        .tr,
                                                              ),
                                                              CustomTextFormField(
                                                                focusNode:
                                                                    FocusNode(),
                                                                controller:
                                                                    controller
                                                                        .lastNameController,
                                                                hintText:
                                                                    "lbl_last_name"
                                                                        .tr,
                                                                margin:
                                                                    getMargin(
                                                                        top:
                                                                            16),
                                                                labelText:
                                                                    "lbl_last_name"
                                                                        .tr,
                                                              ),
                                                              CustomTextFormField(
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .emailController,
                                                                  hintText:
                                                                      "lbl_email"
                                                                          .tr,
                                                                  labelText:
                                                                      "lbl_email"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              16),
                                                                  textInputType:
                                                                      TextInputType
                                                                          .emailAddress,
                                                                  validator:
                                                                      (value) {
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
                                                              CustomTextFormField(
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .mobileNumberController,
                                                                  hintText:
                                                                      "lbl_mobile_number"
                                                                          .tr,
                                                                  labelText:
                                                                      "lbl_mobile_number"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              16)),
                                                              CustomTextFormField(
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .cityController,
                                                                  onTap: () {
                                                                    _showSearchBottomSheet(
                                                                        context);
                                                                  },
                                                                  hintText:
                                                                      "lbl_city"
                                                                          .tr,
                                                                  labelText:
                                                                      "lbl_city"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              16)),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Obx(
                                                                () =>
                                                                    CustomDropDown(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50,
                                                                  value: controller
                                                                      .userManagementModelObj
                                                                      .userType
                                                                      .value
                                                                      .firstWhere((option) =>
                                                                          option
                                                                              .id ==
                                                                          controller
                                                                              .userTypeId
                                                                              .value),
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  icon:
                                                                      Container(
                                                                    margin:
                                                                        getMargin(
                                                                      left: 30,
                                                                      right: 16,
                                                                    ),
                                                                    child:
                                                                        CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgIconsArrowdropdown,
                                                                    ),
                                                                  ),
                                                                  labelText:
                                                                      "User Type"
                                                                          .tr,
                                                                  hintText:
                                                                      "User Type",
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  items: controller
                                                                      .userManagementModelObj
                                                                      .userType
                                                                      .value,
                                                                  onChanged:
                                                                      (value) {
                                                                    print(
                                                                        "value");
                                                                    controller
                                                                            .selectedId
                                                                            .value =
                                                                        value.id
                                                                            .toString();
                                                                    controller.userTypeDetailsByIdGetApi(controller
                                                                        .selectedId
                                                                        .value);
                                                                    print(controller
                                                                        .selectedId
                                                                        .value);
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              16),
                                                                  child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                            child: Padding(
                                                                                padding: getPadding(right: 8),
                                                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                  Obx(() => Padding(
                                                                                        padding: getPadding(left: 4),
                                                                                        child: Container(
                                                                                          width: 150,
                                                                                          height: 40,
                                                                                          decoration: BoxDecoration(
                                                                                            border: Border.all(
                                                                                              color: Colors.grey,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          child: Center(
                                                                                            // Center the text both horizontally and vertically inside the Container
                                                                                            child: Text(
                                                                                              controller.likedController.value,
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              textAlign: TextAlign.center,
                                                                                              style: AppStyle.txtAllerBold14,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )),
                                                                                  Padding(
                                                                                      padding: getPadding(top: 8),
                                                                                      child: Row(children: [
                                                                                        CustomImageView(svgPath: ImageConstant.imgInfoGray500, height: getSize(24), width: getSize(24)),
                                                                                        Padding(padding: getPadding(left: 4, top: 5, bottom: 3), child: Text("msg_swipe_right_to_vote2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtCaption))
                                                                                      ]))
                                                                                ]))),
                                                                        Expanded(
                                                                            child: Padding(
                                                                                padding: getPadding(left: 8),
                                                                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                  Obx(() => Container(
                                                                                      width: 150,
                                                                                      height: 40,
                                                                                      decoration: BoxDecoration(
                                                                                        border: Border.all(
                                                                                          color: Colors.grey,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Center(
                                                                                        // Center the text both horizontally and vertically inside the Container
                                                                                        child: Text(
                                                                                          controller.disLikedController.value,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: AppStyle.txtAllerBold14,
                                                                                        ),
                                                                                      ))),
                                                                                  Padding(
                                                                                      padding: getPadding(top: 8),
                                                                                      child: Row(children: [
                                                                                        CustomImageView(svgPath: ImageConstant.imgInfoGray500, height: getSize(24), width: getSize(24)),
                                                                                        Padding(padding: getPadding(left: 4, top: 5, bottom: 3), child: Text("Swipe Left to devote".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtCaption))
                                                                                      ]))
                                                                                ])))
                                                                      ])),
                                                              CustomTextFormField(
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      controller
                                                                          .descriptionController,
                                                                  hintText:
                                                                      "lbl_add_bio"
                                                                          .tr,
                                                                  labelText:
                                                                      "lbl_add_bio"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                          top:
                                                                              16),
                                                                  padding:
                                                                      TextFormFieldPadding
                                                                          .PaddingT31,
                                                                  textInputAction:
                                                                      TextInputAction
                                                                          .done,
                                                                  maxLines: 4),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      GetBuilder<
                                                                              UserManagementController>(
                                                                          builder: (controller) =>
                                                                              Obx(
                                                                                () => CustomCheckbox(
                                                                                  iconSize: 20,
                                                                                  value: controller.isActive.value,
                                                                                  onChange: (value) {
                                                                                    controller.isActive.value = value;
                                                                                    controller.update();
                                                                                  },
                                                                                ),
                                                                              )),
                                                                      SizedBox(
                                                                          child:
                                                                              Text("lbl_is_active".tr))
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              CustomButton(
                                                                height:
                                                                    getVerticalSize(
                                                                        56),
                                                                text: "lbl_save"
                                                                    .tr,
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            24,
                                                                        right:
                                                                            24,
                                                                        bottom:
                                                                            24),
                                                                variant:
                                                                    ButtonVariant
                                                                        .FillGray90002,
                                                                padding:
                                                                    ButtonPadding
                                                                        .PaddingAll19,
                                                                fontStyle:
                                                                    ButtonFontStyle
                                                                        .AllerBold14,
                                                                onTap: () {
                                                                  onTapCreateOrEditUser();
                                                                },
                                                              ),
                                                            ])))
                                              ])))
                                ])))))));
  }

  onTapCreateOrEditUser() {
    if (controller.selectedUserId.value.isEmpty) {
      onTapCreateUser();
    } else {
      onTapUpdate();
    }
  }

  onTapCreateUser() async {
    await controller.createUserPost(
      firstName: controller.firstNameController.text,
      city: controller.cityController.text,
      description: controller.descriptionController.text,
      disLikedPoints: controller.disLikedController.value,
      email: controller.emailController.text,
      lastName: controller.lastNameController.text,
      likedPoints: controller.likedController.value,
      mobileNumber: controller.mobileNumberController.text,
      password: controller.passwordController.text,
      userTypeId: controller.selectedId.value,
    );
  }

  onTapUpdate() {
    print("updateUsersss");
    controller.profileUpdateApi(
        firstName: controller.firstNameController.text,
        lastName: controller.lastNameController.text,
        emailId: controller.emailController.text,
        mobileNumber: controller.mobileNumberController.text,
        userTypeId: controller.userTypeId.value.toString(),
        userId: controller.selectedUserId.value,
        city: controller.cityController.text,
        bio: controller.descriptionController.text,
        isActive: controller.isActive.value);
  }

  onTapArrowleft3() {
    print("back");
    controller.clearData();
    Get.toNamed(
      AppRoutes.userManagementScreen,
    );
  }
}
