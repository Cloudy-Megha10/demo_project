import 'dart:convert';

CompetitionResponse competitionFromJson(String str) =>
    CompetitionResponse.fromJson(json.decode(str));

String competitionToJson(CompetitionResponse data) =>
    json.encode(data.toJson());

class CompetitionResponse {
  bool status;
  String message;
  List<Datum> data;

  CompetitionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompetitionResponse.fromJson(Map<String, dynamic> json) =>
      CompetitionResponse(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"] != null
            ? List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x)))
            : List<Datum>.from([].map((x) => Datum.fromJson(x))),
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
