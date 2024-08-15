import 'dart:convert';

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:demo_project/data/apiClient/api_provider.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/data/apiClient/url_list.dart';
import 'package:demo_project/presentation/category_listing_screen/models/category_create_guest_user_response.dart';
import 'package:demo_project/presentation/category_listing_screen/models/competitions_by_category_response.dart';
import 'package:demo_project/presentation/category_listing_screen/models/vote_item_model.dart';
import 'package:demo_project/presentation/comp_image_listing_screen/models/get_particular_competition.dart';
import 'package:demo_project/presentation/preview_screen/models/preview_vote_response.dart';

class CategoryListingRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();
  Future<CommonResponse<CompetitionsByCategory>>
      getParticipationCompetitionsByCategoryData(
          categoryId, latitude, longitude) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var url = UrlList.getParticipationCompetitionsByCategoryUrl +
          "$latitude,$longitude" +
          "/" +
          "$userId" +
          "/" +
          "$categoryId" +
          "/" +
          "15" +
          "/" +
          "0";
      var response = await _provider.get(url, {
        'Content-Type': 'application/json',
      });

      CompetitionsByCategory res = CompetitionsByCategory.fromJson(response);
      CommonResponse<CompetitionsByCategory> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CompetitionsByCategory> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CompetitionsByCategory>>
      getVotingCompetitionsByCategoryData(categoryId) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getVotingCompetitionsByCategoryUrl +
              "$categoryId" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });

      CompetitionsByCategory res = CompetitionsByCategory.fromJson(response);
      CommonResponse<CompetitionsByCategory> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CompetitionsByCategory> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CategoryCreateGuestUserResponse>> saveGuestUser(
    String? mobileNo,
    String? deviceId,
    String? latitude,
    String? longitude,
    String? description,
  ) async {
    try {
      var body = json.encode({
        "MobileNumber": mobileNo,
        "Location": "$latitude,$longitude",
        "DeviceId": deviceId,
        "Description": "Guest User"
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.post(UrlList.createGuestUser, body, headers);
      CategoryCreateGuestUserResponse res =
          CategoryCreateGuestUserResponse.fromJson(response);
      CommonResponse<CategoryCreateGuestUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CategoryCreateGuestUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<CompetitionDetailsResponse>> getCompetitionDetailsById(
      competitionId) async {
    var userId = await _secureStorage.getUserId();
    if (userId == null) {
      userId = "0";
    }
    try {
      var response = await _provider.get(
          UrlList.getCompetitionDetailsByIdAndUserIdUrl +
              "$competitionId" +
              "/" +
              "$userId",
          {
            'Content-Type': 'application/json',
          });
      CompetitionDetailsResponse res =
          CompetitionDetailsResponse.fromJson(response);
      CommonResponse<CompetitionDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CompetitionDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<VotePostResponse>> votePostedData(
    List<VoteItemModel> votedImages,
  ) async {
    try {
      var body = jsonEncode(votedImages
              .map((e) => {
                    "compId": e.compId,
                    "imageId": e.imageId,
                    "userId": e.userId,
                    "liked": e.liked
                  })
              .toList())
          .toString();

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response = await _provider.post(UrlList.votePostUrl, body, headers);
      VotePostResponse res = VotePostResponse.fromJson(response);
      CommonResponse<VotePostResponse> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block " + stackTrace.toString();
      CommonResponse<VotePostResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
