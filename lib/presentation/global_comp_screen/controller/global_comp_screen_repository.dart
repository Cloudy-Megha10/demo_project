import 'dart:convert';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/create_guest_user_response.dart';
import '../models/get_category_response.dart';
import '../models/get_closing_response.dart';
import '../models/get_feature_response.dart';
import '../models/get_global_trending_response.dart';
import '../models/get_high_prize_response.dart';
import '../models/get_trending_response.dart';

class GlobalCompScreenRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<CreateGuestUserResponse>> saveGuestUser(
      String? mobileNo,
      String? deviceId,
      String? location,
      String? description) async {
    print("mobileNoRepo1111-----");
    print(mobileNo);
    print(deviceId);

    try {
      var body = json.encode({
        "MobileNumber": mobileNo,
        "Location": "14.458024864951938, 75.91433677116353",
        "DeviceId": deviceId,
        "Description": "Guest User"
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.post(UrlList.createGuestUser, body, headers);
      print("response----");
      print(response);
      CreateGuestUserResponse res = CreateGuestUserResponse.fromJson(response);
      CommonResponse<CreateGuestUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CreateGuestUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Category Data

  Future<CommonResponse<Competition>> getCompetitionsData(
      latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getNearByCompetitionUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId" +
              "/" +
              "5" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });
      print("UrlList.getNearByCompetitionUrl");
      print(
        UrlList.getNearByCompetitionUrl +
            "$latitude" +
            "%2C" +
            "$longitude" +
            "/" +
            "$userId" +
            "/" +
            "5" +
            "/" +
            "0",
      );
      print("response");
      print(response);

      Competition res = Competition.fromJson(response);
      CommonResponse<Competition> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      print("error test");
      print(e);
      String errormsg = "Error in Catch Block test";
      CommonResponse<Competition> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<Competition>> getCompetitionsByRangeData(
      latitude, longitude, distance) async {
    print("longitude");
    print(longitude);
    try {
      var userId = await _secureStorage.getUserId();
      print("usrIDcompe");
      print(userId);
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getNearByCompetitionUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId" +
              "/" +
              "$distance" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });
      print("UrlList.getNearByCompetitionUrl");
      print(
        UrlList.getNearByCompetitionUrl +
            "$latitude" +
            "%2C" +
            "$longitude" +
            "/" +
            "$distance" +
            "/" +
            "0",
      );
      print(response);

      Competition res = Competition.fromJson(response);
      CommonResponse<Competition> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      print("error test");
      print(e);
      String errormsg = "Error in Catch Block test";
      CommonResponse<Competition> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Trending

  Future<CommonResponse<GetTrending>> getTrendingData(
      latitude, longitude) async {
    try {
      var userId = await _secureStorage.getUserId();
      print("usrIDtrending");
      print(userId);
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getTrendingUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });

      GetTrending res = GetTrending.fromJson(response);
      CommonResponse<GetTrending> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<GetTrending> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Global Trending

  Future<CommonResponse<GlobalTrendingResponse>> getGlobalTrendingData() async {
    try {
      var userId = await _secureStorage.getUserId();
      if (userId == null) {
        userId = "0";
      }
      var response =
          await _provider.get(UrlList.getGlobalTrendingUrl + "/" + "$userId", {
        'Content-Type': 'application/json',
      });
      print("getGlobalTrendingUrl");
      print(UrlList.getGlobalTrendingUrl + "/" + "$userId");
      print(response);
      GlobalTrendingResponse res = GlobalTrendingResponse.fromJson(response);
      CommonResponse<GlobalTrendingResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<GlobalTrendingResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //HighPrize

  Future<CommonResponse<GetHighPrizeResponse>> getHighPrizeData(
      latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getHighPrizeUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      print("getHighPrizeUrl");
      print(
        UrlList.getHighPrizeUrl +
            "$latitude" +
            "%2C" +
            "$longitude" +
            "/" +
            "$userId",
      );
      print(response);
      GetHighPrizeResponse res = GetHighPrizeResponse.fromJson(response);
      CommonResponse<GetHighPrizeResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<GetHighPrizeResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //FeatureData

  Future<CommonResponse<FeatureCompetitionResponse>> getFeatureData(
      latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getFeatureCompetitionUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      print("FeatureCompetitionResponse");
      print(
        UrlList.getFeatureCompetitionUrl +
            "$latitude" +
            "%2C" +
            "$longitude" +
            "/" +
            "$userId",
      );
      print(response);
      FeatureCompetitionResponse res =
          FeatureCompetitionResponse.fromJson(response);
      CommonResponse<FeatureCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<FeatureCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Closing24Hrs

  Future<CommonResponse<ClosingCompetitionResponse>> getClosing24HrsData(
      latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getClosingCompetitionUrl +
              "$latitude" +
              "%2C" +
              "$longitude" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      print("getClosing24HrsData");
      print(
        UrlList.getClosingCompetitionUrl +
            "$latitude" +
            "%2C" +
            "$longitude" +
            "/" +
            "$userId",
      );
      print(response);
      ClosingCompetitionResponse res =
          ClosingCompetitionResponse.fromJson(response);
      CommonResponse<ClosingCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<ClosingCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
