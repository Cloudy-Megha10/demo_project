import 'package:get/get_rx/src/rx_types/rx_types.dart';

class GetMyCompetitionsItemModel {
  Rx<String> chopperTxt = Rx("Chopper");

  Rx<String> rockclimbingTxt = Rx("Rock Climbing");

  Rx<String> bridgeTxt = Rx("Bridge");

  Rx<String>? id = Rx("");

  dynamic icon;
  dynamic listName;
  dynamic width;
  dynamic competitionId;

  GetMyCompetitionsItemModel(
      {this.icon, this.listName, this.width, this.competitionId});
}
