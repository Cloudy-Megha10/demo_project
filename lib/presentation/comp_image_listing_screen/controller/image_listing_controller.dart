import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/core/utils/color_constant.dart';
import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/presentation/comp_image_listing_screen/models/get_comp_all_img_response.dart';
import 'package:demo_project/presentation/comp_image_listing_screen/models/image_listing_model.dart';
import 'package:demo_project/routes/app_routes.dart';

import '../models/image_listing_item_model.dart';
import 'image_listing_respository.dart';

class CompImageListingController extends GetxController {
  ImageListingItemModel imageListingModelObj = ImageListingItemModel();

  ImageListingRepository imageListingRepository = ImageListingRepository();
  SecureStorage _secureStorage = SecureStorage();
  RxString competitionTitle = "".obs;
  RxString compDescription = "".obs;
  RxInt compPrice = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  getMyImagesForComp(String compId, String compTitle) async {
    try {
      CommonResponse<GetCompetitionAllImgListResponse>
          myParticipationCompImagesResult =
          await imageListingRepository.getMyParticipationCompImageData(compId);
      imageListingModelObj.myParticipedCompImagesItemList.clear();
      print("myParticipationCompImagesResult");
      print(myParticipationCompImagesResult.Status);
      print(myParticipationCompImagesResult.Message);
      competitionTitle =
          myParticipationCompImagesResult.Data.data.competitionTitle.obs;
      compDescription =
          myParticipationCompImagesResult.Data.data.competitionDescription.obs;
      compPrice = myParticipationCompImagesResult.Data.data.price.obs;
      if (myParticipationCompImagesResult.Data.data.images.length > 0) {
        for (var entry in myParticipationCompImagesResult.Data.data.images) {
          ImageListingModel myParticipationCompImgDetailItemModel =
              ImageListingModel(
            image: entry.imageLocation != null ? entry.imageLocation : "",
          );
          imageListingModelObj.myParticipedCompImagesItemList
              .add(myParticipationCompImgDetailItemModel);
        }
        Get.toNamed(
          AppRoutes.compImageListingScreen,
          arguments: {
            'competitionId': compId,
            'competitionTitle': compTitle,
            "isCompImageListingScreen": true
          },
        );
      } else {
        Get.toNamed(
          AppRoutes.compImageListingScreen,
          arguments: {
            'competitionId': compId,
            'competitionTitle': compTitle,
            "isCompImageListingScreen": true
          },
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error in Catch Block" + e.toString(),
        backgroundColor: ColorConstant.gray100,
      );
      return null;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
