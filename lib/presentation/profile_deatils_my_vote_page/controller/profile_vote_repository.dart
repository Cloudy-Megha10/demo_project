import 'package:demo_project/core/utils/flutter_secure_storage.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/profile_get_vote_response.dart';

class ProfileDetailVoteRepository {
  ApiProvider _provider = ApiProvider();
  //SecureStorage _secureStorage = SecureStorage();
  //Global Trending

  Future<CommonResponse<GetVoteResponse>> getMyVoteData(String userId) async {
    //final userId = await _secureStorage.getUserId();
    try {
      var response = await _provider.get(UrlList.getMyVoteUrl + "$userId", {
        'Content-Type': 'application/json',
      });
      print("getMyVoteUrl");
      print(UrlList.getMyVoteUrl + "$userId");
      print(response);
      GetVoteResponse res = GetVoteResponse.fromJson(response);
      CommonResponse<GetVoteResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetVoteResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
