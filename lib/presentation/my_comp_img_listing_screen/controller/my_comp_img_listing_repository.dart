import 'dart:convert';
import 'package:geocode/geocode.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../create_edit_user_screen/models/create_user_response.dart';
import '../../create_edit_user_screen/models/get_user_details_by_id_response.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../../edit_profile_screen/models/get_user_response.dart';
import '../../edit_profile_screen/models/update_user_response.dart';
import '../models/edit_comp_bottom_sheet_details_response.dart';
import '../models/edit_comp_get_categories_response.dart';
import '../models/get_all_user_response.dart';
import '../models/get_participation_details_response.dart';
import '../models/update_comp_bottom_sheet_details.dart';

class MyCompImgListingRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<EditCompGetCategoriesResponse>> getCategories() async {
    try {
      var response = await _provider.get(UrlList.getAllCategoriesUrl, {
        'Content-Type': 'application/json',
      });
      print("getAllCategoriesUrl");
      print(
        UrlList.getAllCategoriesUrl,
      );
      print(response);

      EditCompGetCategoriesResponse res =
          EditCompGetCategoriesResponse.fromJson(response);
      CommonResponse<EditCompGetCategoriesResponse> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<EditCompGetCategoriesResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetParticipationDetailsResponse>> getCompAllImagesData(
      String compId) async {
    try {
      var response =
          await _provider.get(UrlList.getCompAllImagesDetailsUrl + "$compId", {
        'Content-Type': 'application/json',
      });
      print("getCompAllImagesDetailsUrl");
      print(UrlList.getCompAllImagesDetailsUrl + "$compId");
      print(response);
      GetParticipationDetailsResponse res =
          GetParticipationDetailsResponse.fromJson(response);
      CommonResponse<GetParticipationDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetParticipationDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<EditMyCompBottomSheetDetailsResponse>>
      getCompetitionData(String compId) async {
    try {
      var response =
          await _provider.get(UrlList.getMyCompetitionDetailsById + "$compId", {
        'Content-Type': 'application/json',
      });
      print("getCompetitionDetailsById");
      print(UrlList.getCompetitionDetailsByIdAndUserIdUrl + "$compId");
      print(response);
      EditMyCompBottomSheetDetailsResponse res =
          EditMyCompBottomSheetDetailsResponse.fromJson(response);
      CommonResponse<EditMyCompBottomSheetDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<EditMyCompBottomSheetDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UpdateCompBottomSheetDetailsResponse>>
      updateCompetitionData(
          String? compId,
          String? compTitle,
          String? description,
          dynamic compCategoryId,
          String? minNumOfVotes,
          String? prizeMoney,
          bool isFeatured,
          dynamic daysToUpload,
          dynamic daysToEnd) async {
    try {
      var body = json.encode({
        "Id": compId,
        "Title": compTitle,
        "Description": description,
        "CategoryId": compCategoryId ?? "2".toString(),
        "MinimumNumberOfVotes": minNumOfVotes,
        "Price": prizeMoney,
        "IsFeatured": isFeatured,
        "DaysToUpload": daysToUpload,
        "DaysToEnd": daysToEnd
      });
      print("bodyUpdateComp----");
      print(body);

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      final response =
          await _provider.post(UrlList.updateCompetition, body, headers);
      UpdateCompBottomSheetDetailsResponse res =
          UpdateCompBottomSheetDetailsResponse.fromJson(response);
      CommonResponse<UpdateCompBottomSheetDetailsResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UpdateCompBottomSheetDetailsResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetAllUserResponse>> getAllUserData() async {
    try {
      var response = await _provider.get(UrlList.getAllUserUrl, {
        'Content-Type': 'application/json',
      });
      print("getAllUserUrl");
      print(UrlList.getAllUserUrl);
      print(response);
      GetAllUserResponse res = GetAllUserResponse.fromJson(response);
      CommonResponse<GetAllUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetAllUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<GetUserResponse>> getUserDataById(userId) async {
    final deviceId = await _secureStorage.getIemiNo();

    try {
      var response =
          await _provider.get(UrlList.getUserDetailByIdUrl + "$userId", {
        'Content-Type': 'application/json',
      });
      print("getUserDetailByIdUrl");
      print(UrlList.getUserDetailByIdUrl + "$userId");
      print(response);
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

  Future<CommonResponse<GetAllUserType>> getUserType() async {
    try {
      var response = await _provider.get(UrlList.getAllUserTypeUrl, {
        'Content-Type': 'application/json',
      });
      print("getAllUserTypeUrl");
      print(
        UrlList.getAllUserTypeUrl,
      );
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
}
