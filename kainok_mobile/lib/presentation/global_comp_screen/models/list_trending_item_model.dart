import 'package:get/get.dart';
import 'package:kainok_app/core/utils/image_constant.dart';
import 'package:kainok_app/core/utils/size_utils.dart';
import 'package:kainok_app/presentation/voting_screen_page/models/slider_frame_item_model.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'adventure_item_model.dart';

class ListtrendingItemModel {
  Rx<String> trendingTxt = Rx("Trending");

  Rx<String>? id = Rx("");

  RxList<SliderItemModel> items = [
    SliderItemModel(
        imageLocation: ImageConstant.imgFire,
        categoryTitle: "lbl_trending".tr,
        imageId: 150),
    SliderItemModel(
        imageLocation: ImageConstant.imgXnixlineglobal,
        categoryTitle: "lbl_global_trending".tr,
        imageId: 180),
    SliderItemModel(
        imageLocation: ImageConstant.imgLocation,
        categoryTitle: "lbl_high_prize".tr,
        imageId: 150),
    SliderItemModel(
        imageLocation: ImageConstant.imgCloseGray600,
        categoryTitle: "lbl_feature".tr,
        imageId: 150),
    SliderItemModel(
        imageLocation: ImageConstant.imgLock,
        categoryTitle: "msg_closing_in_24_hrs".tr,
        imageId: 180)
  ].obs;
  RxList<AdventureItemModel> categoryItemList = RxList();

  RxList<SliderItemModel> trendingImages = RxList();
  RxList<SliderItemModel> globalTrendingImages = RxList();
  RxList<SliderItemModel> highPrize = RxList();
  RxList<SliderItemModel> feature = RxList();
  RxList<SliderItemModel> closing24Hrs = RxList();

  List<SelectionPopupModel> rangeValue = [
    SelectionPopupModel(
      title: "5",
    ),
    SelectionPopupModel(
      title: "10",
    ),
    SelectionPopupModel(
      title: "15",
    ),
  ];
}
