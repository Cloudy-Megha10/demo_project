import 'dart:convert';

SignUpGuestUserResponse signUpGuestUserResponseFromJson(String str) =>
    SignUpGuestUserResponse.fromJson(json.decode(str));

String signUpGuestUserResponseToJson(SignUpGuestUserResponse data) =>
    json.encode(data.toJson());

class SignUpGuestUserResponse {
  bool status;
  String message;
  int data;

  SignUpGuestUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignUpGuestUserResponse.fromJson(Map<String, dynamic> json) =>
      SignUpGuestUserResponse(
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
