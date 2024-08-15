import 'package:get/get.dart';
import 'package:demo_project/presentation/voting_screen_page/models/slider_frame_item_model.dart';
import 'list_trending_item_model.dart';

class ImageDetailsScreenModel {
  // Rx<List<Sliderframe177ItemModel>> sliderframe177ItemList =
  //     Rx(List.generate(5, (index) => Sliderframe177ItemModel()));

  Rx<List<ListtrendingItemModel>> listtrendingItemList =
      Rx(List.generate(5, (index) => ListtrendingItemModel()));
}
