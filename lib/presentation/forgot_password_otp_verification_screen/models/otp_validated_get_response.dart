// To parse this JSON data, do
//
//     final otpValidatedGetResponse = otpValidatedGetResponseFromJson(jsonString);

import 'dart:convert';

OtpValidatedGetResponse otpValidatedGetResponseFromJson(String str) =>
    OtpValidatedGetResponse.fromJson(json.decode(str));

String otpValidatedGetResponseToJson(OtpValidatedGetResponse data) =>
    json.encode(data.toJson());

class OtpValidatedGetResponse {
  bool status;
  String message;
  bool data;

  OtpValidatedGetResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OtpValidatedGetResponse.fromJson(Map<String, dynamic> json) =>
      OtpValidatedGetResponse(
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
