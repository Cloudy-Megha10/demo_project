import 'dart:convert';

EditCompGetCategoriesResponse editCompGetCategoriesFromJson(String str) =>
    EditCompGetCategoriesResponse.fromJson(json.decode(str));

String editCompGetCategoriesToJson(EditCompGetCategoriesResponse data) =>
    json.encode(data.toJson());

class EditCompGetCategoriesResponse {
  bool status;
  String message;
  List<Datum> data;

  EditCompGetCategoriesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditCompGetCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      EditCompGetCategoriesResponse(
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
