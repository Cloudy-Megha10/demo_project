import 'dart:convert';

UpdateCompBottomSheetDetailsResponse
    updateCompBottomSheetDetailsResponseFromJson(String str) =>
        UpdateCompBottomSheetDetailsResponse.fromJson(json.decode(str));

String updateCompBottomSheetDetailsResponseToJson(
        UpdateCompBottomSheetDetailsResponse data) =>
    json.encode(data.toJson());

class UpdateCompBottomSheetDetailsResponse {
  bool status;
  String message;
  int data;

  UpdateCompBottomSheetDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateCompBottomSheetDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      UpdateCompBottomSheetDetailsResponse(
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
