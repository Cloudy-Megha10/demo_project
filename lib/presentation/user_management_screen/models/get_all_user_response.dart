// To parse this JSON data, do
//
//     final getAllUserResponse = getAllUserResponseFromJson(jsonString);

import 'dart:convert';

GetAllUserResponse getAllUserResponseFromJson(String str) =>
    GetAllUserResponse.fromJson(json.decode(str));

String getAllUserResponseToJson(GetAllUserResponse data) =>
    json.encode(data.toJson());

class GetAllUserResponse {
  bool status;
  String message;
  List<Datum> data;

  GetAllUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllUserResponse.fromJson(Map<String, dynamic> json) =>
      GetAllUserResponse(
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
  dynamic id;
  dynamic userType;
  dynamic userTypeName;
  dynamic likeVotePoints;
  dynamic disLikeVotePoints;
  dynamic firstName;
  dynamic lastName;
  dynamic emailId;
  dynamic mobileNumber;
  dynamic location;
  dynamic imei;
  dynamic password;
  dynamic description;
  dynamic passwordSalt;
  dynamic profilePhotoLocation;
  dynamic isAdmin;
  dynamic isGuestUser;
  dynamic otp;
  DateTime createdDate;
  DateTime? updatedDate;

  Datum({
    required this.id,
    required this.userType,
    required this.userTypeName,
    required this.likeVotePoints,
    required this.disLikeVotePoints,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
    required this.location,
    required this.imei,
    required this.password,
    required this.description,
    required this.passwordSalt,
    required this.profilePhotoLocation,
    required this.isAdmin,
    required this.isGuestUser,
    required this.otp,
    required this.createdDate,
    required this.updatedDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        userType: json["UserType"],
        userTypeName: json["UserTypeName"],
        likeVotePoints: json["LikeVotePoints"],
        disLikeVotePoints: json["DisLikeVotePoints"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        imei: json["IMEI"],
        password: json["Password"],
        description: json["Description"],
        passwordSalt: json["PasswordSalt"],
        profilePhotoLocation: json["ProfilePhotoLocation"],
        isAdmin: json["IsAdmin"],
        isGuestUser: json["IsGuestUser"],
        otp: json["Otp"],
        createdDate: DateTime.parse(json["CreatedDate"]),
        updatedDate: json["UpdatedDate"] == null
            ? null
            : DateTime.parse(json["UpdatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "UserType": userType,
        "UserTypeName": userTypeName,
        "LikeVotePoints": likeVotePoints,
        "DisLikeVotePoints": disLikeVotePoints,
        "FirstName": firstName,
        "LastName": lastName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "IMEI": imei,
        "Password": password,
        "Description": description,
        "PasswordSalt": passwordSalt,
        "ProfilePhotoLocation": profilePhotoLocation,
        "IsAdmin": isAdmin,
        "IsGuestUser": isGuestUser,
        "Otp": otp,
        "CreatedDate": createdDate.toIso8601String(),
        "UpdatedDate": updatedDate?.toIso8601String(),
      };
}
