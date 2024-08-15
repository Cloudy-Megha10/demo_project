import 'dart:convert';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../create_account_screen/models/register_response.dart';
import '../../enter_otp_screen/models/register_response.dart';

class LoginRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<RegisterResponse>> registerData(
      String? firstName,
      String? lastName,
      String? email,
      dynamic latitude,
      dynamic longitude,
      String? iemiNo) async {
    try {
      var body = json.encode({
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": email,
        "MobileNumber": "",
        "Location": latitude.toString() + "," + longitude.toString(),
        "DeviceId": iemiNo,
        "Password": "",
        "UserTypeId": 0,
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      // print("body");
      // print(body);
      // print("registerUrl");
      // print(UrlList.registerUrl);
      final response = await _provider.post(UrlList.registerUrl, body, headers);
      RegisterResponse res = RegisterResponse.fromJson(response);
      CommonResponse<RegisterResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<RegisterResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
