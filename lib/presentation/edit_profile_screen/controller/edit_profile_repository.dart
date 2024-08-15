import 'dart:convert';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/get_user_response.dart';
import '../models/update_user_response.dart';

class EditProfileRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();
  //Global Trending

  Future<CommonResponse<GetUserResponse>> getUserData() async {
    final userId = await _secureStorage.getUserId();
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

  Future<CommonResponse<UserUpdateResponse>> updateUserData(
    String? firstName,
    String? lastName,
    String? emailId,
    String? city,
    String? bio,
  ) async {
    final userId = await _secureStorage.getUserId();
    final userTypeId = await _secureStorage.getUserTypeId();
    print("userId");
    print(userId);
    print("userTypeId");
    print(userTypeId);
    try {
      var body = json.encode({
        "UserId": userId,
        "UserTypeId": userTypeId,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": "",
        "Location": city,
        "Description": bio,
        "IsActive": true
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      print("body");
      print(body);
      print("registerUrl");
      print(UrlList.registerUrl);
      final response =
          await _provider.put(UrlList.updateUserUrl, body, headers);
      UserUpdateResponse res = UserUpdateResponse.fromJson(response);
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
