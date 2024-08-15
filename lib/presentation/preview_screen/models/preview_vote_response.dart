// To parse this JSON data, do
//
//     final votePostResponse = votePostResponseFromJson(jsonString);

import 'dart:convert';

VotePostResponse votePostResponseFromJson(String str) =>
    VotePostResponse.fromJson(json.decode(str));

String votePostResponseToJson(VotePostResponse data) =>
    json.encode(data.toJson());

class VotePostResponse {
  bool status;
  String message;
  int data;

  VotePostResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VotePostResponse.fromJson(Map<String, dynamic> json) =>
      VotePostResponse(
        status: json["Status"],
        message: json["Message"],
        data: json["Data"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data,
      };
}
