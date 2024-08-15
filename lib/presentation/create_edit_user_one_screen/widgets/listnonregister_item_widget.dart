import 'package:demo_project/widgets/custom_text_form_field.dart';

import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/create_edit_user_one_controller.dart';
import '../models/listnonregister_item_model.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/custom_drop_down.dart';

// // ignore: must_be_immutable
// class ListnonregisterItemWidget extends StatelessWidget {
  // ListnonregisterItemWidget(this.listnonregisterItemModelObj);

  // ListnonregisterItemModel listnonregisterItemModelObj;

  // var controller = Get.find<CreateEditUserOneController>();

  // SelectionPopupModel? selectedDropDownValue;

  // SelectionPopupModel? selectedDropDownValue1;

  // @override
  // Widget build(BuildContext context) {
    // return Align(
    //   alignment: Alignment.topCenter,
    //   child: Container(
    //     width: double.maxFinite,
    //     child: Container(
    //       padding: getPadding(
    //         top: 3,
    //         bottom: 3,
    //       ),
    //       decoration: AppDecoration.outlineGray2001,
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Obx(
    //             () => Text(
    //               listnonregisterItemModelObj.nonregisteredusTxt.value,
    //               overflow: TextOverflow.ellipsis,
    //               textAlign: TextAlign.left,
    //               style: AppStyle.txtAller16,
    //             ),
    //           ),
    //           Padding(
    //             padding: getPadding(
    //               top: 15,
    //               bottom: 12,
    //             ),
    //             child: Row(
    //               children: [
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     CustomTextFormField(
    //                       width: getHorizontalSize(
    //                         163,
    //                       ),
    //                       focusNode: FocusNode(),
    //                       hintText: "lbl_1_points".tr,
    //                     ),
    //                     Padding(
    //                       padding: getPadding(
    //                         top: 8,
    //                       ),
    //                       child: Row(
    //                         children: [
    //                           CustomImageView(
    //                             svgPath: ImageConstant.imgInfoGray500,
    //                             height: getSize(
    //                               24,
    //                             ),
    //                             width: getSize(
    //                               24,
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: getPadding(
    //                               left: 4,
    //                               top: 5,
    //                               bottom: 3,
    //                             ),
    //                             child: Text(
    //                               "msg_swipe_right_to_vote2".tr,
    //                               overflow: TextOverflow.ellipsis,
    //                               textAlign: TextAlign.left,
    //                               style: AppStyle.txtCaption,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: getPadding(
    //                     left: 16,
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     children: [
    //                       CustomTextFormField(
    //                         width: getHorizontalSize(
    //                           163,
    //                         ),
    //                         focusNode: FocusNode(),
    //                         hintText: "lbl_1_points2".tr,
    //                       ),
    //                       Padding(
    //                         padding: getPadding(
    //                           top: 8,
    //                         ),
    //                         child: Row(
    //                           children: [
    //                             CustomImageView(
    //                               svgPath: ImageConstant.imgInfoGray500,
    //                               height: getSize(
    //                                 24,
    //                               ),
    //                               width: getSize(
    //                                 24,
    //                               ),
    //                             ),
    //                             Padding(
    //                               padding: getPadding(
    //                                 left: 4,
    //                                 top: 5,
    //                                 bottom: 3,
    //                               ),
    //                               child: Text(
    //                                 "msg_swipe_left_to_vote".tr,
    //                                 overflow: TextOverflow.ellipsis,
    //                                 textAlign: TextAlign.left,
    //                                 style: AppStyle.txtCaption,
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  // }
// }
