import 'dart:convert';

GetMyCompetitionsResponse getMyCompetitionsResponseFromJson(String str) =>
    GetMyCompetitionsResponse.fromJson(json.decode(str));

String getMyCompetitionsResponseToJson(GetMyCompetitionsResponse data) =>
    json.encode(data.toJson());

class GetMyCompetitionsResponse {
  bool status;
  String message;
  List<Datum> data;

  GetMyCompetitionsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMyCompetitionsResponse.fromJson(Map<String, dynamic> json) =>
      GetMyCompetitionsResponse(
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
  int categoryId;
  int minimumVotes;
  String description;
  String location;
  int createdBy;
  DateTime createdAt;
  String status;
  int price;
  bool isFeatured;
  String imageLocation;
  int daysToUpload;
  int daysToEnd;

  Datum({
    required this.competitionId,
    required this.title,
    required this.categoryId,
    required this.minimumVotes,
    required this.description,
    required this.location,
    required this.createdBy,
    required this.createdAt,
    required this.status,
    required this.price,
    required this.isFeatured,
    required this.imageLocation,
    required this.daysToUpload,
    required this.daysToEnd,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        title: json["Title"],
        categoryId: json["CategoryId"],
        minimumVotes: json["MinimumVotes"],
        description: json["Description"],
        location: json["Location"],
        createdBy: json["CreatedBy"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        status: json["Status"],
        price: json["Price"],
        isFeatured: json["IsFeatured"],
        imageLocation: json["ImageLocation"],
        daysToUpload: json["DaysToUpload"],
        daysToEnd: json["DaysToEnd"],
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "Title": title,
        "CategoryId": categoryId,
        "MinimumVotes": minimumVotes,
        "Description": description,
        "Location": location,
        "CreatedBy": createdBy,
        "CreatedAt": createdAt.toIso8601String(),
        "Status": status,
        "Price": price,
        "IsFeatured": isFeatured,
        "ImageLocation": imageLocation,
        "DaysToUpload": daysToUpload,
        "DaysToEnd": daysToEnd,
      };
}
