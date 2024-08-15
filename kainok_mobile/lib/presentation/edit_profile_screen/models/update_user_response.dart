// To parse this JSON data, do
//
//     final userUpdateResponse = userUpdateResponseFromJson(jsonString);

import 'dart:convert';

UserUpdateResponse userUpdateResponseFromJson(String str) =>
    UserUpdateResponse.fromJson(json.decode(str));

String userUpdateResponseToJson(UserUpdateResponse data) =>
    json.encode(data.toJson());

class UserUpdateResponse {
  bool status;
  String message;
  int data;

  UserUpdateResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      UserUpdateResponse(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data,
      };
}
