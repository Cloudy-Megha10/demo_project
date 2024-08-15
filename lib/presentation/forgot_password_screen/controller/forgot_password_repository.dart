import 'dart:convert';

import 'package:kainok_app/data/apiClient/api_provider.dart';

import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../models/forgot_password_get_response.dart';

class ForgotPasswordRepository {
  ApiProvider _provider = ApiProvider();
  //Particular Competition

  Future<CommonResponse<ForgotPasswordGetResponse>> getForgotPasswordData(
      phoneNoOrEmailId) async {
    print("phoneNoOrEmailId");
    print(phoneNoOrEmailId);
    print(UrlList.forgetPasswordGetUrl);
    print(UrlList.forgetPasswordGetUrl + "$phoneNoOrEmailId");
    try {
      var response = await _provider
          .get(UrlList.forgetPasswordGetUrl + "$phoneNoOrEmailId", {
        'Content-Type': 'application/json',
      });
      print("forgetPasswordGetUrl");
      print(UrlList.forgetPasswordGetUrl + "$phoneNoOrEmailId");
      print(response);

      ForgotPasswordGetResponse res =
          ForgotPasswordGetResponse.fromJson(response);
      CommonResponse<ForgotPasswordGetResponse> resq =
          new CommonResponse(res.status, res, res.message);
      print("resforget");
      print(res);
      print(res.status);
      print(res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<ForgotPasswordGetResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

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
