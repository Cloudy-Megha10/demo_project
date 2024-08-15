import 'package:kainok_app/core/utils/flutter_secure_storage.dart';
import 'package:kainok_app/presentation/profile_deatils_my_participation_tab_container_screen/models/user_logout_response.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../edit_profile_screen/models/get_user_response.dart';

class NavigationRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<GetUserResponse>> getUserData(String userId) async {
    // final userId = await _secureStorage.getUserId();
    // print("userId");
    // print(userId);
    final deviceId = await _secureStorage.getIemiNo();

    try {
      var response = await _provider
          .get(UrlList.getUserDetailUrl + "$userId" + "/" + "$deviceId", {
        'Content-Type': 'application/json',
      });
      print("getUserDetailUrl");
      print(UrlList.getUserDetailUrl + "$userId");
      print(response);
      GetUserResponse res = GetUserResponse.fromJson(response);
      CommonResponse<GetUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UserLoggedOutReponse>> logout(
      String? userId, String? deviceId) async {
    final deviceId = await _secureStorage.getIemiNo();

    try {
      var response = await _provider
          .get(UrlList.logoutUrl + "$userId" + "/" + "$deviceId", {
        'Content-Type': 'application/json',
      });
      UserLoggedOutReponse res = UserLoggedOutReponse.fromJson(response);
      CommonResponse<UserLoggedOutReponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UserLoggedOutReponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
