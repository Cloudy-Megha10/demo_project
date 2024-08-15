// To parse this JSON data, do
//
//     final forgotPasswordGetResponse = forgotPasswordGetResponseFromJson(jsonString);

import 'dart:convert';

ForgotPasswordGetResponse forgotPasswordGetResponseFromJson(String str) =>
    ForgotPasswordGetResponse.fromJson(json.decode(str));

String forgotPasswordGetResponseToJson(ForgotPasswordGetResponse data) =>
    json.encode(data.toJson());

class ForgotPasswordGetResponse {
  bool status;
  String message;
  String data;

  ForgotPasswordGetResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ForgotPasswordGetResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordGetResponse(
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
