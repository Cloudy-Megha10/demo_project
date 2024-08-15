// To parse this JSON data, do
//
//     final userTypeDeatilsByIdResponse = userTypeDeatilsByIdResponseFromJson(jsonString);

import 'dart:convert';

UserTypeDeatilsByIdResponse userTypeDeatilsByIdResponseFromJson(String str) =>
    UserTypeDeatilsByIdResponse.fromJson(json.decode(str));

String userTypeDeatilsByIdResponseToJson(UserTypeDeatilsByIdResponse data) =>
    json.encode(data.toJson());

class UserTypeDeatilsByIdResponse {
  bool status;
  String message;
  Data data;

  UserTypeDeatilsByIdResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserTypeDeatilsByIdResponse.fromJson(Map<String, dynamic> json) =>
      UserTypeDeatilsByIdResponse(
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
  int id;
  String name;
  int likeVotePoints;
  int disLikeVotePoints;

  Data({
    required this.id,
    required this.name,
    required this.likeVotePoints,
    required this.disLikeVotePoints,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        name: json["Name"],
        likeVotePoints: json["LikeVotePoints"],
        disLikeVotePoints: json["DisLikeVotePoints"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "LikeVotePoints": likeVotePoints,
        "DisLikeVotePoints": disLikeVotePoints,
      };
}
