import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:demo_project/core/utils/date_time_utils.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/widgets/custom_text_form_field.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_check_box.dart';
import '../../../widgets/custom_drop_down.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/edit_comp_bottom_sheet_controller.dart';

class EditCompetitionDetailsBottomSheet
    extends GetWidget<EditCompetitionsBottomSheetController> {
  String competitionId;
  EditCompetitionDetailsBottomSheet({required this.competitionId});
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height * 1.0,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  svgPath: ImageConstant.imgClose,
                  height: getSize(24),
                  width: getSize(24),
                  alignment: Alignment.centerLeft,
                  onTap: () {
                    goBack();
                  }),
              Padding(
                  padding: getPadding(top: 9),
                  child: Text("msg_edit_comp".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtAllerBold23)),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: controller.compTitle,
                readOnly: false,
                hintText: "msg_title_of_the_entry".tr,
                labelText: "Title",
                focusNode: FocusNode(),
                textInputAction: TextInputAction.done,
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(50),
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 -]"))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomDropDown(
                width: double.infinity,
                height: 50,
                focusNode: FocusNode(),
                value: controller.myCompCategoryModelObj.categories.firstWhere(
                    (option) => option.id == controller.categoryId.value),
                icon: Container(
                  margin: getMargin(
                    left: 30,
                    right: 16,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgIconsArrowdropdown,
                  ),
                ),
                labelText: "Category".tr,
                hintText: "Category",
                alignment: Alignment.centerLeft,
                items: controller.myCompCategoryModelObj.categories,
                onChanged: (value) {
                  controller.selectedId.value = value.id.toString();
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  focusNode: FocusNode(),
                  controller: controller.descriptionController,
                  hintText: "msg_your_description".tr,
                  labelText: "Description",
                  margin: getMargin(top: 16),
                  padding: TextFormFieldPadding.PaddingT31,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(150),
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 -]"))
                  ],
                  maxLines: 4),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 14,
              ),
              Row(children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getHorizontalSize(163),
                        child: CustomDropDown(
                          width: getHorizontalSize(163),
                          height: 50,
                          focusNode: FocusNode(),
                          icon: Container(
                            margin: getMargin(
                              left: 30,
                              right: 5,
                            ),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgIconsArrowdropdown,
                            ),
                          ),
                          labelText: "lbl_days_to_upload".tr,
                          hintText: "lbl_days_to_upload".tr,
                          alignment: Alignment.centerLeft,
                          items: controller.myCompCategoryModelObj.compEndsIn,
                          value: controller.myCompCategoryModelObj.compEndsIn
                              .firstWhere((option) =>
                                  option.id == controller.daysToUpload.value),
                          onChanged: (value) {
                            controller.uploadCompEndsIn.value =
                                value.id.toString();
                          },
                        ),
                      )
                    ]),
                Padding(
                  padding: getPadding(left: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: getHorizontalSize(163),
                          child: CustomDropDown(
                            width: getHorizontalSize(163),
                            height: 50,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 30,
                                right: 5,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgIconsArrowdropdown,
                              ),
                            ),
                            labelText: "lbl_days_to_end".tr,
                            hintText: "lbl_days_to_end".tr,
                            alignment: Alignment.centerLeft,
                            items: controller.myCompCategoryModelObj.compEndsIn,
                            value: controller.myCompCategoryModelObj.compEndsIn
                                .firstWhere((option) =>
                                    option.id == controller.daysToEnd.value),
                            onChanged: (value) {
                              controller.compEndsIn.value = value.id.toString();
                            },
                          ),
                        )
                      ]),
                )
              ]),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getHorizontalSize(163),
                        child: TextField(
                            readOnly: false,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                            controller: controller.prizeMoney,
                            textInputAction: TextInputAction.none,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: ColorConstant.black900,
                              ),
                              labelText: "lbl_price".tr,
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
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: getPadding(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: getHorizontalSize(163),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (controller.isAdmin == "true")
                          ? Padding(
                              padding: getPadding(
                                left: 10,
                              ),
                              child: Obx(
                                () => CustomCheckbox(
                                  iconSize: 20,
                                  value: controller.isFeatured.value,
                                  onChange: (value) {
                                    controller.isFeatured.value = value;
                                  },
                                ),
                              ),
                            )
                          : Container(),
                      (controller.isAdmin == "true")
                          ? SizedBox(child: Text("lbl_feature".tr))
                          : Container(),
                    ],
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         GestureDetector(
              //           child: SizedBox(
              //               width: getHorizontalSize(163),
              //               child: TextField(
              //                   enabled: false,
              //                   style: TextStyle(
              //                     fontSize:
              //                         12.0, // Specify the desired font size
              //                   ),
              //                   controller: controller.dateTextController,
              //                   textInputAction: TextInputAction.none,
              //                   decoration: InputDecoration(
              //                     labelStyle: TextStyle(
              //                       color: ColorConstant
              //                           .black900, // Specify the desired label color
              //                     ),
              //                     labelText: "lbl_competition_end_date".tr,
              //                     border: OutlineInputBorder(
              //                       borderRadius: BorderRadius.circular(
              //                           15.0), // Specify the border radius
              //                       borderSide:
              //                           BorderSide.none, // Hide the border
              //                     ),
              //                     fillColor: ColorConstant.gray100,
              //                     filled: true,
              //                     isDense: true,
              //                     contentPadding: EdgeInsets.symmetric(
              //                       vertical: 12.0,
              //                       horizontal: 16.0,
              //                     ),
              //                   ))),
              //           onTap: () async {
              //             DateTime? pickedDate = await showDatePicker(
              //               context: context,
              //               initialDate: DateTime.now(),
              //               firstDate: DateTime(1950),
              //               lastDate: DateTime(2100),
              //             );

              //             if (pickedDate != null) {
              //               controller.dateTextController.text =
              //                   DateFormat('dd/MM/yyyy').format(pickedDate);
              //             }
              //           },
              //         )
              //       ],
              //     ),
              //     Padding(
              //       padding: getPadding(
              //         left: 16,
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //           SizedBox(
              //               width: getHorizontalSize(163),
              //               child: TextField(
              //                   readOnly: false,
              //                   style: TextStyle(
              //                     fontSize:
              //                         12.0, // Specify the desired font size
              //                   ),
              //                   controller: controller.minimumNoOFVotes,
              //                   textInputAction: TextInputAction.none,
              //                   keyboardType: TextInputType.number,
              //                   decoration: InputDecoration(
              //                     labelStyle: TextStyle(
              //                       color: ColorConstant
              //                           .black900, // Specify the desired label color
              //                     ),
              //                     labelText: "lbl_minimum_no_votes".tr,
              //                     border: OutlineInputBorder(
              //                       borderRadius: BorderRadius.circular(
              //                           15.0), // Specify the border radius
              //                       borderSide:
              //                           BorderSide.none, // Hide the border
              //                     ),
              //                     fillColor: ColorConstant.gray100,
              //                     filled: true,
              //                     isDense: true,
              //                     contentPadding: EdgeInsets.symmetric(
              //                       vertical:
              //                           12.0, // Adjust the vertical padding as needed
              //                       horizontal:
              //                           16.0, // Adjust the horizontal padding as needed
              //                     ),
              //                   ))),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //             width: getHorizontalSize(163),
              //             child: TextField(
              //                 readOnly: false,
              //                 style: TextStyle(
              //                   fontSize: 12.0, // Specify the desired font size
              //                 ),
              //                 controller: controller.prizeMoney,
              //                 textInputAction: TextInputAction.none,
              //                 keyboardType: TextInputType.number,
              //                 decoration: InputDecoration(
              //                   labelStyle: TextStyle(
              //                     color: ColorConstant
              //                         .black900, // Specify the desired label color
              //                   ),
              //                   labelText: "lbl_price".tr,
              //                   border: OutlineInputBorder(
              //                     borderRadius: BorderRadius.circular(
              //                         15.0), // Specify the border radius
              //                     borderSide:
              //                         BorderSide.none, // Hide the border
              //                   ),
              //                   fillColor: ColorConstant.gray100,
              //                   filled: true,
              //                   isDense: true,
              //                   contentPadding: EdgeInsets.symmetric(
              //                     vertical: 12.0,
              //                     horizontal: 16.0,
              //                   ),
              //                 ))),
              //       ],
              //     ),
              //     (controller.isAdmin == "true")
              //         ? Padding(
              //             padding: getPadding(
              //               left: 19,
              //             ),
              //             child: Obx(
              //               () => CustomCheckbox(
              //                 iconSize: 20,
              //                 value: controller.isFeatured.value,
              //                 onChange: (value) {
              //                   controller.isFeatured.value = value;
              //                 },
              //               ),
              //             ),
              //           )
              //         : Container(),
              //     (controller.isAdmin == "true")
              //         ? SizedBox(child: Text("lbl_feature".tr))
              //         : Container(),
              //   ],
              // ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                height: getVerticalSize(56),
                text: "msg_update".tr,
                margin: getMargin(left: 24, right: 24, bottom: 24),
                variant: ButtonVariant.FillGray90002,
                padding: ButtonPadding.PaddingAll19,
                fontStyle: ButtonFontStyle.AllerBold14,
                onTap: () {
                  onTapUpdateCompetition();
                },
              )
            ],
          ),
        )));
  }

  onTapUpdateCompetition() async {
    DateTime currentDate = DateTime.now();
    DateTime? compCreatedDate = controller.compCreatedDate;
    int daysToUpload = controller.fetchDaysToUpload;
    DateTime lastDateToUpdate =
        compCreatedDate!.add(Duration(days: daysToUpload));
    SecureStorage _secureStorage = SecureStorage();
    dynamic isAdmin = await _secureStorage.getUserTypeAsAdmin();
    if (currentDate.isAfter(lastDateToUpdate) && isAdmin != "Admin") {
      Fluttertoast.showToast(
        msg: "You Cannot Edit Competition at this time!!",
        backgroundColor: Colors.grey,
      );
    } else {
      controller.updateCompetition(
          compId: competitionId,
          compTitle: controller.compTitle.text,
          compCategoryId: controller.selectedId.value,
          compDescription: controller.descriptionController.text,
          minNumOfVotes: controller.minimumNoOFVotes.text,
          prizeMoney: controller.prizeMoney.text,
          isFeatured: controller.isFeatured.value,
          daysToUpload: controller.uploadCompEndsIn.value,
          daysToEnd: controller.compEndsIn.value);
    }
  }

  goBack() {
    Get.back();
  }
}
