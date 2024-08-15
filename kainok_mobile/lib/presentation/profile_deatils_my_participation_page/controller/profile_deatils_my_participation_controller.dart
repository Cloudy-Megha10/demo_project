import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/core/utils/color_constant.dart';
import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/controller/profile_detail_repository.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/models/participated_item_model.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_page/models/profile_get_response.dart';

class ProfileDeatilsMyParticipationController extends GetxController {
  RxList<ParticipatedImageItemModel> myParticipedImages = RxList();
  ProfileDetailRepository profileDetailRepository = ProfileDetailRepository();
  SecureStorage _secureStorage = SecureStorage();

  @override
  void onInit() {
    super.onInit();
    myParticipationGetApi();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void myParticipationGetApi() async {
    try {
      final userId = await _secureStorage.getUserId();
      if (userId != null) {
        CommonResponse<GetMyParticipateResponse> myParticipationGetResult =
            await profileDetailRepository.getMyParticipationData(userId);
        myParticipedImages.clear();

        for (var entry in myParticipationGetResult.Data.data) {
          myParticipedImages.add(ParticipatedImageItemModel(
              competitionId: entry.competitionId,
              competitionTitle: entry.title,
              imageId: entry.imageId,
              imageLocation: entry.imageLocation,
              imageTitle: entry.imageTitle));
        }
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
