import 'dart:convert';

GetCompetitionAllImgListResponse getCompetitionAllImgListResponseFromJson(
        String str) =>
    GetCompetitionAllImgListResponse.fromJson(json.decode(str));

String getCompetitionAllImgListResponseToJson(
        GetCompetitionAllImgListResponse data) =>
    json.encode(data.toJson());

class GetCompetitionAllImgListResponse {
  bool status;
  String message;
  Data data;

  GetCompetitionAllImgListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCompetitionAllImgListResponse.fromJson(
          Map<String, dynamic> json) =>
      GetCompetitionAllImgListResponse(
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
  String competitionTitle;
  String competitionDescription;
  int price;
  List<Image> images;

  Data({
    required this.competitionId,
    required this.competitionTitle,
    required this.competitionDescription,
    required this.price,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        competitionId: json["CompetitionId"],
        competitionTitle: json["CompetitionTitle"],
        competitionDescription: json["CompetitionDescription"],
        price: json["Price"],
        images: List<Image>.from(json["Images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CompetitionId": competitionId,
        "CompetitionTitle": competitionTitle,
        "CompetitionDescription": competitionDescription,
        "Price": price,
        "Images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  String imageTitle;
  String imageLocation;
  String imageDescription;
  String status;
  String userName;
  String createdBy;
  DateTime createdAt;
  int totalLikes;
  int totalDisLikes;

  Image({
    required this.imageTitle,
    required this.imageLocation,
    required this.imageDescription,
    required this.status,
    required this.userName,
    required this.createdBy,
    required this.createdAt,
    required this.totalLikes,
    required this.totalDisLikes,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageTitle: json["ImageTitle"],
        imageLocation: json["ImageLocation"],
        imageDescription: json["ImageDescription"],
        status: json["Status"],
        userName: json["UserName"],
        createdBy: json["CreatedBy"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        totalLikes: json["TotalLikes"],
        totalDisLikes: json["TotalDisLikes"],
      );

  Map<String, dynamic> toJson() => {
        "ImageTitle": imageTitle,
        "ImageLocation": imageLocation,
        "ImageDescription": imageDescription,
        "Status": status,
        "UserName": userName,
        "CreatedBy": createdBy,
        "CreatedAt": createdAt.toIso8601String(),
        "TotalLikes": totalLikes,
        "TotalDisLikes": totalDisLikes,
      };
}
