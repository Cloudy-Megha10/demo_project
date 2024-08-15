import 'dart:convert';

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/data/apiClient/api_provider.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/data/apiClient/url_list.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/carousel_competition_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/competition_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/competitions_screen_device_reg_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/create_guest_user_response.dart';
import 'package:demo_project/presentation/competitions_screen_page/models/get_near_by_comp_to_participate_response.dart';

class CompetitionsScreenRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<IsDeviceRegisteredResponse>> getDeviceRegisteredInfo(
      String? deviceId) async {
    try {
      var body = json.encode({
        "DeviceId": deviceId,
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.put(UrlList.isDeviceRegistered, body, headers);
      IsDeviceRegisteredResponse res =
          IsDeviceRegisteredResponse.fromJson(response);
      CommonResponse<IsDeviceRegisteredResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
      CreateGuestUserResponse res = CreateGuestUserResponse.fromJson(response);
      CommonResponse<CreateGuestUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
              "," +
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

      CompetitionResponse res = CompetitionResponse.fromJson(response);
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block test";
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetNearByCompToParticipate>>
      getNearByCompToParticipateData(latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var url = UrlList.getNearByCompToParticipateUrl +
          "$latitude,$longitude" +
          "/" +
          "$userId" +
          "/" +
          "10" +
          "/" +
          "0";

      var response = await _provider.get(url, {
        'Content-Type': 'application/json',
      });

      GetNearByCompToParticipate res =
          GetNearByCompToParticipate.fromJson(response);
      CommonResponse<GetNearByCompToParticipate> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block test";
      CommonResponse<GetNearByCompToParticipate> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CompetitionResponse>> getCompetitionsByRangeData(
      latitude, longitude, distance) async {
    try {
      var userId = await _secureStorage.getUserId();
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getNearByCompetitionUrl +
              "$latitude,$longitude" +
              "/" +
              "$userId" +
              "/" +
              "$distance" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });

      CompetitionResponse res = CompetitionResponse.fromJson(response);
      CommonResponse<CompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getTrendingUrl +
              "$latitude,$longitude" +
              "/" +
              "$userId" +
              "/" +
              "0",
          {
            'Content-Type': 'application/json',
          });

      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
      var response =
          await _provider.get(UrlList.getGlobalTrendingUrl + "/" + "$userId", {
        'Content-Type': 'application/json',
      });
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
          UrlList.getHighPrizeUrl + "$latitude,$longitude" + "/" + "$userId", {
        'Content-Type': 'application/json',
      });
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
              "$latitude,$longitude" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
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
              "$latitude,$longitude" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      CarouselCompetitionResponse res =
          CarouselCompetitionResponse.fromJson(response);
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
      String errormsg = "Kindly Create the competition";
      CommonResponse<CarouselCompetitionResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
