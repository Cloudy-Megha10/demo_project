import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kainok_app/core/models/refresh_screen_service.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/presentation/comp_image_listing_screen/controller/image_listing_controller.dart';
import 'package:kainok_app/presentation/competitions_screen_page/controller/competitions_screen_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/profile_deatils_my_participation_tab_container_screen.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import 'package:kainok_app/theme/app_style.dart';
import 'package:kainok_app/widgets/custom_bottom_bar.dart';
import 'package:kainok_app/widgets/custom_button.dart';
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

class ImageListingScreen extends GetView<CompImageListingController> {
  CategoryListingController categoryListingController =
      Get.put(CategoryListingController());
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    print("dataImageListing");
    print(data);

    String competitionId = data['competitionId'];

    String competitionName = data['competitionTitle'];
    bool isCompImageListingScreen = data["isCompImageListingScreen"];
    dynamic categoryId = data['categoryId'];

    controller.getMyImagesForComp(competitionId, competitionName);

    Future<void> _refreshPage() async {
      controller.getMyImagesForComp(competitionId, competitionName);
    }

    return WillPopScope(
        onWillPop: () async {
          (categoryId == null)
              ? Get.toNamed(AppRoutes.competitionsScreen)
                  ?.then((value) => Get.delete<CompetitionsScreenController>())
              : categoryListingController
                  .participationCompetitionsByCategoryGetApi(categoryId, true);
          return false;
        },
        child: Obx(() => SafeArea(
                child: Scaffold(
              backgroundColor: ColorConstant.whiteA70001,
              // appBar: CustomAppBar(
              //     height: getVerticalSize(90),
              //     leadingWidth: 48,
              //     leading: AppbarImage(
              //         height: getSize(24),
              //         width: getSize(24),
              //         svgPath: ImageConstant.imgArrowleftGray900,
              //         margin: getMargin(
              //           left: 25,
              //         ),
              //         onTap: () {
              //           onTapArrowleft(isCompImageListingScreen, categoryId);
              //         }),
              //     title: Padding(
              //         padding: getPadding(left: 16, top: 11, bottom: 6),
              //         child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Container(
              //                 width: getHorizontalSize(150),
              //                 child: Row(
              //                   children: [
              //                     Flexible(
              //                       child: AppbarTitle(
              //                         text: controller.competitionTitle.value,
              //                       ),
              //                     ),
              //                     Text(
              //                         '(${controller.imageListingModelObj.myParticipedCompImagesItemList.length} Images)',
              //                         overflow: TextOverflow.ellipsis,
              //                         textAlign: TextAlign.left,
              //                         style: AppStyle.txtAllerBold14Gray900),
              //                   ],
              //                 ),
              //               ),
              //               // (controller.imageListingModelObj
              //               //             .myParticipedCompImagesItemList.length >
              //               //         0)
              //               //     ? GestureDetector(
              //               //         child: Padding(
              //               //           padding: getPadding(right: 20),
              //               //           child: Icon(Icons.add_a_photo,
              //               //               size: 20, color: Colors.black),
              //               //         ),
              //               //         onTap: () async {
              //               //           SecureStorage _secureStorage =
              //               //               SecureStorage();

              //               //           dynamic isGuestUser =
              //               //               await _secureStorage.getIsGuestUser();
              //               //           dynamic userId =
              //               //               await _secureStorage.getUserId();
              //               //           dynamic isLoggedOut =
              //               //               await _secureStorage.getIsLoggedOut();

              //               //           if (isGuestUser == "true" ||
              //               //               isLoggedOut == "true") {
              //               //             showAlertDialogBox(
              //               //                 context,
              //               //                 "Please sign up or log in to participate in a Competition",
              //               //                 userId,
              //               //                 isGuestUser);
              //               //           } else {
              //               //             onTapParticipateCompetition(
              //               //                 competitionId,
              //               //                 competitionName,
              //               //                 categoryId);
              //               //           }
              //               //         },
              //               //       )
              //               //     : Container(),
              //             ])),
              //     styleType: Style.bgFillWhiteA700_1),
              body: RefreshIndicator(
                onRefresh: () async {
                  await _refreshPage();
                },
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                    //  color: ColorConstant.yellow700,
                                    child: AppbarImage(
                                        height: getSize(24),
                                        width: getSize(24),
                                        svgPath:
                                            ImageConstant.imgArrowleftGray900,
                                        margin: getMargin(
                                          left: 0,
                                        ),
                                        onTap: () {
                                          onTapArrowleft(
                                              isCompImageListingScreen,
                                              categoryId);
                                        }))),
                            Expanded(
                                flex: 10,
                                child: Container(
                                    margin: getMargin(right: 20),
                                    // color: ColorConstant.lightBlue100,
                                    child: Text(
                                      controller.competitionTitle.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtAllerBold23,
                                    )))
                          ])),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.compDescription.toString(),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Prize Money:" +
                              " " +
                              controller.compPrice.toString(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtAllerBold14Gray900)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (controller.imageListingModelObj
                                  .myParticipedCompImagesItemList.length >
                              0)
                          ? quiltedLayout(context)
                          : Container(
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 200),
                                Padding(
                                  padding: getPadding(left: 50, right: 50),
                                  child: CustomImageView(
                                    alignment: Alignment.center,
                                    svgPath: ImageConstant.trophy,
                                    height: getSize(50),
                                    width: getSize(50),
                                  ),
                                ),
                                Padding(
                                    padding: getPadding(
                                        left: 50, right: 50, top: 10),
                                    child: Text("msg_no_participations".tr,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtAllerBold17)),
                                SizedBox(
                                  height: 10,
                                ),
                                // Padding(
                                //     padding: getPadding(
                                //         left: 50, right: 50, top: 10),
                                //     child: CustomButton(
                                //       height: getVerticalSize(50),
                                //       width: getHorizontalSize(150),
                                //       text: "+  Participate",
                                //       margin: getMargin(left: 8),
                                //       shape: ButtonShape.RoundedBorder20,
                                //       variant: ButtonVariant.OutlineGray90002,
                                //       padding: ButtonPadding.PaddingAll6,
                                //       fontStyle: ButtonFontStyle.Aller12,
                                //       onTap: () async {
                                //         SecureStorage _secureStorage =
                                //             SecureStorage();

                                //         dynamic isGuestUser =
                                //             await _secureStorage
                                //                 .getIsGuestUser();
                                //         dynamic userId =
                                //             await _secureStorage.getUserId();
                                //         dynamic isLoggedOut =
                                //             await _secureStorage
                                //                 .getIsLoggedOut();

                                //         if (isGuestUser == "true" ||
                                //             isLoggedOut == "true") {
                                //           showAlertDialogBox(
                                //               context,
                                //               "Please sign up or log in to participate in a Competition",
                                //               userId,
                                //               isGuestUser);
                                //         } else {
                                //           onTapParticipateCompetition(
                                //               competitionId,
                                //               competitionName,
                                //               categoryId);
                                //         }
                                //       },
                                //     )),
                              ],
                            ))),
                ])),
              ),
              floatingActionButton: GestureDetector(
                  child: Padding(
                padding: getPadding(top: 40, left: 10),
                child: Stack(children: [
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        height: 10,
                        width: 150,
                        text: "+  Participate",
                        margin: getMargin(left: 8),
                        shape: ButtonShape.RoundedBorder20,
                        variant: ButtonVariant.OutlineGray90002,
                        padding: ButtonPadding.PaddingAll6,
                        fontStyle: ButtonFontStyle.Aller12,
                        onTap: () async {
                          SecureStorage _secureStorage = SecureStorage();

                          dynamic isGuestUser =
                              await _secureStorage.getIsGuestUser();
                          dynamic userId = await _secureStorage.getUserId();
                          dynamic isLoggedOut =
                              await _secureStorage.getIsLoggedOut();

                          if (isGuestUser == "true" || isLoggedOut == "true") {
                            showAlertDialogBox(
                                context,
                                "Please sign up or log in to participate in a Competition",
                                userId,
                                isGuestUser);
                          } else {
                            onTapParticipateCompetition(
                                competitionId, competitionName, categoryId);
                          }
                        },
                      ))
                ]),
              )),
            ))));
  }

  Widget masonryLayout(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      itemCount:
          controller.imageListingModelObj.myParticipedCompImagesItemList.length,
      itemBuilder: (BuildContext ctx, int index) {
        return GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: CustomImageView(
                  isFadeInImage: true,
                  url: controller.imageListingModelObj
                      .myParticipedCompImagesItemList[index].image,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(
                    getHorizontalSize(16),
                  ),
                ),
              )),
          onTap: () {
            // onTapImageView(
            //     controller.categoryListingModelObj.imageListingModel[index]
            //         .competitionId
            //         .toString(),
            //     controller
            //         .categoryListingModelObj.imageListingModel[index].imageId
            //         .toString(),
            //     controller.categoryListingModelObj.imageListingModel[index]
            //         .competitionTitle,
            //     controller.userId.toString());
          },
        );
      },
    );
  }

  Widget alignedLayout(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      // itemCount: controller.categoryListingModelObj.categoryItemList.length,
      itemBuilder: (BuildContext ctx, int index) {
        return GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: CustomImageView(
                  isFadeInImage: true,
                  // url: controller
                  //     .categoryListingModelObj.categoryItemList[index].images,
                  fit: BoxFit.cover,
                  radius: BorderRadius.circular(
                    getHorizontalSize(16),
                  ),
                ),
              )),
          onTap: () {
            // onTapImageView(
            //     controller.categoryListingModelObj.imageListingModel[index]
            //         .competitionId,
            //     controller
            //         .categoryListingModelObj.imageListingModel[index].imageId
            //         .toString(),
            //     controller.categoryListingModelObj.imageListingModel[index]
            //         .competitionTitle,
            //     controller.userId);
          },
        );
      },
    );
  }

  Widget quiltedLayout(BuildContext context) {
    return GridView.custom(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverQuiltedGridDelegate(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ]),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  child: CustomImageView(
                    isFadeInImage: true,
                    url: controller.imageListingModelObj
                        .myParticipedCompImagesItemList[index].image,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(
                      getHorizontalSize(16),
                    ),
                  ),
                ));
          },
          childCount: controller
              .imageListingModelObj.myParticipedCompImagesItemList.length,
        ));
  }

  onTapArrowleft(bool isCompImageListingScreen, dynamic categoryId) {
    (categoryId == null)
        ? Get.toNamed(AppRoutes.competitionsScreen)
            ?.then((value) => Get.delete<CompetitionsScreenController>())
        : categoryListingController.participationCompetitionsByCategoryGetApi(
            categoryId, true);
  }

  onTapParticipateCompetition(
      String competitionId, String competitionTitle, dynamic categoryId) {
    Get.toNamed(AppRoutes.participateInCompScreen, arguments: {
      'competitionId': competitionId,
      'competitionTitle': competitionTitle,
      'isCompImageListingScreen': true,
      'categoryId': categoryId
    });
  }

  onTapImageView(String competitionId, String imageId, String competitionName,
      String userId) {
    Get.toNamed(AppRoutes.previewScreen, arguments: {
      'competitionId': competitionId,
      'imageId': imageId,
      'competitionTitle': competitionName,
      'userId': userId
    });
  }
}
