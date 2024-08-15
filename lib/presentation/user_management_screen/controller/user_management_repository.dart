import 'dart:convert';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../../create_edit_user_screen/models/create_user_response.dart';
import '../../create_edit_user_screen/models/get_user_details_by_id_response.dart';
import '../../create_edit_user_screen/models/get_user_type_response.dart';
import '../../edit_profile_screen/models/get_user_response.dart';
import '../../edit_profile_screen/models/update_user_response.dart';
import '../models/get_all_user_response.dart';

class EditUserManagementRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  //Global Trending

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

  Future<CommonResponse<CreateUserResponse>> createUserData(
      String? firstName,
      String? lastName,
      String? mobileNumber,
      String? email,
      String? city,
      String? password,
      String? userTypeId,
      String? likedPoints,
      String? disLikedPoints,
      String? description) async {
    try {
      print("location");
      print(city);
      // GeoCode geoCode = GeoCode();
      // Coordinates coordinates = await geoCode.forwardGeocoding(address: city!);
      // String location = coordinates.latitude.toString() +
      //     ", " +
      //     coordinates.longitude.toString();
      List<Location> locations = await locationFromAddress(city!);
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;
      String location = '$latitude, $longitude';
      var body = json.encode({
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": email,
        "MobileNumber": mobileNumber,
        "Location": location,
        "DeviceId": "",
        "Password": password,
        "UserTypeId": userTypeId,
        "Description": description
      });
      print("bodycreate");
      print(body);

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      // print("body");
      // print(body);
      // print("registerUrl");
      // print(UrlList.registerUrl);
      final response =
          await _provider.post(UrlList.createUserUrl, body, headers);
      CreateUserResponse res = CreateUserResponse.fromJson(response);
      CommonResponse<CreateUserResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<CreateUserResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UserTypeDeatilsByIdResponse>> getUserTypeDetailsById(
      userTypeId) async {
    try {
      var response =
          await _provider.get(UrlList.getUserTypeByUserIdUrl + "$userTypeId", {
        'Content-Type': 'application/json',
      });
      print("getUserTypeByUserIdUrl");
      print(
        UrlList.getUserTypeByUserIdUrl + "$userTypeId",
      );
      print(response);

      UserTypeDeatilsByIdResponse res =
          UserTypeDeatilsByIdResponse.fromJson(response);
      CommonResponse<UserTypeDeatilsByIdResponse> resq =
          new CommonResponse(true, res, "success");
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UserTypeDeatilsByIdResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }

  Future<CommonResponse<UserUpdateResponse>> updateUserData(
      String? firstName,
      String? lastName,
      String? emailId,
      String? mobileNumber,
      String? userTypeId,
      String? userId,
      String? city,
      String? bio,
      dynamic isActive) async {
    print("Locatcitynnnn");
    print(city);
    // GeoCode geoCode = GeoCode();
    // Coordinates coordinates = await geoCode.forwardGeocoding(address: city!);
    // String location = coordinates.latitude.toString() +
    //     ", " +
    //     coordinates.longitude.toString();
    List<Location> locations = await locationFromAddress(city!);
    double latitude = locations[0].latitude;
    double longitude = locations[0].longitude;
    String location = '$latitude, $longitude';
    try {
      var body = json.encode({
        "UserId": userId,
        "UserTypeId": userTypeId,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "Description": bio,
        "IsActive": isActive
      });

      var headers = {
        'Content-Type': 'application/json',
        "api-supported-versions": '1.0',
      };
      print("body");
      print(body);
      print("updateUserByIdUrl");
      print(UrlList.updateUserByIdUrl);
      final response =
          await _provider.put(UrlList.updateUserByIdUrl, body, headers);
      UserUpdateResponse res = UserUpdateResponse.fromJson(response);
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<UserUpdateResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
