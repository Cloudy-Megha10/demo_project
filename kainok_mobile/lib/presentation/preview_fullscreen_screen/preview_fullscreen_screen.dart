import 'package:flutter/services.dart';
import 'package:kainok_app/routes/app_routes.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/preview_fullscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class PreviewFullscreenScreen extends GetWidget<PreviewFullscreenController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    dynamic zoomingImage = data['image'];
    String competitionName = data['competitionTitle'];
    String competitionId = data['competitionId'];
    String userId = data['userId'];

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.whiteA70001,
        body: GestureDetector(
          onTap: () {
            previewBack(competitionId, competitionName, userId);
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: InteractiveViewer(
                  clipBehavior: Clip.none,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA70001,
                    ),
                    child: Image.network(
                      zoomingImage.toString(),
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text('Failed to load image'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgShareIcon,
                      height: getSize(30),
                      width: getSize(30),
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(width: 10),
                    // Assuming you have a vote count variable in your controller
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: CustomButton(
                  height: getVerticalSize(28),
                  width: getHorizontalSize(63),
                  text: "lbl_4_2_k".tr,
                  variant: ButtonVariant.FillWhiteA700cc,
                  shape: ButtonShape.CircleBorder14,
                  padding: ButtonPadding.PaddingT5,
                  fontStyle: ButtonFontStyle.PoppinsMedium11,
                  suffixWidget: Container(
                    margin: EdgeInsets.only(left: 4, right: 10),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFavorite,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
            ],
          ),
        ),
        // Stack(
        //   children: [
        //     GestureDetector(
        //       child: InteractiveViewer(
        //         clipBehavior: Clip.none,
        //         child: Container(
        //           width: size.width,
        //           decoration: BoxDecoration(
        //             color: ColorConstant.whiteA70001,
        //           ),
        //           child: Image.network(
        //             zoomingImage.toString(),
        //             fit: BoxFit.fill,
        //             loadingBuilder: (context, child, loadingProgress) {
        //               if (loadingProgress == null) {
        //                 return child;
        //               }
        //               return Center(
        //                 child: CircularProgressIndicator(),
        //               );
        //             },
        //             errorBuilder: (context, error, stackTrace) {
        //               return Center(
        //                 child: Text('Failed to load image'),
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //       onTap: () {
        //         previewBack(competitionName, imageId, competitionId, userId);
        //       },
        //     ),
        //     Positioned(
        //       top: 20,
        //       right: 20,
        //       child: Row(
        //         children: [
        //           CustomImageView(
        //               svgPath: ImageConstant.imgShareIcon,
        //               height: getSize(30),
        //               width: getSize(30),
        //               alignment: Alignment.centerRight),
        //           SizedBox(width: 10),
        //           // Assuming you have a vote count variable in your controller
        //         ],
        //       ),
        //     ),
        //     Positioned(
        //       bottom: 20,
        //       right: 20,
        //       child: CustomButton(
        //         height: getVerticalSize(28),
        //         width: getHorizontalSize(63),
        //         text: "lbl_4_2_k".tr,
        //         variant: ButtonVariant.FillWhiteA700cc,
        //         shape: ButtonShape.CircleBorder14,
        //         padding: ButtonPadding.PaddingT5,
        //         fontStyle: ButtonFontStyle.PoppinsMedium11,
        //         suffixWidget: Container(
        //           margin: EdgeInsets.only(left: 4, right: 10),
        //           child: CustomImageView(
        //             svgPath: ImageConstant.imgFavorite,
        //           ),
        //         ),
        //         alignment: Alignment.bottomRight,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  previewBack(String competitionId, String competitionTitle, String userId) {
    print("preview full screen to previewBack");
    print(competitionTitle);
    Get.toNamed(AppRoutes.previewScreen, arguments: {
      'competitionId': competitionId,
      'competitionTitle': competitionTitle,
      'userId': userId,
    });
  }
}
