// To parse this JSON data, do
//
//     final getCompetitionIdResponse = getCompetitionIdResponseFromJson(jsonString);

import 'dart:convert';

CompetitionDetailsResponse getCompetitionIdResponseFromJson(String str) =>
    CompetitionDetailsResponse.fromJson(json.decode(str));

String getCompetitionIdResponseToJson(CompetitionDetailsResponse data) =>
    json.encode(data.toJson());

class CompetitionDetailsResponse {
  bool status;
  String message;
  List<Datum> data;

  CompetitionDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompetitionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CompetitionDetailsResponse(
        status: json["Status"],
        message: json["Message"],
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int competitionId;
  int imageId;
  String title;
  String categoryTitle;
  String? imageLocation;
  int categoryId;
  int minimumVotes;

  Datum({
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    this.imageLocation,
    required this.categoryId,
    required this.minimumVotes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        imageId: json["ImageId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
        imageLocation: json["ImageLocation"],
        categoryId: json["CategoryId"],
        minimumVotes: json["MinimumVotes"],
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "ImageId": imageId,
        "Title": title,
        "CategoryTitle": categoryTitle,
        "ImageLocation": imageLocation,
        "CategoryId": categoryId,
        "MinimumVotes": minimumVotes,
      };
}
