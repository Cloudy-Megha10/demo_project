import 'dart:convert';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../models/create_user_type_response.dart';
import '../models/update_user_type_response.dart';

class VoteRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();
  Future<CommonResponse<GetAllUserType>> getAllUserType() async {
    print(UrlList.getAllUserTypeUrl);
    print(UrlList.getAllUserTypeUrl);
    try {
      var response = await _provider.get(UrlList.getAllUserTypeUrl, {
        'Content-Type': 'application/json',
      });
      print("getAllUserTypeUrl");
      print(UrlList.getAllUserTypeUrl);
      print(response);

      GetAllUserType res = GetAllUserType.fromJson(response);
      CommonResponse<GetAllUserType> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetAllUserType> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CreateUserTypeResponse>> createUserTypeData(
    String? userTypeName,
    String? likedPoints,
    String? disLikedPoints,
  ) async {
    try {
      var body = json.encode({
        "Id": 0,
        "Name": userTypeName,
        "LikePoints": likedPoints,
        "DisLikePoints": disLikedPoints
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      // print("body");
      // print(body);
      // print("registerUrl");
      // print(UrlList.registerUrl);
      final response =
          await _provider.post(UrlList.createUserTypeUrl, body, headers);
      CreateUserTypeResponse res = CreateUserTypeResponse.fromJson(response);
      CommonResponse<CreateUserTypeResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CreateUserTypeResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UpdateUserTypeDetailsResponse>> updateUserTypeData(
    String? userTypeName,
    String? likedPoints,
    String? disLikedPoints,
    String? userTypeId,
  ) async {
    try {
      var body = json.encode({
        "Id": userTypeId,
        "Name": userTypeName,
        "LikePoints": likedPoints,
        "DisLikePoints": disLikedPoints
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
          await _provider.put(UrlList.updateUserTypeUrl, body, headers);
      UpdateUserTypeDetailsResponse res =
          UpdateUserTypeDetailsResponse.fromJson(response);
      CommonResponse<UpdateUserTypeDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UpdateUserTypeDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
