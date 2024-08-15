import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:demo_project/presentation/my_competitions_screen/models/my_competitions_item_model.dart';

class GetMyCompetitionsModel {
  RxList<GetMyCompetitionsItemModel> myCompetitionsItemList = RxList();
  RxList<SelectionPopupModel> categories = RxList();
}
