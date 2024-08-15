import 'dart:convert';

IsDeviceRegisteredResponse isDeviceRegisteredResponseFromJson(String str) =>
    IsDeviceRegisteredResponse.fromJson(json.decode(str));

String isDeviceRegisteredResponseToJson(IsDeviceRegisteredResponse data) =>
    json.encode(data.toJson());

class IsDeviceRegisteredResponse {
  bool status;
  String message;
  Data data;

  IsDeviceRegisteredResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory IsDeviceRegisteredResponse.fromJson(Map<String, dynamic> json) =>
      IsDeviceRegisteredResponse(
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
  int userId;
  dynamic mobileNumber;
  String imei;
  bool isGuestUser;
  dynamic token;

  Data({
    required this.userId,
    this.mobileNumber,
    required this.imei,
    required this.isGuestUser,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["UserId"],
        mobileNumber: json["MobileNumber"],
        imei: json["IMEI"],
        isGuestUser: json["IsGuestUser"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "MobileNumber": mobileNumber,
        "IMEI": imei,
        "IsGuestUser": isGuestUser,
        "Token": token,
      };
}
