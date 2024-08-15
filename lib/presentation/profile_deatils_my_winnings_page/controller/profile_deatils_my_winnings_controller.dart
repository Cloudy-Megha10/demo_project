import 'package:fluttertoast/fluttertoast.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/profile_deatils_my_winnings_page/controller/profile_winning_repository.dart';
import 'package:kainok_app/presentation/profile_deatils_my_winnings_page/models/profile_deatils_my_winnings_model.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/common_response.dart';
import '../models/profile_winning_get_response.dart';

class ProfileDeatilsMyWinningsController extends GetxController {
  RxList<ProfileDeatilsMyWinningsModel> winnerList = RxList();

  ProfileDetailWinnerRepository profileDetailWinnerRepository =
      ProfileDetailWinnerRepository();

  SecureStorage _secureStorage = SecureStorage();

  @override
  void onReady() async {
    super.onReady();
    final userId = await _secureStorage.getUserId();
    if (userId != null) {
      myWinnerGetApi(userId);
    }
  }

  void myWinnerGetApi(String userId) async {
    try {
      CommonResponse<GetWinnerResponse> myParticipationGetResult =
          await profileDetailWinnerRepository.getMyWinnerData(userId);
      print("response");
      print(myParticipationGetResult.Data);
      winnerList.clear();

      for (var entry in myParticipationGetResult.Data.data) {
        ProfileDeatilsMyWinningsModel profileDetailItemModel =
            ProfileDeatilsMyWinningsModel(
          icon: entry.imageLocation,
          listName: entry.title,
          width: "",
        );
        winnerList.add(profileDetailItemModel);
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
