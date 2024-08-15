// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromJson(jsonString);

import 'dart:convert';

GetUserResponse getUserResponseFromJson(String str) =>
    GetUserResponse.fromJson(json.decode(str));

String getUserResponseToJson(GetUserResponse data) =>
    json.encode(data.toJson());

class GetUserResponse {
  bool status;
  String message;
  Data data;

  GetUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      GetUserResponse(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data.toJson(),
      };
}

class Data {
  int id;
  int userType;
  String firstName;
  String lastName;
  String emailId;
  String mobileNumber;
  dynamic location;
  String imei;
  dynamic description;

  Data({
    required this.id,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
    this.location,
    required this.imei,
    this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        userType: json["UserType"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        imei: json["IMEI"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserType": userType,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "IMEI": imei,
        "Description": description,
      };
}
