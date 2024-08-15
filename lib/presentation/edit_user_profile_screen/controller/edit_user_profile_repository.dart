import 'dart:convert';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/get_user_response.dart';
import '../models/update_user_response.dart';

class EditUserProfileRepository {
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
      dynamic city,
      String? bio,
      String? location) async {
    final userId = await _secureStorage.getUserId();
    final mobileNo = await _secureStorage.getDeviceInfoMobileNo();

    try {
      var body = json.encode({
        "UserId": userId,
        "UserTypeId": 0,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNo,
        "Location": location,
        "Description": bio,
        "IsActive": true
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.put(UrlList.updateUserUrl, body, headers);
      print("body");
      print(body);
      print(UrlList.updateUserUrl);
      print(response);

      UserUpdateResponse res = UserUpdateResponse.fromJson(response);
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block " + e.toString();
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
