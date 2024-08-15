import 'dart:convert';

WinnerResponse winnerResponseFromJson(String str) =>
    WinnerResponse.fromJson(json.decode(str));

String winnerResponseToJson(WinnerResponse data) => json.encode(data.toJson());

class WinnerResponse {
  bool status;
  String message;
  List<Datum> data;

  WinnerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WinnerResponse.fromJson(Map<String, dynamic> json) => WinnerResponse(
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
  String userName;
  String? userImageLocation;
  int totalLikes;
  String imageLocation;

  Datum({
    required this.userName,
    this.userImageLocation,
    required this.totalLikes,
    required this.imageLocation,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["UserName"],
        userImageLocation: json["UserImageLocation"],
        totalLikes: json["TotalLikes"],
        imageLocation: json["ImageLocation"],
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "UserImageLocation": userImageLocation,
        "TotalLikes": totalLikes,
        "ImageLocation": imageLocation,
      };
}
