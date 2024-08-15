// To parse this JSON data, do
//
//     final passwordUpdateResponse = passwordUpdateResponseFromJson(jsonString);

import 'dart:convert';

PasswordUpdateResponse passwordUpdateResponseFromJson(String str) =>
    PasswordUpdateResponse.fromJson(json.decode(str));

String passwordUpdateResponseToJson(PasswordUpdateResponse data) =>
    json.encode(data.toJson());

class PasswordUpdateResponse {
  bool status;
  String message;
  bool data;

  PasswordUpdateResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PasswordUpdateResponse.fromJson(Map<String, dynamic> json) =>
      PasswordUpdateResponse(
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
