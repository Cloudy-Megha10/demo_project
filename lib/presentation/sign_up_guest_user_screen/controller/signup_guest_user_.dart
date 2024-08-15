import 'dart:convert';

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/presentation/create_account_screen/models/register_response.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../models/signup_guest_user_.dart';

class SignUpGuestUserRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<SignUpGuestUserResponse>> updateGuestUserRegistration(
      String? firstName,
      String? lastName,
      String? mobileNumber,
      String? email,
      String? city,
      String? password,
      bool isSocialMediaUser,
      String? socialMediaName) async {
    dynamic userId = await _secureStorage.getUserId();
    print("userIdGuestUser");
    print(userId);
    try {
      var body = json.encode({
        "UserId": userId,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": email,
        "MobileNumber": mobileNumber,
        "Location": city,
        "Password": password,
        "IsActive": true,
        "IsSocialMediaUser": isSocialMediaUser,
        "SocialMediaName": socialMediaName
      });
      print("GuestUserbody");
      print(body);

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.put(UrlList.signUpGuestUser, body, headers);
      print("response----");
      print(response);
      SignUpGuestUserResponse res = SignUpGuestUserResponse.fromJson(response);
      CommonResponse<SignUpGuestUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<SignUpGuestUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
