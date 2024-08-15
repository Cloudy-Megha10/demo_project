import 'dart:convert';

GetParticipationDetailsResponse getParticipationDetailsResponseFromJson(
        String str) =>
    GetParticipationDetailsResponse.fromJson(json.decode(str));

String getParticipationDetailsResponseToJson(
        GetParticipationDetailsResponse data) =>
    json.encode(data.toJson());

class GetParticipationDetailsResponse {
  bool status;
  String message;
  List<Datum> data;

  GetParticipationDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetParticipationDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetParticipationDetailsResponse(
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
  String competitionTitle;
  String imageTitle;
  String imageLocation;
  String imageDescription;
  String status;
  String userName;
  String createdBy;
  int totalLikes;
  int totalDisLikes;

  Datum({
    required this.competitionId,
    required this.competitionTitle,
    required this.imageTitle,
    required this.imageLocation,
    required this.imageDescription,
    required this.status,
    required this.userName,
    required this.createdBy,
    required this.totalLikes,
    required this.totalDisLikes,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        competitionId: json["CompetitionId"],
        competitionTitle: json["CompetitionTitle"],
        imageTitle: json["ImageTitle"],
        imageLocation: json["ImageLocation"],
        imageDescription: json["ImageDescription"],
        status: json["Status"],
        userName: json["UserName"],
        createdBy: json["CreatedBy"],
        totalLikes: json["TotalLikes"],
        totalDisLikes: json["TotalDisLikes"],
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "CompetitionTitle": competitionTitle,
        "ImageTitle": imageTitle,
        "ImageLocation": imageLocation,
        "ImageDescription": imageDescription,
        "Status": status,
        "UserName": userName,
        "CreatedBy": createdBy,
        "TotalLikes": totalLikes,
        "TotalDisLikes": totalDisLikes,
      };
}
