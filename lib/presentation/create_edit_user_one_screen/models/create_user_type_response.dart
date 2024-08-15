// To parse this JSON data, do
//
//     final createUserTypeResponse = createUserTypeResponseFromJson(jsonString);

import 'dart:convert';

CreateUserTypeResponse createUserTypeResponseFromJson(String str) =>
    CreateUserTypeResponse.fromJson(json.decode(str));

String createUserTypeResponseToJson(CreateUserTypeResponse data) =>
    json.encode(data.toJson());

class CreateUserTypeResponse {
  bool status;
  String message;
  int data;

  CreateUserTypeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateUserTypeResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserTypeResponse(
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
