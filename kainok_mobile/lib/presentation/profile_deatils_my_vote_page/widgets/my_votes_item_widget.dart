import '../../../core/utils/color_constant.dart';
import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';

import '../controller/profile_deatils_my_vote_controller.dart';
import '../models/my_votes_item_model.dart';

// ignore: must_be_immutable
class GridlocationItemWidget extends StatelessWidget {
  GridlocationItemWidget(this.gridlocationItemModelObj,
      {this.onTapColumnlocation});

  myVotesItemModel gridlocationItemModelObj;

  var controller = Get.find<ProfileDeatilsMyVoteController>();

  VoidCallback? onTapColumnlocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapColumnlocation?.call();
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
              borderRadius: BorderRadiusStyle.circleBorder50,
            ),
            child: Container(
              height: getSize(
                100,
              ),
              width: getSize(
                100,
              ),
              decoration: AppDecoration.fillBlack900.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder50,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage12,
                    height: getSize(
                      100,
                    ),
                    width: getSize(
                      100,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        50,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgLocationYellow700,
                    height: getSize(
                      32,
                    ),
                    width: getSize(
                      32,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              top: 9,
            ),
            child: Obx(
              () => Text(
                gridlocationItemModelObj.typeTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtAller14Gray500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
