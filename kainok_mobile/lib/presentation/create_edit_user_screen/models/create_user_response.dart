// To parse this JSON data, do
//
//     final createUserResponse = createUserResponseFromJson(jsonString);

import 'dart:convert';

CreateUserResponse createUserResponseFromJson(String str) =>
    CreateUserResponse.fromJson(json.decode(str));

String createUserResponseToJson(CreateUserResponse data) =>
    json.encode(data.toJson());

class CreateUserResponse {
  bool status;
  String message;
  int data;

  CreateUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateUserResponse(
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
