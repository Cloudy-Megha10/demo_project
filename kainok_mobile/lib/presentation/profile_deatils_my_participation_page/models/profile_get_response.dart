// To parse this JSON data, do
//
//     final getMyParticipateResponse = getMyParticipateResponseFromJson(jsonString);

import 'dart:convert';

GetMyParticipateResponse getMyParticipateResponseFromJson(String str) =>
    GetMyParticipateResponse.fromJson(json.decode(str));

String getMyParticipateResponseToJson(GetMyParticipateResponse data) =>
    json.encode(data.toJson());

class GetMyParticipateResponse {
  bool status;
  String message;
  List<Datum> data;

  GetMyParticipateResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMyParticipateResponse.fromJson(Map<String, dynamic> json) =>
      GetMyParticipateResponse(
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
  String status;
  int competitionId;
  int imageId;
  String title;
  String categoryTitle;
  String imageLocation;
  String imageTitle;
  int categoryId;

  Datum({
    required this.status,
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    required this.imageLocation,
    required this.imageTitle,
    required this.categoryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["Status"],
        competitionId: json["CompetitionId"],
        imageId: json["ImageId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
        imageLocation: json["ImageLocation"],
        imageTitle: json["ImageTitle"],
        categoryId: json["CategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "CompetitionId": competitionId,
        "ImageId": imageId,
        "Title": title,
        "CategoryTitle": categoryTitle,
        "ImageLocation": imageLocation,
        "ImageTitle": imageTitle,
        "CategoryId": categoryId,
      };
}
