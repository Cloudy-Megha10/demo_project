import 'dart:convert';

CategoryCreateGuestUserResponse createGuestUserResponseFromJson(String str) =>
    CategoryCreateGuestUserResponse.fromJson(json.decode(str));

String createGuestUserResponseToJson(CategoryCreateGuestUserResponse data) =>
    json.encode(data.toJson());

class CategoryCreateGuestUserResponse {
  bool status;
  String message;
  int data;

  CategoryCreateGuestUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoryCreateGuestUserResponse.fromJson(Map<String, dynamic> json) =>
      CategoryCreateGuestUserResponse(
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
