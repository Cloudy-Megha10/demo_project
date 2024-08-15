import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/controller/profile_vote_repository.dart';
import 'package:demo_project/presentation/profile_deatils_my_vote_page/models/profile_deatils_my_vote_model.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/common_response.dart';
import '../models/my_votes_item_model.dart';
import '../models/profile_get_vote_response.dart';

class ProfileDeatilsMyVoteController extends GetxController {
  SecureStorage _secureStorage = SecureStorage();

  RxList<myVotesItemModel> myVotesItemList = RxList();

  ProfileDetailVoteRepository profileDetailVoteRepository =
      ProfileDetailVoteRepository();

  @override
  void onReady() async {
    super.onReady();
    final userId = await _secureStorage.getUserId();
    if (userId != null) {
      myVoteGetApi(userId);
    }
  }

  void myVoteGetApi(String userId) async {
    try {
      CommonResponse<GetVoteResponse> myParticipationGetResult =
          await profileDetailVoteRepository.getMyVoteData(userId);
      myVotesItemList.clear();
      for (var entry in myParticipationGetResult.Data.data) {
        myVotesItemModel profileDetailItemModel = myVotesItemModel(
            image: entry.imageLocation,
            competitionTitle: entry.title,
            score: "",
            competitionId: entry.competitionId);
        myVotesItemList.add(profileDetailItemModel);
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
