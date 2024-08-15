import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:demo_project/presentation/category_listing_screen/models/category_listing_model.dart';
import 'package:demo_project/presentation/category_listing_screen/models/vote_item_model.dart';

import '../../comp_image_listing_screen/models/image_listing_model.dart';

class CategoryItemModel {
  RxList<CategoryListingModel> categoryItemList = RxList();

  RxList<CategoryListingModel> competitionList = RxList();

  RxList<VoteItemModel> voteList = RxList();

  RxList<ImageListingModel> imageListingModel = RxList();
}
