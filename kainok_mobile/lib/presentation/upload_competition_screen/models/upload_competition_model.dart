import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';

class UploadCompetitionModel {
  RxList<SelectionPopupModel> categories = RxList();
  RxList<SelectionPopupModel> compEndsIn = RxList();
  RxList<SelectionPopupModel> uploadCompEndsIn = RxList();
}
