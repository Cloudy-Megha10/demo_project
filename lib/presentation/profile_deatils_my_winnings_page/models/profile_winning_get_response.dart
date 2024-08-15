// To parse this JSON data, do
//
//     final getWinnerResponse = getWinnerResponseFromJson(jsonString);

import 'dart:convert';

GetWinnerResponse getWinnerResponseFromJson(String str) =>
    GetWinnerResponse.fromJson(json.decode(str));

String getWinnerResponseToJson(GetWinnerResponse data) =>
    json.encode(data.toJson());

class GetWinnerResponse {
  bool status;
  String message;
  List<Datum> data;

  GetWinnerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetWinnerResponse.fromJson(Map<String, dynamic> json) =>
      GetWinnerResponse(
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
  int score;
  int competitionId;
  int imageId;
  String title;
  String categoryTitle;
  String imageLocation;
  int categoryId;

  Datum({
    required this.score,
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    required this.imageLocation,
    required this.categoryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        score: json["Score"],
        competitionId: json["CompetitionId"],
        imageId: json["ImageId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
        imageLocation: json["ImageLocation"],
        categoryId: json["CategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "Score": score,
        "CompetitionId": competitionId,
        "ImageId": imageId,
        "Title": title,
        "CategoryTitle": categoryTitle,
        "ImageLocation": imageLocation,
        "CategoryId": categoryId,
      };
}
