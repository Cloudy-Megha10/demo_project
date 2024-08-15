import 'dart:convert';

UserLoggedOutReponse getUserResponseFromJson(String str) =>
    UserLoggedOutReponse.fromJson(json.decode(str));

String getUserResponseToJson(UserLoggedOutReponse data) =>
    json.encode(data.toJson());

class UserLoggedOutReponse {
  bool status;
  String message;
  bool data;

  UserLoggedOutReponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserLoggedOutReponse.fromJson(Map<String, dynamic> json) =>
      UserLoggedOutReponse(
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
