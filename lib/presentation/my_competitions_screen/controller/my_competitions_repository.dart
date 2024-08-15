import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:kainok_app/data/apiClient/api_provider.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/data/apiClient/url_list.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/comp_details_response.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/get_categories_response.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/my_competitions_response.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/update_comp_response.dart';

class MyCompetitionsRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<GetCategories>> getCategories() async {
    try {
      var response = await _provider.get(UrlList.getAllCategoriesUrl, {
        'Content-Type': 'application/json',
      });

      GetCategories res = GetCategories.fromJson(response);
      CommonResponse<GetCategories> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetCategories> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetMyCompetitionDetailsResponse>> getCompetitionData(
      String compId) async {
    try {
      var response =
          await _provider.get(UrlList.getMyCompetitionDetailsById + "$compId", {
        'Content-Type': 'application/json',
      });
      GetMyCompetitionDetailsResponse res =
          GetMyCompetitionDetailsResponse.fromJson(response);
      CommonResponse<GetMyCompetitionDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetMyCompetitionDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetMyCompetitionsResponse>> getMyCompetitionsData(
      userId) async {
    try {
      var response =
          await _provider.get(UrlList.getMyCompetitions + "$userId", {
        'Content-Type': 'application/json',
      });
      GetMyCompetitionsResponse res =
          GetMyCompetitionsResponse.fromJson(response);
      CommonResponse<GetMyCompetitionsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetMyCompetitionsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UpdateCompetitionDetailsResponse>>
      updateCompetitionData(
    String? compId,
    String? compTitle,
    String? description,
    dynamic compCategoryId,
    dynamic compEndDate,
    String? minNumOfVotes,
    String? prizeMoney,
    bool isFeatured,
  ) async {
    try {
      final dateFormatter = DateFormat("dd/MM/yyyy");
      DateTime compEndDateStr = dateFormatter.parse(compEndDate);
      final formattedDate = DateFormat("yyyy-MM-dd").format(compEndDateStr);

      var body = json.encode({
        "Id": compId,
        "Title": compTitle,
        "Description": description,
        "CategoryId": compCategoryId ?? "2".toString(),
        "EndDate": formattedDate.toString(),
        "MinimumNumberOfVotes": minNumOfVotes,
        "Price": prizeMoney,
        "IsFeatured": isFeatured
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.post(UrlList.updateCompetition, body, headers);
      UpdateCompetitionDetailsResponse res =
          UpdateCompetitionDetailsResponse.fromJson(response);
      CommonResponse<UpdateCompetitionDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UpdateCompetitionDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
