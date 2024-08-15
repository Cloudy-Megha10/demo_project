import 'dart:convert';

import 'package:kainok_app/presentation/voting_screen_page/models/carousel_competition_response.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/get_near_by_comp_to_vote_response.dart';

import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/create_guest_user_response.dart';
import '../models/competition_response.dart';
import '../models/home_screen_device_reg_response.dart';

class VotingScreenRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<IsDeviceRegisteredResponse>> getDeviceRegisteredInfo(
      String? mobileNo, String? deviceId) async {
    print("mobileNoRepo1111-----");
    print(mobileNo);
    print(deviceId);

    try {
      var body = json.encode({
        "MobileNumber": mobileNo,
        "DeviceId": deviceId,
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.put(UrlList.isDeviceRegistered, body, headers);
      print("response----");
      print(response);
      IsDeviceRegisteredResponse res =
          IsDeviceRegisteredResponse.fromJson(response);
      CommonResponse<IsDeviceRegisteredResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<IsDeviceRegisteredResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

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

  Future<CommonResponse<CompetitionResponse>> getCompetitionsData(
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

      CompetitionResponse res = CompetitionResponse.fromJson(response);
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      print("error test");
      print(e);
      String errormsg = "Error in Catch Block test";
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetNearByCompToVote>> getNearByCompToVoteData(
      latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getNearByCompToVoteUrl +
              "$latitude" +
              "," +
              "$longitude" +
              "/" +
              "$userId" +
              "/" +
              "20" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });
      print("UrlList.GetNearByFeaturedCompToVote");
      print(
        UrlList.getNearByCompToVoteUrl +
            "$latitude" +
            "," +
            "$longitude" +
            "/" +
            "$userId" +
            "/" +
            "20" +
            "/" +
            "0",
      );
      print("response");
      print(response);

      GetNearByCompToVote res = GetNearByCompToVote.fromJson(response);
      CommonResponse<GetNearByCompToVote> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      print("error test");
      print(e);
      String errormsg = "Error in Catch Block test";
      CommonResponse<GetNearByCompToVote> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CompetitionResponse>> getCompetitionsByRangeData(
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

      CompetitionResponse res = CompetitionResponse.fromJson(response);
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      print("error test");
      print(e);
      String errormsg = "Error in Catch Block test";
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Trending

  Future<CommonResponse<CarouselCompetitionResponse>> getTrendingData(
      latitude, longitude) async {
    try {
      var userId = await _secureStorage.getUserId();
      print("usrIDtrending");
      print(userId);
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getNearByTrendingCompToVote +
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
      print("getNearByTrendingCompToVote");
      print(UrlList.getNearByTrendingCompToVote +
          "$latitude" +
          "%2C" +
          "$longitude" +
          "/" +
          "$userId" +
          "/" +
          "0");
      print(response);
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Global Trending

  Future<CommonResponse<CarouselCompetitionResponse>>
      getGlobalTrendingData() async {
    try {
      var userId = await _secureStorage.getUserId();
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider
          .get(UrlList.getNearByGlobalTrendingCompToVote + "$userId", {
        'Content-Type': 'application/json',
      });
      print("getNearByGlobalTrendingCompToVote");
      print(UrlList.getNearByGlobalTrendingCompToVote + "$userId");
      print(response);
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //HighPrize

  Future<CommonResponse<CarouselCompetitionResponse>> getHighPrizeData(
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
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //FeatureData

  Future<CommonResponse<CarouselCompetitionResponse>> getFeatureData(
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
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  //Closing24Hrs

  Future<CommonResponse<CarouselCompetitionResponse>> getClosing24HrsData(
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
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
