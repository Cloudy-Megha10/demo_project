// To parse this JSON data, do
//
//     final signInThroughGoogleResponse = signInThroughGoogleResponseFromJson(jsonString);

import 'dart:convert';

RegisterThroughGoogleResponse signInThroughGoogleResponseFromJson(String str) =>
    RegisterThroughGoogleResponse.fromJson(json.decode(str));

String signInThroughGoogleResponseToJson(RegisterThroughGoogleResponse data) =>
    json.encode(data.toJson());

class RegisterThroughGoogleResponse {
  bool status;
  String message;
  Data data;

  RegisterThroughGoogleResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterThroughGoogleResponse.fromJson(Map<String, dynamic> json) =>
      RegisterThroughGoogleResponse(
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
  String sessionId;
  bool isAdmin;

  Data({
    required this.id,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
    required this.sessionId,
    required this.isAdmin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        userType: json["UserType"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        sessionId: json["SessionId"],
        isAdmin: json["IsAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserType": userType,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "SessionId": sessionId,
        "IsAdmin": isAdmin,
      };
}
