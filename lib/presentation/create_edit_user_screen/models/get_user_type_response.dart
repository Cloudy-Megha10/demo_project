// To parse this JSON data, do
//
//     final getAllUserType = getAllUserTypeFromJson(jsonString);

import 'dart:convert';

GetAllUserType getAllUserTypeFromJson(String str) =>
    GetAllUserType.fromJson(json.decode(str));

String getAllUserTypeToJson(GetAllUserType data) => json.encode(data.toJson());

class GetAllUserType {
  bool status;
  String message;
  List<Datum> data;

  GetAllUserType({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllUserType.fromJson(Map<String, dynamic> json) => GetAllUserType(
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
  int id;
  String name;
  int likeVotePoints;
  int disLikeVotePoints;
  bool isAdmin;

  Datum({
    required this.id,
    required this.name,
    required this.likeVotePoints,
    required this.disLikeVotePoints,
    required this.isAdmin,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        name: json["Name"],
        likeVotePoints: json["LikeVotePoints"],
        disLikeVotePoints: json["DisLikeVotePoints"],
        isAdmin: json["IsAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "LikeVotePoints": likeVotePoints,
        "DisLikeVotePoints": disLikeVotePoints,
        "IsAdmin": isAdmin,
      };
}
