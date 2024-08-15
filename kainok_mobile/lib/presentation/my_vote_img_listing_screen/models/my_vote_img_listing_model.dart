import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:kainok_app/core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'my_vote_img_listing_item_model.dart';

class MyVoteImgListingModel {
  RxList<MyVoteImgListingItemModel> ImagesDetailsList = RxList();
  RxList<SelectionPopupModel> userType = RxList();
  RxList<SelectionPopupModel> categories = RxList();
  RxList predictions = [].obs;
  FlutterGooglePlacesSdk googlePlace =
      FlutterGooglePlacesSdk('AIzaSyCm4FPBKMg_j0_YQlUL0KLunYBF5xe-lv8');
}
