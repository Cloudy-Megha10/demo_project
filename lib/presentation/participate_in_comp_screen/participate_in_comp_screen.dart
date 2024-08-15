import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/controller/image_listing_controller.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/participate_in_comp_screen/controller/participate_in_comp_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import 'package:kainok_app/theme/app_style.dart';
import 'package:kainok_app/widgets/custom_bottom_bar.dart';
import 'package:kainok_app/widgets/custom_button.dart';
import 'package:kainok_app/widgets/custom_icon_button.dart';
import 'package:kainok_app/widgets/custom_radio_button.dart';
import 'package:kainok_app/widgets/custom_text_form_field.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/custom_image_view.dart';
import '../category_listing_screen/controller/category_listing_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/app_bar/appbar_image.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';

class ParticipateInCompetitionScreen
    extends GetView<ParticipateInCompetitionController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxString gender = "Male".obs;
  RxBool onPressed = false.obs;

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print("argsFromPartici");
    print(data);
    String competitionId = data['competitionId'];

    String competitionName = data['competitionTitle'];
    bool isCompImageListingScreen = data["isCompImageListingScreen"];
    dynamic categoryId = data['categoryId'];
    controller.compName.text = competitionName.toString();

    Future<void> _refreshPage() async {
      controller.getMyImagesForComp(competitionId, competitionName);
    }

    return WillPopScope(
        onWillPop: () async {
          // Handle back button press here
          return false; // Return false to prevent default back button behavior
        },
        child: Obx(() => SafeArea(
                child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorConstant.whiteA70001,
              // appBar: CustomAppBar(
              //     height: getVerticalSize(76),
              //     title: AppbarTitle(
              //         text: "msg_upload_your_entry".tr,
              //         margin: getMargin(left: 64)),
              //     actions: [
              //       GestureDetector(
              //         child: CustomImageView(
              //             height: getSize(24),
              //             width: getSize(24),
              //             svgPath: ImageConstant.imgCloseGray500,
              //             margin: getMargin(
              //                 left: 32, top: 28, right: 32, bottom: 23)),
              //         onTap: () {
              //           onTapClose();
              //         },
              //       )
              //     ],
              //     styleType: Style.bgFillWhiteA700_1),
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 23, top: 14, right: 23, bottom: 14),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.compName,
                              hintText: "msg_title_of_the_entry".tr,
                              labelText: "Competition",
                              readOnly: true,
                            ),
                            CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.entrytitleController,
                              hintText: "msg_title_of_the_entry".tr,
                              labelText: "Title",
                              margin: getMargin(top: 16),
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(50),
                                FilteringTextInputFormatter.allow(
                                    RegExp("[a-zA-Z0-9 -]"))
                              ],
                            ),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller:
                                    controller.entrydescriptioController,
                                hintText: "msg_your_description".tr,
                                labelText: "Description",
                                margin: getMargin(top: 16),
                                padding: TextFormFieldPadding.PaddingT31,
                                textInputAction: TextInputAction.done,
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(150),
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z0-9 -]"))
                                ],
                                maxLines: 4),
                            Container(
                                width: double.maxFinite,
                                child: Container(
                                    margin: getMargin(top: 16),
                                    padding: getPadding(
                                        left: 20,
                                        top: 43,
                                        right: 20,
                                        bottom: 43),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder16),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("lbl_upload_file".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAllerBold16),
                                          Padding(
                                              padding: getPadding(top: 5),
                                              child: Text(
                                                  "msg_browse_and_choose".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtAller14)),
                                          (controller.selectedImage.value ==
                                                  false)
                                              ? GestureDetector(
                                                  child: CustomIconButton(
                                                      height: 56,
                                                      width: 56,
                                                      margin: getMargin(top: 8),
                                                      //variant: IconButtonVariant.OutlineGray400,
                                                      shape: IconButtonShape
                                                          .CircleBorder28,
                                                      padding: IconButtonPadding
                                                          .PaddingAll16,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgUpload)),
                                                  onTap: () {
                                                    onTapDocumentUpload();
                                                  },
                                                )
                                              : Obx(() => Container(
                                                    child: Column(children: [
                                                      Image.file(
                                                        File(controller
                                                            .imagePath.value),
                                                        width: 200,
                                                        height: 200,
                                                      ),
                                                      GestureDetector(
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgEdit,
                                                                  height:
                                                                      getSize(
                                                                          24),
                                                                  width:
                                                                      getSize(
                                                                          24)),
                                                              Text(
                                                                "Edit Image".tr,
                                                                style: TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    fontFamily:
                                                                        'Aller',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ]),
                                                        onTap: () {
                                                          onTapDocumentUpload();
                                                        },
                                                      )
                                                    ]),
                                                  )),
                                          Padding(
                                              padding: getPadding(
                                                  top: 19, bottom: 6),
                                              child: Text(
                                                  "msg_supported_formats".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtCaptionGray600)),
                                        ]))),
                            Padding(
                                padding: getPadding(top: 16),
                                child: Text("msg_licensed_content".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAllerBold16)),
                            Padding(
                                padding: getPadding(top: 10, bottom: 10),
                                child: Text("msg_declare_any_stock".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtAller14)),
                            Obx(
                              () => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomRadioWidget(
                                        value: "0",
                                        groupValue: gender.value,
                                        onChanged: (String value) {
                                          gender.value = value;
                                        },
                                      ),
                                      Padding(
                                          padding:
                                              getPadding(top: 10, bottom: 10),
                                          child: Text(
                                              "msg_this_entry_is_entirely".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAller14)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomRadioWidget(
                                        value: "1",
                                        groupValue: gender.value,
                                        onChanged: (String value) {
                                          gender.value = value;
                                        },
                                      ),
                                      Padding(
                                          padding:
                                              getPadding(top: 10, bottom: 10),
                                          child: Text(
                                              "msg_this_entry_contains".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAller14)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Obx(
                              () => Container(
                                margin: getMargin(left: 15),
                                padding: EdgeInsets.all(10),
                                width: 300,
                                height: 70,
                                child: ElevatedButton(
                                    child: controller.isLoading.value
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "lbl_upload".tr,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: ColorConstant.whiteA700,
                                              fontFamily: 'Aller',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorConstant.gray90004,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.black45, width: 1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    onPressed: () async {
                                      onTapAddImagesToParticularCompetition(
                                          isCompImageListingScreen,
                                          competitionId,
                                          categoryId);
                                      controller.isLoading.value = true;
                                    }),
                              ),
                            ),
                          ])),
                ),
              ),
            ))));
  }

  onTapClose() {
    controller.clearData();
    Get.back();
  }

  onTapDocumentUpload() async {
    await controller.saveDocument();
  }

  onTapAddImagesToParticularCompetition(
      bool isCompImageListingScreen, String compId, dynamic categoryId) {
    if (controller.file == null ||
        controller.entrytitleController.text.isEmpty ||
        controller.entrydescriptioController.text.isEmpty) {
      Future.delayed(Duration(seconds: 1), () {
        controller.isLoading.value = false;
      });

      Fluttertoast.showToast(
        msg: "Kindly fill the necessary details",
        backgroundColor: Colors.grey,
      );
    } else {
      isCompImageListingScreen
          ? controller.addImagesFromCompImageListingScreen(
              competitionId: compId,
              competitionTitle: controller.entrytitleController.text,
              competitionDescription: controller.entrydescriptioController.text,
              selectedFile: controller.file,
              categoryId: categoryId)
          : controller.addImagesPost(
              competitionId: compId,
              competitionTitle: controller.entrytitleController.text,
              competitionDescription: controller.entrydescriptioController.text,
              selectedFile: controller.file,
              categoryId: categoryId);
    }
  }
}
