// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  bool status;
  String message;
  dynamic data;

  RegisterResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
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

class Data {
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
  dynamic otp;
  dynamic createdDate;
  dynamic updatedDate;

  Data({
    required this.id,
    required this.userType,
    this.userTypeName,
    required this.likeVotePoints,
    required this.disLikeVotePoints,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobileNumber,
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
      };
}
