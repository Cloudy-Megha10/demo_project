
class CompetitionsByCategory {
  bool? status;
  String? message;
  List<Data>? data;

  CompetitionsByCategory({this.status, this.message, this.data});

  CompetitionsByCategory.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? competitionId;
  int? imageId;
  String? title;
  String? categoryTitle;
  String? imageLocation;
  int? categoryId;

  Data(
      {this.competitionId,
      this.imageId,
      this.title,
      this.categoryTitle,
      this.imageLocation,
      this.categoryId});

  Data.fromJson(Map<String, dynamic> json) {
    competitionId = json['CompetitionId'];
    imageId = json['ImageId'];
    title = json['Title'];
    categoryTitle = json['CategoryTitle'];
    imageLocation = json['ImageLocation'];
    categoryId = json['CategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompetitionId'] = this.competitionId;
    data['ImageId'] = this.imageId;
    data['Title'] = this.title;
    data['CategoryTitle'] = this.categoryTitle;
    data['ImageLocation'] = this.imageLocation;
    data['CategoryId'] = this.categoryId;
    return data;
  }
}
