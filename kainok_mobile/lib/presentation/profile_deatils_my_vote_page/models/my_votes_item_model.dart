import 'package:get/get.dart';

class myVotesItemModel {
  Rx<String> typeTxt = Rx("Chopper");

  Rx<String>? id = Rx("");

  dynamic image;
  dynamic competitionTitle;
  dynamic score;
  dynamic liked;
  dynamic competitionId;

  myVotesItemModel(
      {this.image,
      this.competitionTitle,
      this.score,
      this.liked,
      this.competitionId});
}
