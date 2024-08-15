import 'dart:convert';

GetMyCompetitionDetailsResponse getMyCompetitionDetailsResponseFromJson(
        String str) =>
    GetMyCompetitionDetailsResponse.fromJson(json.decode(str));

String getMyCompetitionDetailsResponseToJson(
        GetMyCompetitionDetailsResponse data) =>
    json.encode(data.toJson());

class GetMyCompetitionDetailsResponse {
  bool status;
  String message;
  Data data;

  GetMyCompetitionDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMyCompetitionDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetMyCompetitionDetailsResponse(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data.toJson(),
      };
}

class Data {
  int competitionId;
  String title;
  dynamic categoryId;
  int minimumVotes;
  String description;
  String location;
  int createdBy;
  DateTime createdAt;
  DateTime endDate;
  String status;
  int price;
  bool isFeatured;
  dynamic imageLocation;

  Data({
    required this.competitionId,
    required this.title,
    required this.categoryId,
    required this.minimumVotes,
    required this.description,
    required this.location,
    required this.createdBy,
    required this.createdAt,
    required this.endDate,
    required this.status,
    required this.price,
    required this.isFeatured,
    this.imageLocation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        competitionId: json["CompetitionId"],
        title: json["Title"],
        categoryId: json["CategoryId"],
        minimumVotes: json["MinimumVotes"],
        description: json["Description"],
        location: json["Location"],
        createdBy: json["CreatedBy"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        endDate: DateTime.parse(json["EndDate"]),
        status: json["Status"],
        price: json["Price"],
        isFeatured: json["IsFeatured"],
        imageLocation: json["ImageLocation"],
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
        "EndDate": endDate.toIso8601String(),
        "Status": status,
        "Price": price,
        "IsFeatured": isFeatured,
        "ImageLocation": imageLocation,
      };
}
