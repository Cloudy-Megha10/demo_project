// To parse this JSON data, do
//
//     final competitionCreationResponse = competitionCreationResponseFromJson(jsonString);

import 'dart:convert';

CompetitionCreationResponse competitionCreationResponseFromJson(String str) =>
    CompetitionCreationResponse.fromJson(json.decode(str));

String competitionCreationResponseToJson(CompetitionCreationResponse data) =>
    json.encode(data.toJson());

class CompetitionCreationResponse {
  bool status;
  String message;
  dynamic data;

  CompetitionCreationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompetitionCreationResponse.fromJson(Map<String, dynamic> json) =>
      CompetitionCreationResponse(
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
