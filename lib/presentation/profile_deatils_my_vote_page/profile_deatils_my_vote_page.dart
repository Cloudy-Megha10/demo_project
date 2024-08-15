import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import '../my_vote_img_listing_screen/controller/my_vote_img_listing_controller.dart';
import 'controller/profile_deatils_my_vote_controller.dart';
import 'models/profile_deatils_my_vote_model.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileDeatilsMyVotePage extends StatelessWidget {
  ProfileDeatilsMyVoteController controller =
      Get.put(ProfileDeatilsMyVoteController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: getMargin(left: 1, top: 24),
            padding: getPadding(left: 22, right: 22),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  SingleChildScrollView(
                      child: Padding(
                    padding: getPadding(right: 12),
                    child: SingleChildScrollView(
                        child: controller.myVotesItemList.length > 0
                            ? Obx(() => GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: getVerticalSize(126),
                                        crossAxisCount: 3,
                                        mainAxisSpacing: getHorizontalSize(16),
                                        crossAxisSpacing:
                                            getHorizontalSize(16)),
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.myVotesItemList.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      onTapVotedImages(
                                          context,
                                          controller.myVotesItemList[index]
                                              .competitionId
                                              .toString(),
                                          controller.myVotesItemList[index]
                                              .competitionTitle
                                              .toString());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Card(
                                          clipBehavior: Clip.antiAlias,
                                          elevation: 0,
                                          margin: EdgeInsets.all(0),
                                          color: ColorConstant.black900,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder50,
                                          ),
                                          child: Container(
                                            height: getSize(
                                              100,
                                            ),
                                            width: getSize(
                                              100,
                                            ),
                                            decoration: AppDecoration
                                                .fillBlack900
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .circleBorder50,
                                            ),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      controller
                                                          .myVotesItemList[
                                                              index]
                                                          .image
                                                          .toString()),
                                                  radius: 50,
                                                  backgroundColor:
                                                      Colors.grey[100],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            top: 8,
                                          ),
                                          child: Obx(
                                            () => Text(
                                              controller.myVotesItemList[index]
                                                  .competitionTitle
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtAller14Gray500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                            : Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                    ),
                                    CustomImageView(
                                      alignment: Alignment.center,
                                      svgPath: ImageConstant.imgFavoriteGray600,
                                      height: getSize(50),
                                      width: getSize(50),
                                    ),
                                    Padding(
                                        padding: getPadding(
                                            left: 50, right: 50, top: 10),
                                        child: Text("msg_no_votes".tr,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtAllerBold17)),
                                  ],
                                ),
                              )),
                  ))
                ]))));
  }

  onTapVotedImages(
      BuildContext context, String competitionId, String competitionTitle) {
    MyVoteImgListingController myVotesImgListingController =
        Get.put(MyVoteImgListingController());
    myVotesImgListingController.getMyVotesImageDetails(
        competitionId, competitionTitle);
  }

  onTapColumnlocation() {
    Get.toNamed(AppRoutes.previewScreen);
  }

  onTapStackcamerafour() {
    Get.toNamed(
      AppRoutes.participateInCompScreen,
    );
  }
}
