import 'package:get/get.dart';

class WinnerItemModel {
  RxString elevenTxt = "".obs;
  RxString id = "".obs;
  dynamic winnerImage;
  dynamic clientName;
  dynamic clientImage;
  dynamic noOfVotes;

  WinnerItemModel(
      {required this.winnerImage,
      required this.clientName,
      required this.clientImage,
      required this.noOfVotes});
}
