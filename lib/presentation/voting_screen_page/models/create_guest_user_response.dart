import 'dart:convert';

CreateGuestUserResponse createGuestUserResponseFromJson(String str) =>
    CreateGuestUserResponse.fromJson(json.decode(str));

String createGuestUserResponseToJson(CreateGuestUserResponse data) =>
    json.encode(data.toJson());

class CreateGuestUserResponse {
  bool status;
  String message;
  int data;

  CreateGuestUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateGuestUserResponse.fromJson(Map<String, dynamic> json) =>
      CreateGuestUserResponse(
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
