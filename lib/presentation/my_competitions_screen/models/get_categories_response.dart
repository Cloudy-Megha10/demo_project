// To parse this JSON data, do
//
//     final getCategories = getCategoriesFromJson(jsonString);

import 'dart:convert';

GetCategories getCategoriesFromJson(String str) =>
    GetCategories.fromJson(json.decode(str));

String getCategoriesToJson(GetCategories data) => json.encode(data.toJson());

class GetCategories {
  bool status;
  String message;
  List<Datum> data;

  GetCategories({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
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
  String categoryTitle;

  Datum({
    required this.id,
    required this.categoryTitle,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        categoryTitle: json["CategoryTitle"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryTitle": categoryTitle,
      };
}
