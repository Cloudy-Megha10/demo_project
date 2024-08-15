import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/category_listing_screen/controller/category_listing_controller.dart';
import 'package:kainok_app/widgets/custom_image_view.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/flutter_secure_storage.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../category_listing_screen/models/vote_item_model.dart';
import '../voting_screen_page/controller/voting_screen_controller.dart';

class PreviewScreen extends StatelessWidget {
  CategoryListingController controller = Get.put(CategoryListingController());

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List<SwipeItem> swipeItems = [];

      MatchEngine? matchEngine;

      var data = Get.arguments;

      String competitionId = data['competitionId'];

      String competitionName = data['competitionTitle'];

      String? userId = data['userId'];

      int selectedImageId = 0;

      for (int i = 0;
          i < controller.categoryListingModelObj.imageListingModel.length;
          i++) {
        swipeItems.add(SwipeItem(
          content: Content(
            text: controller
                .categoryListingModelObj.imageListingModel[i].competitionTitle,
            image: Image.network(
              controller.categoryListingModelObj.imageListingModel[i].image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              height: getVerticalSize(728),
              width: getHorizontalSize(389),
            ),
          ),
          likeAction: () {
            controller.categoryListingModelObj.voteList.add(new VoteItemModel(
                liked: true,
                compId: competitionId,
                imageId: controller
                    .categoryListingModelObj.imageListingModel[i].imageId,
                userId: userId));
          },
          nopeAction: () {
            controller.categoryListingModelObj.voteList.add(new VoteItemModel(
                liked: false,
                compId: competitionId,
                imageId: controller
                    .categoryListingModelObj.imageListingModel[i].imageId,
                userId: userId));
          },
          superlikeAction: () {
            Fluttertoast.showToast(
              msg: "SuperLike",
              backgroundColor: Colors.grey,
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          },
        ));
      }

      matchEngine = MatchEngine(swipeItems: swipeItems);

      return WillPopScope(
          onWillPop: () async {
            if (controller.categoryListingModelObj.voteList.length > 0) {
              onTapVote(controller.categoryListingModelObj.voteList);
            }
            onTapArrowleft1();
            return true;
          },
          child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            // appBar: CustomAppBar(
            //     height: getVerticalSize(76),
            //     leadingWidth: 48,
            //     leading: AppbarImage(
            //         height: getSize(24),
            //         width: getSize(24),
            //         svgPath: ImageConstant.imgArrowleftGray900,
            //         margin: getMargin(left: 24, top: 28, bottom: 23),
            //         onTap: () {
            //           if (controller.categoryListingModelObj.voteList.length >
            //               0) {
            //             onTapVote(controller.categoryListingModelObj.voteList);
            //           }
            //           onTapArrowleft1();
            //         }),
            //     title: Padding(
            //         padding: getPadding(left: 16, top: 11, bottom: 6),
            //         child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Flexible(
            //                   child: AppbarTitle(
            //                       text: competitionName,
            //                       margin: getMargin(right: 42))),
            //               // GestureDetector(
            //               //   child: Padding(
            //               //     padding: getPadding(right: 20),
            //               //     child: CustomImageView(
            //               //       svgPath: ImageConstant.imgUser,
            //               //       height: getSize(24),
            //               //       width: getSize(24),
            //               //       color: ColorConstant.gray600Dd,
            //               //     ),
            //               //   ),
            //               //   onTap: () async {
            //               //     SecureStorage _secureStorage = SecureStorage();

            //               //     dynamic isGuestUser =
            //               //         await _secureStorage.getIsGuestUser();
            //               //     dynamic userId = await _secureStorage.getUserId();
            //               //     dynamic isLoggedOut =
            //               //         await _secureStorage.getIsLoggedOut();

            //               //     if (isGuestUser == "true" ||
            //               //         isLoggedOut == "true") {
            //               //       showAlertDialogBox(
            //               //           context,
            //               //           "Please sign up or log in to participate in a Competition",
            //               //           userId,
            //               //           isGuestUser);
            //               //     } else {
            //               //       onTapParticipateCompetition(
            //               //           competitionId, competitionName);
            //               //     }
            //               //   },
            //               // ),
            //             ])),
            //     styleType: Style.bgFillWhiteA700_1),
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: ColorConstant.whiteA700,
                  child: SwipeCards(
                    matchEngine: matchEngine,
                    itemBuilder: (BuildContext context, int index) {
                      controller.minVotes.value = controller
                          .categoryListingModelObj
                          .imageListingModel[index]
                          .minimumVotes;
                      return GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  16), // Adjust the radius as needed
                              topRight: Radius.circular(
                                  16), // Adjust the radius as needed
                            ),
                            child: swipeItems[index].content.image,
                          ),
                        ),
                        onTap: () {
                          onTapPreviewFullScreen(
                              controller.categoryListingModelObj
                                  .imageListingModel[index].image
                                  .toString(),
                              competitionName,
                              controller.categoryListingModelObj
                                  .imageListingModel[index].competitionId
                                  .toString(),
                              controller.categoryListingModelObj
                                  .imageListingModel[index].imageId
                                  .toString(),
                              userId.toString());
                        },
                      );
                    },
                    onStackFinished: () {
                      controller.index.value = 0;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));

                      onTapVote(controller.categoryListingModelObj.voteList);
                    },
                    itemChanged: (SwipeItem item, int index) {
                      controller.index.value = index + 1;

                      print("item: ${item.content.text}, index: $index");
                    },
                    leftSwipeAllowed: true,
                    rightSwipeAllowed: true,
                    upSwipeAllowed: true,
                    fillSpace: true,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(
                            left: 24, top: 22, right: 13, bottom: 18),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // CustomImageView(
                              //     svgPath: ImageConstant.imgShareIcon,
                              //     height: getSize(35),
                              //     width: getSize(35),
                              //     alignment: Alignment.centerRight),
                              Spacer(),
                              Padding(
                                  padding: getPadding(top: 37, right: 9),
                                  child: Container(
                                      height: getVerticalSize(4),
                                      width: getHorizontalSize(342),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.whiteA7005a,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2))),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2)),
                                          child: Obx(
                                            () => LinearProgressIndicator(
                                              value: controller.index.value /
                                                  controller
                                                      .categoryListingModelObj
                                                      .imageListingModel
                                                      .length,
                                              backgroundColor:
                                                  ColorConstant.black900,
                                              valueColor: (controller
                                                          .index.value >=
                                                      controller.minVotes.value)
                                                  ? AlwaysStoppedAnimation<
                                                          Color>(
                                                      ColorConstant.greenA700)
                                                  : AlwaysStoppedAnimation<
                                                          Color>(
                                                      ColorConstant.whiteA700),
                                            ),
                                          ))))
                            ])))
              ],
            ),
          ));
    });
  }

  showAlertDialogBox(
      BuildContext context, String content, String userId, String isGuestUser) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText: "LOG IN",
          onTap: () {
            (userId != "0" && isGuestUser == "true")
                ? Get.toNamed(
                    AppRoutes.signUpGuestUserScreen,
                  )
                : Get.toNamed(
                    AppRoutes.signInScreen,
                  );
          },
        );
      },
    );
  }

  onTapPreviewFullScreen(String image, String competitionName,
      String competitionId, String imageId, String? userId) {
    Get.toNamed(AppRoutes.previewFullscreenScreen, arguments: {
      'image': image,
      'competitionTitle': competitionName,
      'competitionId': competitionId,
      'imageId': imageId,
      'userId': userId
    });
  }

  onTapVote(List<VoteItemModel> votedImages) async {
    controller.votePost(votedImages: votedImages);
  }

  onTapArrowleft1() {
    Get.back();
  }
}

onTapParticipateCompetition(String competitionId, String competitionTitle) {
  Get.toNamed(AppRoutes.participateInCompScreen, arguments: {
    'competitionId': competitionId,
    'competitionTitle': competitionTitle,
    'isCompImageListingScreen': true
  });
}

class Content {
  final String text;
  final Image image;
  Content({required this.text, required this.image});
}
