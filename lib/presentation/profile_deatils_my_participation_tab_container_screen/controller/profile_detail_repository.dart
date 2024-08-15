import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/data/apiClient/api_provider.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/data/apiClient/url_list.dart';
import 'package:demo_project/presentation/edit_profile_screen/models/get_user_response.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/models/user_logout_response.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/models/user_profile_update_response.dart';

class ProfileRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<GetUserResponse>> getUserData(String userId) async {
    final deviceId = await _secureStorage.getIemiNo();

    try {
      var response = await _provider
          .get(UrlList.getUserDetailUrl + "$userId" + "/" + "$deviceId", {
        'Content-Type': 'application/json',
      });
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

  Future<CommonResponse<UserProfileResponse>> updateProfilePhoto(
    File fileName1,
  ) async {
    try {
      final userId = await _secureStorage.getUserId();
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'multipart/form-data'
      };

      Map<String, dynamic> fields = {
        'UserId': userId.toString(),
        'ImageFile': fileName1.toString(),
      };

      var request = http.MultipartRequest(
          'PUT', Uri.parse("${UrlList.updateProfilePhoto}"));

      request.headers.addAll(headers);
      Map<String, String> stringFields =
          fields.map((key, value) => MapEntry(key, value.toString()));
      request.fields.addAll(stringFields);

      var imageFile = await http.MultipartFile.fromPath(
        'ImageFile',
        fileName1.path,
      );
      request.files.add(imageFile);

      var response = await request.send();
      final responseBody = await response.stream.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        UserProfileResponse res =
            UserProfileResponse.fromJson(json.decode(responseBody));
        CommonResponse<UserProfileResponse> resq =
            CommonResponse(res.status, res, res.message);
        return resq;
      } else {
        UserProfileResponse res =
            UserProfileResponse.fromJson(json.decode(responseBody));
        CommonResponse<UserProfileResponse> resq =
            CommonResponse.withoutdata(res.status, res.message);
        return resq;
      }
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UserProfileResponse> resq =
          CommonResponse.withoutdata(false, errormsg);
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
