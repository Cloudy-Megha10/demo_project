import 'dart:convert';
import 'dart:io';

import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/new_password_update_response.dart';
import 'package:http/http.dart' as http;

class NewPasswordRepository {
  ApiProvider _provider = ApiProvider();
  //Particular Competition

  Future<CommonResponse<PasswordUpdateResponse>> updateNewPasswordData(
      newPassword, emailIdOrMobile) async {
    print("newPassword");
    print(newPassword);
    print(UrlList.newPasswordUpdateUrl);

    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'multipart/form-data'
      };

      print("headers");
      print(headers);

      Map<String, dynamic> fields = {
        'Password': newPassword,
        'Identifier': emailIdOrMobile,
      };

      print("fields");
      print(fields);

      var request = http.MultipartRequest(
          'PUT', Uri.parse("${UrlList.newPasswordUpdateUrl}"));
      print("request");
      print(request);

      request.headers.addAll(headers);
      Map<String, String> stringFields =
          fields.map((key, value) => MapEntry(key, value.toString()));
      request.fields.addAll(stringFields);

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
        PasswordUpdateResponse res =
            PasswordUpdateResponse.fromJson(json.decode(responseBody));
        CommonResponse<PasswordUpdateResponse> resq =
            CommonResponse(res.status, res, res.message);
        return resq;
      } else {
        print("error message");
        print("${response.statusCode}");
        print('Request failed with status: ${response.statusCode}');
        PasswordUpdateResponse res =
            PasswordUpdateResponse.fromJson(json.decode(responseBody));
        CommonResponse<PasswordUpdateResponse> resq =
            CommonResponse.withoutdata(res.status, res.message);
        return resq;
      }
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<PasswordUpdateResponse> resq =
          CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
