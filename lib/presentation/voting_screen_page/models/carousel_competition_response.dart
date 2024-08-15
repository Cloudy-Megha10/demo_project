import 'dart:convert';

CarouselCompetitionResponse globalTrendingResponseFromJson(String str) =>
    CarouselCompetitionResponse.fromJson(json.decode(str));

String globalTrendingResponseToJson(CarouselCompetitionResponse data) =>
    json.encode(data.toJson());

class CarouselCompetitionResponse {
  bool status;
  String message;
  List<Datum> data;

  CarouselCompetitionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CarouselCompetitionResponse.fromJson(Map<String, dynamic> json) =>
      CarouselCompetitionResponse(
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
  dynamic imageId;
  String title;
  String categoryTitle;
  dynamic imageLocation;
  int categoryId;
  int minimumVotes;
  int score;

  Datum({
    required this.competitionId,
    required this.imageId,
    required this.title,
    required this.categoryTitle,
    required this.imageLocation,
    required this.categoryId,
    required this.minimumVotes,
    required this.score,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        imageId: json["ImageId"],
        title: json["Title"],
        categoryTitle: json["CategoryTitle"],
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
        "ImageLocation": imageLocation,
        "CategoryId": categoryId,
        "MinimumVotes": minimumVotes,
        "Score": score
      };
}
