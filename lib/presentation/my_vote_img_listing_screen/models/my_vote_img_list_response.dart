// To parse this JSON data, do
//
//     final getMyVoteImgListResponse = getMyVoteImgListResponseFromJson(jsonString);

import 'dart:convert';

GetMyVoteImgListResponse getMyVoteImgListResponseFromJson(String str) =>
    GetMyVoteImgListResponse.fromJson(json.decode(str));

String getMyVoteImgListResponseToJson(GetMyVoteImgListResponse data) =>
    json.encode(data.toJson());

class GetMyVoteImgListResponse {
  bool status;
  String message;
  List<Datum> data;

  GetMyVoteImgListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMyVoteImgListResponse.fromJson(Map<String, dynamic> json) =>
      GetMyVoteImgListResponse(
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
  String title;
  String categoryTitle;
  String imageLocation;
  String imageTitle;
  String status;
  int score;
  bool liked;

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
