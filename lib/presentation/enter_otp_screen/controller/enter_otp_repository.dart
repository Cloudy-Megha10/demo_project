import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../create_account_screen/models/register_response.dart';
import '../models/register_response.dart';

class OtpRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<RegisterResponse>> registerData(
      String? firstName,
      String? lastName,
      String? mobileNumber,
      String? email,
      String? city,
      String? password,
      String? iemiNo) async {
    try {
      var body = json.encode({
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": email,
        "MobileNumber": mobileNumber,
        "Location": city,
        "DeviceId": iemiNo,
        "Password": password,
        "UserTypeId": 0,
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      print("body");
      print(body);
      print("registerUrl");
      print(UrlList.registerUrl);
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

  // Future<CommonResponse<LogInResponse>> loginPostData(
  //   String? username,
  //   String? password,
  // ) async {
  //   try {
  //     Map data = {"userId": 0, "deviceId": "string", "otp": 0, "createdBy": 0};

  //     dynamic body = json.encode(data);
  //     final response = await _provider.post(UrlList.accessTokenUrl, body);
  //     print("body");
  //     print(body);
  //     print("accessTokenUrl");
  //     print(UrlList.accessTokenUrl);
  //     return new CommonResponse(
  //         "0", LogInResponse.fromJson(response), "success");
  //   } catch (e) {
  //     String errormsg = "Error in Catch Block" + e.toString();
  //     CommonResponse<LogInResponse> resq =
  //         new CommonResponse.withoutdata("1", errormsg);
  //     print(resq);
  //     return resq;
  //   }
  // }
}
