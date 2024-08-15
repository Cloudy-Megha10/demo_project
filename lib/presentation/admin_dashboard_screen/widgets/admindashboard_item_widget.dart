import '../../../core/utils/image_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../controller/admin_dashboard_controller.dart';
import '../models/admindashboard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/core/app_export.dart';

// ignore: must_be_immutable
class AdmindashboardItemWidget extends StatelessWidget {
  AdmindashboardItemWidget(this.admindashboardItemModelObj);

  AdmindashboardItemModel admindashboardItemModelObj;

  var controller = Get.find<AdminDashboardController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Padding(
        padding: getPadding(
          right: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage1210,
              height: getSize(
                64,
              ),
              width: getSize(
                64,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  32,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 1,
              ),
              child: Obx(
                () => Text(
                  admindashboardItemModelObj.nameTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtAllerBold14Gray900,
                ),
              ),
            ),
            Padding(
              padding: getPadding(
                top: 3,
              ),
              child: Obx(
                () => Text(
                  admindashboardItemModelObj.competitionscouTxt.value,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtCaption,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
