import 'package:flutter/material.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/image_constant.dart';
import 'package:kainok_app/core/utils/size_utils.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/controller/profile_deatils_my_participation_controller.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/models/participated_item_model.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/routes/app_routes.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import 'package:kainok_app/theme/app_style.dart';
import 'package:kainok_app/widgets/custom_image_view.dart';

class ProfileDeatilsMyParticipationPage extends StatelessWidget {
  final ProfileDeatilsMyParticipationController controller =
      Get.find<ProfileDeatilsMyParticipationController>();

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ParticipatedImageItemModel>> groupedCompetitions =
        {};
    for (final competition in controller.myParticipedImages) {
      if (groupedCompetitions.containsKey(competition.competitionTitle)) {
        groupedCompetitions[competition.competitionTitle]!.add(competition);
      } else {
        groupedCompetitions[competition.competitionTitle] = [competition];
      }
    }

    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          Padding(
            padding: getPadding(right: 12),
            child: GetX<ProfileDeatilsMyParticipationController>(
                builder: (controller) {
              return controller.myParticipedImages.length > 0
                  ? SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                          children: groupedCompetitions.entries.map((entry) {
                            final competitionTitle = entry.key;
                            final images = entry.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Text(competitionTitle,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtAllerBold17)),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            '(${images.length})',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[700],
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent:
                                                    getVerticalSize(126),
                                                crossAxisCount: 3,
                                                mainAxisSpacing:
                                                    getHorizontalSize(16),
                                                crossAxisSpacing:
                                                    getHorizontalSize(16)),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: images.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              //onTapColumnlocation.call();
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
                                                    borderRadius:
                                                        BorderRadiusStyle
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
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .circleBorder50,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundImage:
                                                              NetworkImage(images[
                                                                      index]
                                                                  .imageLocation),
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
                                                  child: Text(
                                                    images[index].imageTitle,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtAller14Gray500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        })),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    )
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
                              padding: getPadding(left: 50, right: 50, top: 10),
                              child: Text("msg_no_participations".tr,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtAllerBold17)),
                        ],
                      ),
                    );
            }),
          )
        ]));
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
