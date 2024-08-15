// To parse this JSON data, do
//
//     final registerReponse = registerReponseFromJson(jsonString);

import 'dart:convert';

RegisterReponse registerReponseFromJson(String str) =>
    RegisterReponse.fromJson(json.decode(str));

String registerReponseToJson(RegisterReponse data) =>
    json.encode(data.toJson());

class RegisterReponse {
  bool status;
  String message;
  int data;

  RegisterReponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterReponse.fromJson(Map<String, dynamic> json) =>
      RegisterReponse(
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
