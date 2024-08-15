class MyVoteImgListingItemModel {
  dynamic categoryTitle;
  dynamic images;
  dynamic imageTitle;
  dynamic totalDisLikes;
  dynamic totalLikes;
  bool liked;

  MyVoteImgListingItemModel(
      {this.categoryTitle,
      this.images,
      this.imageTitle,
      this.totalDisLikes,
      this.totalLikes,
      required this.liked});
}
