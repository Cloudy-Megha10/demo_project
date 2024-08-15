import 'package:demo_project/presentation/my_comp_img_listing_screen/widgets/edit_comp_bottom_sheet.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/widgets/app_bar/appbar_image.dart';
import 'package:demo_project/widgets/app_bar/appbar_title.dart';
import 'package:demo_project/widgets/app_bar/custom_app_bar.dart';

import 'controller/edit_comp_bottom_sheet_controller.dart';
import 'controller/my_comp_img_listing_controller.dart';

class MyCompImgListingScreen extends GetWidget<MyCompImgListingController> {
  EditCompetitionsBottomSheetController editMyCompBottomSheetController =
      Get.put(EditCompetitionsBottomSheetController());

  void _showCompDetailsBottomSheet(BuildContext context, String compId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: EditCompetitionDetailsBottomSheet(
              competitionId: compId,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print("dataMyComp");
    print(data);
    String competitionId = data['competitionId'];

    String competitionTitle = data['competitionTitle'];
    Future<void> _refreshPage() async {
      controller.getAllCompImageDetails(competitionId, competitionTitle);
    }

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteA700,
      // appBar: CustomAppBar(
      //   height: getVerticalSize(74),
      //   leadingWidth: 48,
      //   leading: AppbarImage(
      //       height: getSize(24),
      //       width: getSize(24),
      //       svgPath: ImageConstant.imgArrowleftGray900,
      //       margin: getMargin(left: 24, top: 23, bottom: 23),
      //       onTap: () {
      //         onTapArrowleft2();
      //       }),
      //   title: Padding(
      //       padding: getPadding(left: 16, top: 11, bottom: 6),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Flexible(
      //               child: AppbarTitle(
      //                 text: competitionTitle,
      //               ),
      //             ),
      //             GestureDetector(
      //               child: Padding(
      //                 padding: getPadding(right: 20),
      //                 child: CustomImageView(
      //                   svgPath: ImageConstant.imgEdit,
      //                   height: getSize(24),
      //                   width: getSize(24),
      //                   color: ColorConstant.gray600Dd,
      //                 ),
      //               ),
      //               onTap: () {
      //                 onTapEditComp(context, competitionId, competitionTitle);
      //               },
      //             ),
      //           ])),
      // ),
      body: RefreshIndicator(
          onRefresh: () async {
            await _refreshPage();
          },
          child: Obx(() => SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: getPadding(left: 24, right: 24),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            controller.myCompImgListingModelObj
                                        .ImagesDetailsList.length >
                                    0
                                ? Container(
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: controller
                                          .myCompImgListingModelObj
                                          .ImagesDetailsList
                                          .length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            margin: getMargin(top: 16),
                                            padding: getPadding(all: 16),
                                            decoration:
                                                AppDecoration.outlineGray2001,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(controller
                                                            .myCompImgListingModelObj
                                                            .ImagesDetailsList[
                                                                index]
                                                            .images),
                                                    radius: 30,
                                                    backgroundColor:
                                                        Colors.grey[100],
                                                  ),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 16,
                                                          top: 9,
                                                          bottom: 9),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        100),
                                                                child: Text(
                                                                    controller
                                                                        .myCompImgListingModelObj
                                                                        .ImagesDetailsList[
                                                                            index]
                                                                        .imageTitle,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtAllerBold14Gray900)),
                                                            Text(
                                                                controller
                                                                    .myCompImgListingModelObj
                                                                    .ImagesDetailsList[
                                                                        index]
                                                                    .userName,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtCaption)
                                                          ])),
                                                  Expanded(
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 0),
                                                            child: Text(
                                                                "Total Likes: " +
                                                                    controller
                                                                        .myCompImgListingModelObj
                                                                        .ImagesDetailsList[
                                                                            index]
                                                                        .totalLikes,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular11Black9008e)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 0),
                                                            child: Text(
                                                                "Total Dislikes: " +
                                                                    controller
                                                                        .myCompImgListingModelObj
                                                                        .ImagesDetailsList[
                                                                            index]
                                                                        .totalDisLikes,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsRegular11Black9008e))
                                                      ]))
                                                ]));
                                      },
                                    ),
                                  )
                                : Container(
                                    margin: getMargin(top: 200),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: getPadding(
                                                left: 50, right: 50, top: 10),
                                            child: CustomImageView(
                                              alignment: Alignment.center,
                                              svgPath: ImageConstant.trophy,
                                              height: getSize(50),
                                              width: getSize(50),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 50,
                                                    right: 50,
                                                    top: 10),
                                                child: Text(
                                                    "msg_no_participations".tr,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyle
                                                        .txtAllerBold17)),
                                          )
                                        ])),
                            SizedBox(
                              height: 30,
                            )
                          ])))))),
    ));
  }

  onTapEditComp(
      BuildContext context, String competitionId, String competitionTitle) {
    EditCompetitionsBottomSheetController editMyCompBottomSheetController =
        Get.put(EditCompetitionsBottomSheetController());
    _showCompDetailsBottomSheet(context, competitionId);
    editMyCompBottomSheetController.categoryGetApi();
    editMyCompBottomSheetController.noOfDaysDropDown();
    editMyCompBottomSheetController.getCompetitionsDetails(competitionId);
  }

  onTapArrowleft2() {
    Get.back();
  }
}
