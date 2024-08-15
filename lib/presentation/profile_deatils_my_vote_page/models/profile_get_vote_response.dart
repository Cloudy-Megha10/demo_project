// To parse this JSON data, do
//
//     final getVoteResponse = getVoteResponseFromJson(jsonString);

import 'dart:convert';

GetVoteResponse getVoteResponseFromJson(String str) =>
    GetVoteResponse.fromJson(json.decode(str));

String getVoteResponseToJson(GetVoteResponse data) =>
    json.encode(data.toJson());

class GetVoteResponse {
  bool status;
  String message;
  List<Datum> data;

  GetVoteResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetVoteResponse.fromJson(Map<String, dynamic> json) =>
      GetVoteResponse(
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
  dynamic competitionId;
  dynamic title;
  dynamic categoryTitle;
  dynamic imageLocation;
  dynamic imageTitle;
  dynamic status;
  dynamic score;
  dynamic liked;

  Datum({
    required this.competitionId,
    required this.title,
    required this.categoryTitle,
    required this.imageLocation,
    required this.imageTitle,
    required this.status,
    required this.score,
    required this.liked,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
        imageLocation: json["ImageLocation"],
        imageTitle: json["ImageTitle"],
        status: json["Status"],
        score: json["Score"],
        liked: json["Liked"],
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "Title": title,
        "CategoryTitle": categoryTitle,
        "ImageLocation": imageLocation,
        "ImageTitle": imageTitle,
        "Status": status,
        "Score": score,
        "Liked": liked,
      };
}
