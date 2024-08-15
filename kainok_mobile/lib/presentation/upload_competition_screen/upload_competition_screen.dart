import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kainok_app/core/utils/date_time_utils.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/flutter_secure_storage.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/app_bar/appbar_title.dart';
import 'package:kainok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:kainok_app/widgets/custom_button.dart';
import 'package:kainok_app/widgets/custom_icon_button.dart';
import 'package:kainok_app/widgets/custom_text_form_field.dart';

import '../voting_screen_page/controller/voting_screen_controller.dart';
import 'controller/upload_competition_controller.dart';

class UploadCompetitionScreen extends GetWidget<UploadCompetitionController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxString gender = "Male".obs;
  RxBool onPressed = false.obs;
  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        controller.clearData();
        Get.back();
        return false;
      },
      child: Obx(() => SafeArea(
          child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  backgroundColor: ColorConstant.whiteA700,
                  body: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                          child: Container(
                              width: double.maxFinite,
                              child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                    Container(
                                        height: getVerticalSize(796),
                                        width: double.maxFinite,
                                        decoration: AppDecoration.fillBlack900,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                      height:
                                                          getVerticalSize(771),
                                                      width: getHorizontalSize(
                                                          371),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .whiteA70090,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      16))))),
                                              SingleChildScrollView(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                      margin:
                                                          getMargin(top: 30),
                                                      padding:
                                                          getPadding(all: 24),
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
                                                                onTap: () {
                                                                  onTapImgClose();
                                                                }),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 9),
                                                                child: Text(
                                                                    "lbl_create_competition"
                                                                        .tr,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAllerBold23)),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            CustomTextFormField(
                                                              inputFormatters: [
                                                                new LengthLimitingTextInputFormatter(
                                                                    50),
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        "[a-zA-Z0-9 -]"))
                                                              ],
                                                              controller: controller
                                                                  .entrytitleController,
                                                              hintText:
                                                                  "msg_title_of_the_entry"
                                                                      .tr,
                                                              labelText:
                                                                  "Title",
                                                            ),
                                                            SizedBox(
                                                              height: 14,
                                                            ),
                                                            CustomDropDown(
                                                              width: double
                                                                  .infinity,
                                                              height: 50,
                                                              focusNode:
                                                                  FocusNode(),
                                                              icon: Container(
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
                                                                  "Category".tr,
                                                              hintText:
                                                                  "Category",
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              items: controller
                                                                  .uploadCategoryModelObj
                                                                  .categories
                                                                  .value,
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                        .selectedId
                                                                        .value =
                                                                    value.id
                                                                        .toString();
                                                              },
                                                            ),

                                                            // CustomTextFormField(
                                                            //   // focusNode: FocusNode(),
                                                            //   controller: controller.categoryController,
                                                            //   hintText: "msg_category_competition".tr,
                                                            //   labelText: "Category",
                                                            // ),
                                                            CustomTextFormField(
                                                              // focusNode: FocusNode(),
                                                              controller: controller
                                                                  .entrydescriptioController,
                                                              hintText:
                                                                  "msg_your_description"
                                                                      .tr,
                                                              margin: getMargin(
                                                                  top: 16),
                                                              padding:
                                                                  TextFormFieldPadding
                                                                      .PaddingT31,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              maxLines: 4,
                                                              labelText:
                                                                  "Description",
                                                              inputFormatters: [
                                                                new LengthLimitingTextInputFormatter(
                                                                    150),
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        "[a-zA-Z0-9 -]"))
                                                              ],
                                                            ),
                                                            Container(
                                                                width: double
                                                                    .maxFinite,
                                                                child:
                                                                    Container(
                                                                        margin: getMargin(
                                                                            top:
                                                                                16),
                                                                        padding: getPadding(
                                                                            left:
                                                                                20,
                                                                            top:
                                                                                43,
                                                                            right:
                                                                                20,
                                                                            bottom:
                                                                                43),
                                                                        decoration: AppDecoration.fillGray100.copyWith(
                                                                            borderRadius: BorderRadiusStyle
                                                                                .circleBorder16),
                                                                        child: Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                            children: [
                                                                              Text("lbl_upload_file".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtAllerBold16),
                                                                              Padding(padding: getPadding(top: 5), child: (controller.selectedImage.value == false) ? Text("msg_browse_and_choose".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtAller14) : Text("")),
                                                                              (controller.selectedImage.value == false)
                                                                                  ? GestureDetector(
                                                                                      child: CustomIconButton(
                                                                                          height: 56,
                                                                                          width: 56,
                                                                                          margin: getMargin(top: 8),
                                                                                          //variant: IconButtonVariant.OutlineGray400,
                                                                                          shape: IconButtonShape.CircleBorder28,
                                                                                          padding: IconButtonPadding.PaddingAll16,
                                                                                          child: CustomImageView(svgPath: ImageConstant.imgUpload)),
                                                                                      onTap: () {
                                                                                        onTapDocumentUpload();
                                                                                      },
                                                                                    )
                                                                                  : Obx(() => Container(
                                                                                        child: Column(children: [
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                            child: Hero(
                                                                                              tag: 'imageHero',
                                                                                              child: Image.file(
                                                                                                File(controller.imagePath.value),
                                                                                                width: 200,
                                                                                                height: 200,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          GestureDetector(
                                                                                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                                                              CustomImageView(svgPath: ImageConstant.imgEdit, height: getSize(24), width: getSize(24)),
                                                                                              Text(
                                                                                                "Edit Image".tr,
                                                                                                style: TextStyle(decoration: TextDecoration.underline, fontFamily: 'Aller', fontWeight: FontWeight.w400),
                                                                                                overflow: TextOverflow.ellipsis,
                                                                                                textAlign: TextAlign.left,
                                                                                              ),
                                                                                            ]),
                                                                                            onTap: () {
                                                                                              onTapDocumentUpload();
                                                                                            },
                                                                                          )
                                                                                        ]),
                                                                                      )),
                                                                              Padding(padding: getPadding(top: 19, bottom: 6), child: Text("msg_supported_formats".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtCaptionGray600))
                                                                            ]))),
                                                            SizedBox(
                                                              height: 14,
                                                            ),
                                                            Row(children: [
                                                              Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: getHorizontalSize(
                                                                          163),
                                                                      child:
                                                                          CustomDropDown(
                                                                        width: getHorizontalSize(
                                                                            163),
                                                                        height:
                                                                            50,
                                                                        focusNode:
                                                                            FocusNode(),
                                                                        icon:
                                                                            Container(
                                                                          margin:
                                                                              getMargin(
                                                                            left:
                                                                                30,
                                                                            right:
                                                                                5,
                                                                          ),
                                                                          child:
                                                                              CustomImageView(
                                                                            svgPath:
                                                                                ImageConstant.imgIconsArrowdropdown,
                                                                          ),
                                                                        ),
                                                                        labelText:
                                                                            "lbl_days_to_upload".tr,
                                                                        hintText:
                                                                            "lbl_days_to_upload".tr,
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        items: controller
                                                                            .uploadCategoryModelObj
                                                                            .compEndsIn
                                                                            .value,
                                                                        onChanged:
                                                                            (value) {
                                                                          controller
                                                                              .uploadCompEndsIn
                                                                              .value = value.id.toString();
                                                                        },
                                                                      ),
                                                                    )
                                                                  ]),
                                                              Padding(
                                                                padding:
                                                                    getPadding(
                                                                  left: 16,
                                                                ),
                                                                child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: getHorizontalSize(
                                                                            163),
                                                                        child:
                                                                            CustomDropDown(
                                                                          width:
                                                                              getHorizontalSize(163),
                                                                          height:
                                                                              50,
                                                                          focusNode:
                                                                              FocusNode(),
                                                                          icon:
                                                                              Container(
                                                                            margin:
                                                                                getMargin(
                                                                              left: 30,
                                                                              right: 5,
                                                                            ),
                                                                            child:
                                                                                CustomImageView(
                                                                              svgPath: ImageConstant.imgIconsArrowdropdown,
                                                                            ),
                                                                          ),
                                                                          labelText:
                                                                              "lbl_days_to_end".tr,
                                                                          hintText:
                                                                              "lbl_days_to_end".tr,
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          items: controller
                                                                              .uploadCategoryModelObj
                                                                              .compEndsIn
                                                                              .value,
                                                                          onChanged:
                                                                              (value) {
                                                                            controller.compEndsIn.value =
                                                                                value.id.toString();
                                                                          },
                                                                        ),
                                                                      )
                                                                    ]),
                                                              ),
                                                            ]),

                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: getHorizontalSize(
                                                                          163),
                                                                      child: TextField(
                                                                          readOnly: false,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                          controller: controller.priceController,
                                                                          textInputAction: TextInputAction.none,
                                                                          keyboardType: TextInputType.number,
                                                                          decoration: InputDecoration(
                                                                            labelStyle:
                                                                                TextStyle(
                                                                              color: ColorConstant.black900,
                                                                            ),
                                                                            labelText:
                                                                                "lbl_price".tr,
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              borderSide: BorderSide.none,
                                                                            ),
                                                                            fillColor:
                                                                                ColorConstant.gray100,
                                                                            filled:
                                                                                true,
                                                                            isDense:
                                                                                true,
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: 18.0,
                                                                              horizontal: 16.0,
                                                                            ),
                                                                          )),
                                                                    ),
                                                                    // GestureDetector(
                                                                    //   child: SizedBox(
                                                                    //       width: getHorizontalSize(163),
                                                                    //       child: TextField(
                                                                    //           enabled: false,
                                                                    //           style: TextStyle(
                                                                    //             fontSize: 12.0,
                                                                    //           ),
                                                                    //           controller: controller.dateTextController,
                                                                    //           textInputAction: TextInputAction.none,
                                                                    //           decoration: InputDecoration(
                                                                    //             labelStyle: TextStyle(
                                                                    //               color: ColorConstant.black900,
                                                                    //             ),
                                                                    //             labelText: "lbl_competition_end_date".tr,
                                                                    //             border: OutlineInputBorder(
                                                                    //               borderRadius: BorderRadius.circular(15.0),
                                                                    //               borderSide: BorderSide.none,
                                                                    //             ),
                                                                    //             fillColor: ColorConstant.gray100,
                                                                    //             filled: true,
                                                                    //             isDense: true,
                                                                    //             contentPadding: EdgeInsets.symmetric(
                                                                    //               vertical: 12.0,
                                                                    //               horizontal: 16.0,
                                                                    //             ),
                                                                    //           ))),
                                                                    //   onTap:
                                                                    //       () async {
                                                                    //     DateTime?
                                                                    //         pickedDate =
                                                                    //         await showDatePicker(
                                                                    //       context:
                                                                    //           context,
                                                                    //       initialDate:
                                                                    //           DateTime.now(),
                                                                    //       firstDate:
                                                                    //           DateTime(1950),
                                                                    //       lastDate:
                                                                    //           DateTime(2100),
                                                                    //     );

                                                                    //     if (pickedDate !=
                                                                    //         null) {
                                                                    //       controller
                                                                    //           .dateTextController
                                                                    //           .text = DateFormat('dd/MM/yyyy').format(pickedDate);
                                                                    //     }
                                                                    //   },
                                                                    // )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    left: 16,
                                                                  ),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SizedBox(
                                                                          width:
                                                                              getHorizontalSize(163),
                                                                          child: TextField(
                                                                              readOnly: false,
                                                                              style: TextStyle(
                                                                                fontSize: 12.0,
                                                                              ),
                                                                              controller: controller.minimumNoOFVotes,
                                                                              textInputAction: TextInputAction.none,
                                                                              keyboardType: TextInputType.number,
                                                                              decoration: InputDecoration(
                                                                                labelStyle: TextStyle(
                                                                                  color: ColorConstant.black900,
                                                                                ),
                                                                                labelText: "lbl_minimum_no_votes".tr,
                                                                                border: OutlineInputBorder(
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                  borderSide: BorderSide.none,
                                                                                ),
                                                                                fillColor: ColorConstant.gray100,
                                                                                filled: true,
                                                                                isDense: true,
                                                                                contentPadding: EdgeInsets.symmetric(
                                                                                  vertical: 18.0,
                                                                                  horizontal: 16.0,
                                                                                ),
                                                                              ))),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                                                    (controller.isAdmin ==
                                                                            "true")
                                                                        ? Padding(
                                                                            padding:
                                                                                getPadding(
                                                                              left: 10,
                                                                            ),
                                                                            child:
                                                                                Obx(
                                                                              () => CustomCheckbox(
                                                                                iconSize: 20,
                                                                                value: controller.selected.value,
                                                                                onChange: (value) {
                                                                                  controller.selected.value = value;
                                                                                },
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : Container(),
                                                                    (controller.isAdmin ==
                                                                            "true")
                                                                        ? SizedBox(
                                                                            child:
                                                                                Text("lbl_feature".tr))
                                                                        : Container(),
                                                                    // SizedBox(
                                                                    //     width: getHorizontalSize(
                                                                    //         163),
                                                                    //     child: TextField(
                                                                    //         readOnly: false,
                                                                    //         style: TextStyle(
                                                                    //           fontSize: 12.0,
                                                                    //         ),
                                                                    //         controller: controller.priceController,
                                                                    //         textInputAction: TextInputAction.none,
                                                                    //         keyboardType: TextInputType.number,
                                                                    //         decoration: InputDecoration(
                                                                    //           labelStyle: TextStyle(
                                                                    //             color: ColorConstant.black900,
                                                                    //           ),
                                                                    //           labelText: "lbl_price".tr,
                                                                    //           border: OutlineInputBorder(
                                                                    //             borderRadius: BorderRadius.circular(15.0),
                                                                    //             borderSide: BorderSide.none,
                                                                    //           ),
                                                                    //           fillColor: ColorConstant.gray100,
                                                                    //           filled: true,
                                                                    //           isDense: true,
                                                                    //           contentPadding: EdgeInsets.symmetric(
                                                                    //             vertical: 12.0,
                                                                    //             horizontal: 16.0,
                                                                    //           ),
                                                                    //         ))),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Obx(
                                                              () => Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                width: 300,
                                                                height: 70,
                                                                child: ElevatedButton(
                                                                    child: controller.isLoading.value
                                                                        ? CircularProgressIndicator(
                                                                            color:
                                                                                Colors.white,
                                                                          )
                                                                        : Text(
                                                                            "lbl_upload".tr,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 14,
                                                                              color: ColorConstant.whiteA700,
                                                                              fontFamily: 'Aller',
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          ColorConstant
                                                                              .gray90004,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        side: BorderSide(
                                                                            color:
                                                                                Colors.black45,
                                                                            width: 1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                      ),
                                                                    ),
                                                                    onPressed: () async {
                                                                      onTapAddImages();
                                                                      controller
                                                                          .isLoading
                                                                          .value = true;
                                                                    }),
                                                              ),
                                                            ),
                                                            // CustomButton(
                                                            //   height:
                                                            //       getVerticalSize(
                                                            //           56),
                                                            //   text: "lbl_upload"
                                                            //       .tr,
                                                            //   margin: getMargin(
                                                            //       left: 24,
                                                            //       right: 24,
                                                            //       bottom: 24),
                                                            //   variant: ButtonVariant
                                                            //       .FillGray90002,
                                                            //   padding: ButtonPadding
                                                            //       .PaddingAll19,
                                                            //   fontStyle:
                                                            //       ButtonFontStyle
                                                            //           .AllerBold14,
                                                            //   onTap: () {
                                                            //     onTapAddImages();
                                                            //   },
                                                            // ),
                                                          ])),
                                                ),
                                              )
                                            ]))
                                  ]))))))))));

  onTapImgClose() {
    controller.clearData();
    Get.back();
  }

  onTapDocumentUpload() async {
    await controller.saveDocument();
  }

  onTapClose() {
    Get.back();
  }

  onTapAddImages() {
    var currentDate = DateTime.now().format('dd/MM/yyyy');
    var formattedCurDate = DateFormat('dd/MM/yyyy').parse(currentDate);
    var selectedEndDate = DateFormat('dd/MM/yyyy').parse(
        controller.dateTextController.text.isEmpty
            ? currentDate
            : controller.dateTextController.text);

    if (controller.entrytitleController.text.isEmpty ||
        controller.selectedId.value.isEmpty ||
        controller.entrydescriptioController.text.isEmpty ||
        controller.minimumNoOFVotes.text.isEmpty ||
        controller.priceController.text.isEmpty ||
        controller.compEndsIn.value.isEmpty ||
        controller.uploadCompEndsIn.value.isEmpty ||
        controller.file == null) {
      Future.delayed(Duration(seconds: 1), () {
        controller.isLoading.value = false;
      });

      Fluttertoast.showToast(
        msg: "Kindly fill the necessary details",
        backgroundColor: Colors.grey,
      );
    }
    // else if (selectedEndDate.isBefore(formattedCurDate)) {
    //   Future.delayed(Duration(seconds: 1), () {
    //     controller.isLoading.value = false;
    //   });

    //   Fluttertoast.showToast(
    //     msg: "End Date cannot be less than Current day",
    //     backgroundColor: Colors.grey,
    //   );
    // }
    else {
      controller.addCompetitionPost(
          competitionTitle: controller.entrytitleController.text,
          competitionCategory: controller.selectedId.value,
          competitionLocation: controller.currentLatitudeLongitude.value,
          competitionDescription: controller.entrydescriptioController.text,
          selectedFile: controller.file,
          minimumNoOFVotes: controller.minimumNoOFVotes.text,
          price: controller.priceController.text,
          isFeatureEnabled: controller.selected.value,
          daysToEnd: controller.compEndsIn.value,
          daysToUpload: controller.uploadCompEndsIn.value);
    }
  }
}
