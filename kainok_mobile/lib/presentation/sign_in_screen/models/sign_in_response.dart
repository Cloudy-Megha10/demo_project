import 'dart:convert';

LogInResponse logInResponseFromJson(String str) =>
    LogInResponse.fromJson(json.decode(str));

String logInResponseToJson(LogInResponse data) => json.encode(data.toJson());

class LogInResponse {
  bool status;
  dynamic message;
  Data data;

  LogInResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogInResponse.fromJson(Map<String, dynamic> json) => LogInResponse(
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
  int userType;
  String? firstName;
  String? lastName;
  String? emailId;
  dynamic mobileNumber;
  String? sessionId;
  bool isAdmin;

  Data({
    required this.id,
    required this.userType,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    this.mobileNumber,
    required this.sessionId,
    required this.isAdmin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        userType: json["UserType"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        sessionId: json["SessionId"],
        isAdmin: json["IsAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserType": userType,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "SessionId": sessionId,
        "IsAdmin": isAdmin,
      };
}
