// To parse this JSON data, do
//
//     final getNearByFeaturedCompToVote = getNearByFeaturedCompToVoteFromJson(jsonString);

import 'dart:convert';

GetNearByCompToVote getNearByFeaturedCompToVoteFromJson(String str) =>
    GetNearByCompToVote.fromJson(json.decode(str));

String getNearByFeaturedCompToVoteToJson(GetNearByCompToVote data) =>
    json.encode(data.toJson());

class GetNearByCompToVote {
  bool status;
  String message;
  List<Datum> data;

  GetNearByCompToVote({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetNearByCompToVote.fromJson(Map<String, dynamic> json) =>
      GetNearByCompToVote(
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
  dynamic imageTitle;
  dynamic imageCreatedAt;
  String? imageLocation;
  int categoryId;
  int minimumVotes;
  int score;

  Datum({
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    this.imageTitle,
    this.imageCreatedAt,
    this.imageLocation,
    required this.categoryId,
    required this.minimumVotes,
    required this.score,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        imageId: json["ImageId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
        imageTitle: json["ImageTitle"],
        imageCreatedAt: json["ImageCreatedAt"],
        imageLocation: json["ImageLocation"],
        categoryId: json["CategoryId"],
        minimumVotes: json["MinimumVotes"],
        score: json["Score"],
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "ImageId": imageId,
        "Title": title,
        "CategoryTitle": categoryTitle,
        "ImageTitle": imageTitle,
        "ImageCreatedAt": imageCreatedAt,
        "ImageLocation": imageLocation,
        "CategoryId": categoryId,
        "MinimumVotes": minimumVotes,
        "Score": score,
      };
}
