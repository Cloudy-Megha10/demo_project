import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:kainok_app/presentation/my_competitions_screen/models/my_competitions_item_model.dart';

class GetMyCompetitionsModel {
  RxList<GetMyCompetitionsItemModel> myCompetitionsItemList = RxList();
  RxList<SelectionPopupModel> categories = RxList();
}
