// To parse this JSON data, do
//
//     final globalTrendingResponse = globalTrendingResponseFromJson(jsonString);

import 'dart:convert';

GlobalTrendingResponse globalTrendingResponseFromJson(String str) =>
    GlobalTrendingResponse.fromJson(json.decode(str));

String globalTrendingResponseToJson(GlobalTrendingResponse data) =>
    json.encode(data.toJson());

class GlobalTrendingResponse {
  bool status;
  String message;
  List<Datum> data;

  GlobalTrendingResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GlobalTrendingResponse.fromJson(Map<String, dynamic> json) =>
      GlobalTrendingResponse(
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
  String imageLocation;
  int categoryId;
  int minimumVotes;

  Datum({
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    required this.imageLocation,
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
