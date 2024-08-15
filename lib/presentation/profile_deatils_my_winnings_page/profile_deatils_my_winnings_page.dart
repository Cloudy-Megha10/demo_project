import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/profile_deatils_my_winnings_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileDeatilsMyWinningsPage extends StatelessWidget {
  ProfileDeatilsMyWinningsController controller =
      Get.put(ProfileDeatilsMyWinningsController());

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
                  child: controller.winnerList.length > 0
                      ? Obx(() => GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: getVerticalSize(126),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: getHorizontalSize(16),
                                  crossAxisSpacing: getHorizontalSize(16)),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.winnerList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //onTapColumnlocation.call();
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
                                            backgroundImage: NetworkImage(
                                              controller.winnerList[index].icon,
                                            ),
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
                                        controller.winnerList[index].listName,
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
                                svgPath: ImageConstant.imgWinner,
                                height: getSize(50),
                                width: getSize(50),
                              ),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 10),
                                  child: Text("msg_your_time_is_yet".tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtAllerBold17)),
                            ],
                          ),
                        )),
            ]));
  }

  onTapStackcamerafour() {
    Get.toNamed(
      AppRoutes.participateInCompScreen,
    );
  }
}
