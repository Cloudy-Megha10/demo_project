// To parse this JSON data, do
//
//     final getUserResponse = getUserResponseFromJson(jsonString);

import 'dart:convert';

GetUserResponse getUserResponseFromJson(String str) =>
    GetUserResponse.fromJson(json.decode(str));

String getUserResponseToJson(GetUserResponse data) =>
    json.encode(data.toJson());

class GetUserResponse {
  bool status;
  String message;
  Data data;

  GetUserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      GetUserResponse(
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
  String userTypeName;
  int likeVotePoints;
  int disLikeVotePoints;
  String firstName;
  String lastName;
  String emailId;
  dynamic mobileNumber;
  String location;
  String imei;
  dynamic password;
  String description;
  dynamic passwordSalt;
  dynamic profilePhotoLocation;
  bool isAdmin;
  int otp;
  dynamic createdDate;
  dynamic updatedDate;
  bool isSocialMediaUser;
  bool isActive;

  Data({
    required this.id,
    required this.userType,
    required this.userTypeName,
    required this.likeVotePoints,
    required this.disLikeVotePoints,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    this.mobileNumber,
    required this.location,
    required this.imei,
    this.password,
    required this.description,
    this.passwordSalt,
    this.profilePhotoLocation,
    required this.isAdmin,
    required this.otp,
    this.createdDate,
    this.updatedDate,
    required this.isSocialMediaUser,
    required this.isActive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        otp: json["Otp"],
        createdDate: json["CreatedDate"],
        updatedDate: json["UpdatedDate"],
        isSocialMediaUser: json["IsSocialMediaUser"],
        isActive: json["IsActive"],
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
        "Otp": otp,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
        "IsSocialMediaUser": isSocialMediaUser,
        "IsActive": isActive,
      };
}
