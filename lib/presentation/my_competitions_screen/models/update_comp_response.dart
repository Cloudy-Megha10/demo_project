import 'dart:convert';

UpdateCompetitionDetailsResponse updateCompetitionDetailsResponseFromJson(
        String str) =>
    UpdateCompetitionDetailsResponse.fromJson(json.decode(str));

String updateCompetitionDetailsResponseToJson(
        UpdateCompetitionDetailsResponse data) =>
    json.encode(data.toJson());

class UpdateCompetitionDetailsResponse {
  bool status;
  String message;
  int data;

  UpdateCompetitionDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateCompetitionDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      UpdateCompetitionDetailsResponse(
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
