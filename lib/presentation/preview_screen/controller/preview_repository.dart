import 'dart:convert';

import 'package:kainok_app/core/utils/flutter_secure_storage.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../category_listing_screen/models/vote_item_model.dart';
import '../models/preview_vote_response.dart';

class PreviewRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<VotePostResponse>> votePostedData(
      List<VoteItemModel> votedImages) async {
    final userId = _secureStorage.getUserId();
    try {
      var body = json.encode({votedImages: votedImages});

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      // print("body");
      // print(body);
      // print("registerUrl");
      // print(UrlList.registerUrl);
      final response = await _provider.post(UrlList.votePostUrl, body, headers);
      VotePostResponse res = VotePostResponse.fromJson(response);
      CommonResponse<VotePostResponse> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<VotePostResponse> resq =
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
