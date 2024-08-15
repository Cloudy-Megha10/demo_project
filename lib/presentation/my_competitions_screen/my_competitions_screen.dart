import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/image_constant.dart';
import 'package:demo_project/core/utils/size_utils.dart';
import 'package:demo_project/presentation/my_comp_img_listing_screen/controller/my_comp_img_listing_controller.dart';
import 'package:demo_project/presentation/my_competitions_screen/controller/my_competitions_controller.dart';
import 'package:demo_project/presentation/my_competitions_screen/widgets/comp_details_bottom_sheet.dart';
import 'package:demo_project/routes/app_routes.dart';
import 'package:demo_project/theme/app_decoration.dart';
import 'package:demo_project/theme/app_style.dart';
import 'package:demo_project/widgets/custom_image_view.dart';

class MyCompetitionsScreen extends StatelessWidget {
  MyCompetitionsController controller = Get.put(MyCompetitionsController());

  void _showCompDetailsBottomSheet(BuildContext context, String compId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          child: CompetitionDetailsBottomSheet(
            competitionId: compId,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin(left: 1, top: 24),
        padding: getPadding(left: 22, right: 22),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: getPadding(right: 12),
                  child: controller.myCompetitionsControllerModelObj.value
                              .myCompetitionsItemList.length >
                          0
                      ? Obx(() => GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: getVerticalSize(126),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: getHorizontalSize(16),
                                  crossAxisSpacing: getHorizontalSize(16)),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.myCompetitionsControllerModelObj
                              .value.myCompetitionsItemList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                onTapMyCompetitions(
                                    context,
                                    controller
                                        .myCompetitionsControllerModelObj
                                        .value
                                        .myCompetitionsItemList[index]
                                        .competitionId
                                        .toString(),
                                    controller
                                        .myCompetitionsControllerModelObj
                                        .value
                                        .myCompetitionsItemList[index]
                                        .listName
                                        .toString());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.black900,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder50,
                                    ),
                                    child: Container(
                                      height: getSize(
                                        100,
                                      ),
                                      width: getSize(
                                        100,
                                      ),
                                      decoration:
                                          AppDecoration.fillBlack900.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder50,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(controller
                                                .myCompetitionsControllerModelObj
                                                .value
                                                .myCompetitionsItemList[index]
                                                .icon),
                                            radius: 50,
                                            backgroundColor: Colors.grey[100],
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
                                        controller
                                            .myCompetitionsControllerModelObj
                                            .value
                                            .myCompetitionsItemList[index]
                                            .listName,
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
                                svgPath: ImageConstant.trophy,
                                height: getSize(50),
                                width: getSize(50),
                              ),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 10),
                                  child: Text("lbl_no_competitions".tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtAllerBold17)),
                            ],
                          ),
                        )),
            ]));
  }

  onTapMyCompetitions(
      BuildContext context, String competitionId, String competitionTitle) {
    MyCompImgListingController myCompImgListingController =
        Get.put(MyCompImgListingController());
    myCompImgListingController.getAllCompImageDetails(
        competitionId, competitionTitle);
  }

  onTapColumnchopper() {
    Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen);
  }

  onTapStackcamerafour() {
    Get.toNamed(
      AppRoutes.participateInCompScreen,
    );
  }
}
