import 'dart:convert';

import 'package:demo_project/presentation/create_account_screen/models/register_response.dart';
import 'package:demo_project/presentation/create_account_screen/models/register_through_google_response.dart';
import 'package:demo_project/presentation/sign_in_screen/models/sign_in_response.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../enter_otp_screen/models/register_response.dart';

class RegisterRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<RegisterThroughGoogleResponse>>
      registerThroughGoogleData(
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
        "SocialMediaName": "$firstName" + " " + "$lastName",
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      print("bodySignIn");
      print(body);
      print("registerUrl");
      print(UrlList.registerViaSocialMedia);
      final response =
          await _provider.post(UrlList.registerViaSocialMedia, body, headers);
      RegisterThroughGoogleResponse res =
          RegisterThroughGoogleResponse.fromJson(response);
      CommonResponse<RegisterThroughGoogleResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<RegisterThroughGoogleResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<LogInResponse>> loginData(
      String? email,
      String? password,
      dynamic latitude,
      dynamic longitude,
      String? iemiNo) async {
    print("loginDta");
    try {
      Map data = {
        "EmailId": email,
        // "Location": "14.45980,75.91546",
        "Location": latitude.toString() + "," + longitude.toString(),
        "Password": password,
        "DeviceId": iemiNo,
      };
      print("data");
      print(data);

      dynamic body = json.encode(data);
      final response = await _provider.post(UrlList.loginUrl, body);
      LogInResponse res = LogInResponse.fromJson(response);
      print("res");
      print(res);
      print(res.data);
      print(res.message);
      print(res.status);
      CommonResponse<LogInResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<LogInResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

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
