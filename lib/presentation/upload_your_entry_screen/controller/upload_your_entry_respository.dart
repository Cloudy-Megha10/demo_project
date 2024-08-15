import 'dart:convert';
import 'dart:io';

import 'package:demo_project/core/utils/flutter_secure_storage.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../enter_otp_screen/models/register_response.dart';
import '../models/add_image_response.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import the http_parser package

class UploadYourEntryRepositoty {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();
  Future<CommonResponse<AddImageResponse>> addImagesToParticularCompetition(
    String competitionId,
    String competitionTitle,
    String competitionDescription,
    File fileName1,
  ) async {
    final userId = await _secureStorage.getUserId();
    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'multipart/form-data'
      };

      print("headers");
      print(headers);

      Map<String, String> fields = {
        'CompetitionId': competitionId,
        'UserId': userId.toString(),
        'Title': competitionTitle,
        'Description': competitionDescription,
      };

      print("fields");
      print(fields);

      var request = http.MultipartRequest(
          'POST', Uri.parse("${UrlList.addImagesPostUrl}"));
      print("request");
      print(request);

      request.headers.addAll(headers);
      request.fields.addAll(fields);

      var imageFile = await http.MultipartFile.fromPath(
        'ImageFiles',
        fileName1.path,
      );
      request.files.add(imageFile);
      print("imageFiles");
      print(imageFile);

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
        AddImageResponse res =
            AddImageResponse.fromJson(json.decode(responseBody));
        CommonResponse<AddImageResponse> resq =
            CommonResponse(true, res, "success");
        return resq;
      } else {
        print('Request failed with status: ${response.statusCode}');
        CommonResponse<AddImageResponse> resq =
            CommonResponse.withoutdata(false, 'Request failed');
        return resq;
      }
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<AddImageResponse> resq =
          CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
