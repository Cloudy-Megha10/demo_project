import 'package:demo_project/core/utils/flutter_secure_storage.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/profile_winning_get_response.dart';

class ProfileDetailWinnerRepository {
  ApiProvider _provider = ApiProvider();

  //Global Trending

  Future<CommonResponse<GetWinnerResponse>> getMyWinnerData(
      String userId) async {
    try {
      var response = await _provider.get(UrlList.getMyWinningsUrl + "$userId", {
        'Content-Type': 'application/json',
      });
      print("getMyWinningsUrl");
      print(UrlList.getMyWinningsUrl + "$userId");
      print(response);
      GetWinnerResponse res = GetWinnerResponse.fromJson(response);
      CommonResponse<GetWinnerResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetWinnerResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
