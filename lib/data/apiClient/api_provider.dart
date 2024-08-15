import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../core/app_export.dart';
import '../../core/errors/exceptions.dart';
import '../../core/network/network_info.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/logger.dart';
import '../../core/utils/progress_dialog_utils.dart';

class ApiProvider {
  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future<bool> isNetworkConnected() async {
    final isConnected = await Get.find<NetworkInfo>().isConnected();
    if (!isConnected) {
      Fluttertoast.showToast(
        msg: "No Internet Found",
        backgroundColor: ColorConstant.gray100,
      );
      throw NoInternetException('No Internet Found!');
    }
    return isConnected;
  }

///////////// GET API provider

  Future<dynamic> get(String url, [Map<String, String>? headers]) async {
    ProgressDialogUtils.showProgressDialog();
    if (await isNetworkConnected()) {
      try {
        final response = await http.get(Uri.parse(url), headers: headers);
        ProgressDialogUtils.hideProgressDialog();
        var responseJson = _response(response);
        return responseJson;
      } catch (error, stackTrace) {
        ProgressDialogUtils.hideProgressDialog();
        Logger.log(error, stackTrace: stackTrace);
      }
    }
  }

///////////// POST API provider

  Future<dynamic> post(String url, dynamic body,
      [Map<String, String>? headers]) async {
    ProgressDialogUtils.showProgressDialog();
    if (await isNetworkConnected()) {
      try {
        final uri = Uri.parse(url);
        if (headers == null || headers.isEmpty) {
          headers = {'Content-Type': 'application/json'};
        }
        var response = await http.post(uri, headers: headers, body: body);
        ProgressDialogUtils.hideProgressDialog();
        return _response(response);
      } catch (error, stackTrace) {
        ProgressDialogUtils.hideProgressDialog();
        Logger.log(error, stackTrace: stackTrace);
      }
    }
  }

///////////// PUT API provider

  Future<dynamic> put(String url, dynamic body,
      [Map<String, String>? headers]) async {
    ProgressDialogUtils.showProgressDialog();
    if (await isNetworkConnected()) {
      try {
        final uri = Uri.parse(url);
        if (headers == null || headers.isEmpty) {
          headers = {'Content-Type': 'application/json'};
        }
        var response = await http.put(uri, headers: headers, body: body);
        ProgressDialogUtils.hideProgressDialog();
        return _response(response);
      } catch (error, stackTrace) {
        ProgressDialogUtils.hideProgressDialog();
        Logger.log(error, stackTrace: stackTrace);
      }
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 401:
        // throw UnauthorisedException(response.body.toString());
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 500:
        return json.decode(response.body.toString());

      default:
        print(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
