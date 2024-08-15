import 'dart:convert';

UpdateUserTypeDetailsResponse updateUserTypeDetailsResponseFromJson(
        String str) =>
    UpdateUserTypeDetailsResponse.fromJson(json.decode(str));

String updateUserTypeDetailsResponseToJson(
        UpdateUserTypeDetailsResponse data) =>
    json.encode(data.toJson());

class UpdateUserTypeDetailsResponse {
  bool status;
  String message;
  bool data;

  UpdateUserTypeDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateUserTypeDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UpdateUserTypeDetailsResponse(
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
