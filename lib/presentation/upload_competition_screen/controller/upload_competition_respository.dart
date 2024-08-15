import 'dart:convert';
import 'dart:io';

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../enter_otp_screen/models/register_response.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/competition_creation_response.dart';
import '../models/get_category_response.dart'; // Import the http_parser package

class UploadCompetitionRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();
  Future<CommonResponse<CompetitionCreationResponse>> addCompetitions(
      String competitionTitle,
      dynamic competitionCategory,
      String competitionDescription,
      dynamic competitionLocation,
      File? fileName1,
      String minimumNoOFVotes,
      dynamic price,
      dynamic isFeatureEnabled,
      dynamic daysToEnd,
      dynamic daysToUpload) async {
    try {
      final userId = await _secureStorage.getUserId();
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'multipart/form-data'
      };

      Map<String, dynamic> fields = {
        'Title': competitionTitle,
        'Description': competitionDescription,
        'Location': competitionLocation,
        'CategoryId': competitionCategory,
        'ImageFile': fileName1 != null ? fileName1.toString() : null,
        'MinimumNumberOfVotes': minimumNoOFVotes,
        'Price': price,
        'IsFeatured': isFeatureEnabled,
        'DaysToEnd': daysToEnd,
        'DaysToUpload': daysToUpload,
        'userId': userId
      };

      print("fields");
      print(fields);

      var request = http.MultipartRequest(
          'POST', Uri.parse("${UrlList.createCompetitionPostUrl}"));
      print("request");
      print(request);

      request.headers.addAll(headers);
      Map<String, String> stringFields =
          fields.map((key, value) => MapEntry(key, value.toString()));
      request.fields.addAll(stringFields);

      if (fileName1 != null) {
        var imageFile = await http.MultipartFile.fromPath(
          'ImageFile',
          fileName1.path,
        );
        request.files.add(imageFile);
        print("imageFile");
        print(imageFile);
      }

      var response = await request.send();
      final responseBody = await response.stream.transform(utf8.decoder).join();
      print("response");
      print(response);
      print(responseBody);

      // Handle the response
      if (response.statusCode == 200) {
        print('Request successful');
        print('Response body: $responseBody');
        // Parse the response body as needed
        CompetitionCreationResponse res =
            CompetitionCreationResponse.fromJson(json.decode(responseBody));
        CommonResponse<CompetitionCreationResponse> resq =
            CommonResponse(res.status, res, res.message);
        return resq;
      } else {
        print("error message");
        print("${response.statusCode}");
        print('Request failed with status: ${response.statusCode}');
        CompetitionCreationResponse res =
            CompetitionCreationResponse.fromJson(json.decode(responseBody));
        CommonResponse<CompetitionCreationResponse> resq =
            CommonResponse.withoutdata(res.status, res.message);
        return resq;
      }
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CompetitionCreationResponse> resq =
          CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  // BUSINESS CLIENT INFO GET API

  Future<CommonResponse<GetCategories>> getCategories() async {
    try {
      var response = await _provider.get(UrlList.getAllCategoriesUrl, {
        'Content-Type': 'application/json',
      });
      print("getAllCategoriesUrl");
      print(
        UrlList.getAllCategoriesUrl,
      );
      print(response);

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
}
