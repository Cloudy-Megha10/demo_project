import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_tab_container_screen/controller/profile_deatils_my_participation_tab_container_controller.dart';
import 'package:demo_project/presentation/winner_container_screen/controller/winner_container_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/flutter_secure_storage.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_guest_user_alert_dialog.dart';
import '../../widgets/custom_image_view.dart';
import '../category_listing_screen/controller/category_listing_controller.dart';
import '../competitions_screen_page/controller/competitions_screen_controller.dart';
import 'controller/voting_screen_controller.dart';

import 'package:flutter/material.dart';

import 'models/competition_model.dart';

class VotingScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotingScreenController controller = Get.put(VotingScreenController());
    CategoryListingController categoryListingController =
        Get.put(CategoryListingController());
    Future<void> _refreshPage() async {
      controller.refreshData();
    }

    return WillPopScope(onWillPop: () async {
      return false;
    }, child: Obx(() {
      final Map<String, List<CompetitionModel>> groupedCompetitions = {};
      for (final competition in controller.competitions) {
        if (groupedCompetitions.containsKey(competition.categoryTitle)) {
          groupedCompetitions[competition.categoryTitle]!.add(competition);
        } else {
          groupedCompetitions[competition.categoryTitle] = [competition];
        }
      }

      // Render the home screen with or without competitions
      return DefaultTabController(
          length: 5,
          child: SafeArea(
              child: Scaffold(
            backgroundColor: ColorConstant.whiteA70001,
            // appBar: CustomAppBar(
            //     height: getVerticalSize(75),
            //     centerTitle: true,
            //     title: Container(
            //         child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //           CustomImageView(
            //               svgPath: ImageConstant.imgSearchGray50024x24,
            //               height: getSize(24),
            //               width: getSize(24),
            //               margin: getMargin(left: 40, top: 25, bottom: 8)),
            //           Padding(
            //               padding: getPadding(left: 18, bottom: 1, top: 20),
            //               child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Text("lbl_voting".tr,
            //                         overflow: TextOverflow.ellipsis,
            //                         textAlign: TextAlign.left,
            //                         style: AppStyle.txtAllerBold16),
            //                     Padding(
            //                         padding: getPadding(top: 3),
            //                         child: Text("msg_be_a_part_of_our".tr,
            //                             overflow: TextOverflow.ellipsis,
            //                             textAlign: TextAlign.left,
            //                             style: AppStyle.txtCaption))
            //                   ])),
            //         ])),
            //     styleType: Style.bgFillWhiteA700_2),
            body: Obx(
              () => RefreshIndicator(
                onRefresh: () async {
                  await _refreshPage();
                },
                child: controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ))
                    : (groupedCompetitions.entries.isEmpty)
                        ? Center(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    getPadding(left: 50, right: 50, top: 10),
                                child: CustomImageView(
                                  alignment: Alignment.center,
                                  svgPath: ImageConstant.trophy,
                                  height: getSize(50),
                                  width: getSize(50),
                                ),
                              ),
                              Padding(
                                  padding:
                                      getPadding(left: 80, right: 80, top: 10),
                                  child: Text(
                                      "lbl_no_competitions_at_this_time".tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtAllerBold17)),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 10),
                                  child: Text(
                                      "lbl_please_select_below_options".tr,
                                      textAlign: TextAlign.center,
                                      style: AppStyle.txtAller14)),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 25),
                                  child: GestureDetector(
                                    child: Text(
                                      "Extend the range",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Aller',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onTap: () {
                                      onTapCreateCompetitionScreen(
                                          context, controller.userId.value);
                                    },
                                  )),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 25),
                                  child: GestureDetector(
                                    child: Text(
                                      "Choose Global Competitons",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Aller',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    onTap: () {
                                      onTapCreateCompetitionScreen(
                                          context, controller.userId.value);
                                    },
                                  )),
                              Padding(
                                  padding:
                                      getPadding(left: 50, right: 50, top: 25),
                                  child: CustomButton(
                                    height: getVerticalSize(50),
                                    width: getHorizontalSize(230),
                                    text: "+  Create Competition",
                                    margin: getMargin(left: 8),
                                    shape: ButtonShape.RoundedBorder20,
                                    variant: ButtonVariant.OutlineGray90002,
                                    padding: ButtonPadding.PaddingAll6,
                                    fontStyle: ButtonFontStyle.Aller12,
                                    onTap: () {
                                      onTapCreateCompetitionScreen(
                                          context, controller.userId.value);
                                    },
                                  )),
                            ],
                          ))
                        : SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 18),
                                      child: SizedBox(
                                        height: 33,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: controller
                                                .listCarouselItemModelObj
                                                .carouselTabs
                                                .value
                                                .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: () {
                                                    controller.current.value =
                                                        index;

                                                    if (controller
                                                            .current.value ==
                                                        0) {
                                                      controller
                                                          .getTrendingCompetitions();
                                                    } else if (controller
                                                            .current.value ==
                                                        1) {
                                                      controller
                                                          .globalTrendingGetApi();
                                                    } else if (controller
                                                            .current.value ==
                                                        2) {
                                                      controller
                                                          .highPrizeGetApi();
                                                    } else if (controller
                                                            .current.value ==
                                                        3) {
                                                      controller
                                                          .featureGetApi();
                                                    } else {
                                                      controller
                                                          .closingHrsGetApi();
                                                    }
                                                  },
                                                  child:
                                                      Obx(
                                                          () =>
                                                              AnimatedContainer(
                                                                duration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            300),
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            5),
                                                                decoration: BoxDecoration(
                                                                    color: controller.current.value ==
                                                                            index
                                                                        ? Colors
                                                                            .black
                                                                        : Colors
                                                                            .white,
                                                                    borderRadius: controller.current.value ==
                                                                            index
                                                                        ? BorderRadius.circular(
                                                                            120)
                                                                        : BorderRadius.circular(
                                                                            120),
                                                                    border: controller.current.value ==
                                                                            index
                                                                        ? null
                                                                        : Border.all(
                                                                            color:
                                                                                ColorConstant.gray200,
                                                                            width: 1)),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Center(
                                                                      child: CustomImageView(
                                                                          svgPath: controller
                                                                              .listCarouselItemModelObj
                                                                              .carouselTabs[
                                                                                  index]
                                                                              .imageLocation,
                                                                          height: getSize(
                                                                              24),
                                                                          width:
                                                                              getSize(24)),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        controller
                                                                            .listCarouselItemModelObj
                                                                            .carouselTabs[index]
                                                                            .categoryTitle,
                                                                        style: controller.current.value ==
                                                                                index
                                                                            ? TextStyle(color: ColorConstant.whiteA700)
                                                                            : TextStyle(color: ColorConstant.gray600),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )));
                                            }),
                                      ),
                                    ),
                                    Obx(
                                      () => Container(
                                        height: 238,
                                        child: (controller
                                                    .listCarouselItemModelObj
                                                    .carouselCompetitions
                                                    .value
                                                    .length >
                                                0)
                                            ? Column(children: [
                                                Container(
                                                    height:
                                                        getVerticalSize(213),
                                                    width:
                                                        getHorizontalSize(400),
                                                    margin: getMargin(top: 13),
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        children: [
                                                          Obx(
                                                              () =>
                                                                  CarouselSlider
                                                                      .builder(
                                                                    options: CarouselOptions(
                                                                        aspectRatio: 2.0,
                                                                        height: getVerticalSize(213),
                                                                        initialPage: controller.listCarouselItemModelObj.carouselCompetitions.value.length,
                                                                        autoPlay: true,
                                                                        viewportFraction: 1.0,
                                                                        enableInfiniteScroll: false,
                                                                        scrollDirection: Axis.horizontal,
                                                                        onPageChanged: (index, reason) {
                                                                          controller
                                                                              .silderIndex
                                                                              .value = index;
                                                                        }),
                                                                    itemCount: controller.listCarouselItemModelObj.carouselCompetitions.value.length >
                                                                            5
                                                                        ? 5
                                                                        : controller
                                                                            .listCarouselItemModelObj
                                                                            .carouselCompetitions
                                                                            .value
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index,
                                                                            realIndex) {
                                                                      return Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Card(
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          elevation:
                                                                              0,
                                                                          margin:
                                                                              EdgeInsets.all(0),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadiusStyle.circleBorder16,
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                getVerticalSize(213),
                                                                            width:
                                                                                getHorizontalSize(342),
                                                                            decoration:
                                                                                AppDecoration.fillWhiteA700.copyWith(
                                                                              borderRadius: BorderRadiusStyle.circleBorder16,
                                                                            ),
                                                                            child:
                                                                                Stack(
                                                                              alignment: Alignment.topCenter,
                                                                              children: [
                                                                                GestureDetector(
                                                                                  child: CustomImageView(
                                                                                    url: controller.listCarouselItemModelObj.carouselCompetitions[index].imageLocation.toString(),
                                                                                    height: double.infinity,
                                                                                    width: getHorizontalSize(342),
                                                                                    fit: BoxFit.cover,
                                                                                    alignment: Alignment.center,
                                                                                  ),
                                                                                  onTap: () async {
                                                                                    SecureStorage _secureStorage = SecureStorage();
                                                                                    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
                                                                                    String? userId = await _secureStorage.getUserId();
                                                                                    if (isGuestUser == "true" && userId == "0") {
                                                                                      showGuestUserAlertDialogBox(context, "You haven't Registered!! Do You want to continue as a guest user??", controller.listCarouselItemModelObj.carouselCompetitions[index].competitionId.toString(), controller.listCarouselItemModelObj.carouselCompetitions[index].competitionTitle.toString());
                                                                                    } else {
                                                                                      categoryListingController.getCompetitionDetailsById1(context, controller.listCarouselItemModelObj.carouselCompetitions[index].competitionId.toString(), controller.listCarouselItemModelObj.carouselCompetitions[index].competitionTitle.toString());
                                                                                    }
                                                                                  },
                                                                                ),
                                                                                // Align(
                                                                                //   alignment: Alignment.topCenter,
                                                                                //   child: Padding(
                                                                                //     padding: getPadding(
                                                                                //       left: 19,
                                                                                //       top: 16,
                                                                                //       right: 16,
                                                                                //     ),
                                                                                //     child: Column(
                                                                                //       mainAxisSize: MainAxisSize.min,
                                                                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                                                                //       mainAxisAlignment: MainAxisAlignment.start,
                                                                                //       children: [
                                                                                //         CustomButton(
                                                                                //           height: getVerticalSize(28),
                                                                                //           width: getHorizontalSize(63),
                                                                                //           text: controller.listCarouselItemModelObj.carouselCompetitions[index].counts.toString(),
                                                                                //           variant: ButtonVariant.FillWhiteA700cc,
                                                                                //           shape: ButtonShape.CircleBorder14,
                                                                                //           padding: ButtonPadding.PaddingT5,
                                                                                //           fontStyle: ButtonFontStyle.PoppinsMedium11,
                                                                                //           suffixWidget: Container(
                                                                                //             margin: getMargin(left: 4),
                                                                                //             child: CustomImageView(
                                                                                //               svgPath: ImageConstant.imgFavorite,
                                                                                //             ),
                                                                                //           ),
                                                                                //           alignment: Alignment.centerRight,
                                                                                //         ),
                                                                                //         Padding(
                                                                                //           padding: getPadding(top: 89),
                                                                                //           child: Text(
                                                                                //             controller.listCarouselItemModelObj.carouselCompetitions[index].competitionTitle,
                                                                                //             overflow: TextOverflow.ellipsis,
                                                                                //             textAlign: TextAlign.left,
                                                                                //             style: AppStyle.txtPoppinsSemiBold24.copyWith(
                                                                                //               letterSpacing: getHorizontalSize(0.25),
                                                                                //             ),
                                                                                //           ),
                                                                                //         ),
                                                                                //       ],
                                                                                //     ),
                                                                                //   ),
                                                                                // ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  )),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Obx(() => Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          8),
                                                                  margin: getMargin(
                                                                      bottom:
                                                                          11),
                                                                  child: AnimatedSmoothIndicator(
                                                                      activeIndex: controller
                                                                          .silderIndex
                                                                          .value,
                                                                      count: controller.listCarouselItemModelObj.carouselCompetitions.value.length > 5
                                                                          ? 5
                                                                          : controller
                                                                              .listCarouselItemModelObj
                                                                              .carouselCompetitions
                                                                              .value
                                                                              .length,
                                                                      axisDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      effect: ScrollingDotsEffect(
                                                                          spacing: 4,
                                                                          activeDotColor: ColorConstant.red600,
                                                                          dotColor: ColorConstant.gray70001,
                                                                          dotHeight: getVerticalSize(8),
                                                                          dotWidth: getHorizontalSize(8))))))
                                                        ])),
                                              ])
                                            : Container(
                                                margin: getMargin(top: 13),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    children: [
                                                      CarouselSlider.builder(
                                                        options:
                                                            CarouselOptions(
                                                                aspectRatio:
                                                                    2.0,
                                                                height:
                                                                    getVerticalSize(
                                                                        213),
                                                                initialPage: 0,
                                                                autoPlay: true,
                                                                viewportFraction:
                                                                    1.0,
                                                                enableInfiniteScroll:
                                                                    false,
                                                                scrollDirection:
                                                                    Axis
                                                                        .horizontal,
                                                                onPageChanged:
                                                                    (index,
                                                                        reason) {
                                                                  controller
                                                                      .silderIndex
                                                                      .value = index;
                                                                }),
                                                        itemCount: 1,
                                                        itemBuilder: (context,
                                                            index, realIndex) {
                                                          return Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              elevation: 0,
                                                              margin: EdgeInsets
                                                                  .all(0),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                side:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        213),
                                                                width:
                                                                    getHorizontalSize(
                                                                        342),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        getPadding(
                                                                      left: 19,
                                                                      top: 60,
                                                                      right: 16,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              getPadding(
                                                                            left:
                                                                                50,
                                                                            right:
                                                                                50,
                                                                          ),
                                                                          child:
                                                                              CustomImageView(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            svgPath:
                                                                                ImageConstant.trophy,
                                                                            height:
                                                                                getSize(50),
                                                                            width:
                                                                                getSize(50),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Text(
                                                                            "No Competitions",
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: AppStyle.txtAllerBold14.copyWith(
                                                                                letterSpacing: getHorizontalSize(0.25),
                                                                                fontSize: 16,
                                                                                color: ColorConstant.black900),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                left: 19,
                                                                top: 140,
                                                                right: 16,
                                                              ),
                                                              child: Obx(() => Container(
                                                                  child: AnimatedSmoothIndicator(
                                                                      activeIndex: controller
                                                                          .silderIndex
                                                                          .value,
                                                                      count: 1,
                                                                      axisDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      effect: ScrollingDotsEffect(
                                                                          spacing:
                                                                              4,
                                                                          activeDotColor: ColorConstant
                                                                              .whiteA700,
                                                                          dotColor: ColorConstant
                                                                              .whiteA700,
                                                                          dotHeight: getVerticalSize(
                                                                              8),
                                                                          dotWidth:
                                                                              getHorizontalSize(8)))))))
                                                    ])),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        child: Column(
                                          children: groupedCompetitions.entries
                                              .map((entry) {
                                            final categoryTitle = entry.key;
                                            final competitions = entry.value;
                                            bool isViewAllButtonDisplayed =
                                                false;

                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 25),
                                                          child: Text(
                                                              categoryTitle,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtAllerBold17),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          child: Text(
                                                            '(${competitions.length})',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .grey[700],
                                                              letterSpacing:
                                                                  0.25,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: isViewAllButtonDisplayed
                                                            ? Container() // Empty container if button already displayed
                                                            : GestureDetector(
                                                                onTap: () {
                                                                  categoryListingController.votingCompetitionsByCategoryGetApi(
                                                                      competitions
                                                                          .first
                                                                          .categoryId,
                                                                      false);
                                                                },
                                                                child:
                                                                    CustomButton(
                                                                  height:
                                                                      getVerticalSize(
                                                                          20),
                                                                  width:
                                                                      getHorizontalSize(
                                                                          80),
                                                                  text:
                                                                      "lbl_view_all"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                          left:
                                                                              8,
                                                                          right:
                                                                              10),
                                                                  shape: ButtonShape
                                                                      .CircleBorder14,
                                                                  variant:
                                                                      ButtonVariant
                                                                          .FillWhiteA700,
                                                                  padding:
                                                                      ButtonPadding
                                                                          .PaddingAll6,
                                                                  fontStyle:
                                                                      ButtonFontStyle
                                                                          .Aller11Gray90003,
                                                                ),
                                                              ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: competitions
                                                        .take(3)
                                                        .map((competition) {
                                                      // Limit to three elements
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 15,
                                                          right: 10,
                                                        ),
                                                        child: Container(
                                                          width: getSize(100),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              // Handle competition selection
                                                            },
                                                            child: Column(
                                                              children: [
                                                                GestureDetector(
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundImage:
                                                                        NetworkImage(competition
                                                                            .imageLocation
                                                                            .toString()),
                                                                    radius: 50,
                                                                    backgroundColor:
                                                                        Colors.grey[
                                                                            100],
                                                                  ),
                                                                  onTap:
                                                                      () async {
                                                                    SecureStorage
                                                                        _secureStorage =
                                                                        SecureStorage();

                                                                    dynamic
                                                                        isGuestUser =
                                                                        await _secureStorage
                                                                            .getIsGuestUser();
                                                                    String?
                                                                        userId =
                                                                        await _secureStorage
                                                                            .getUserId();
                                                                    if (isGuestUser ==
                                                                            "true" &&
                                                                        userId ==
                                                                            "0") {
                                                                      showGuestUserAlertDialogBox(
                                                                          context,
                                                                          "You haven't Registered!! Do You want to continue as a guest user??",
                                                                          competition
                                                                              .competitionId
                                                                              .toString(),
                                                                          competition
                                                                              .title
                                                                              .toString());
                                                                    } else {
                                                                      categoryListingController.getCompetitionDetailsById1(
                                                                          context,
                                                                          competition
                                                                              .competitionId
                                                                              .toString(),
                                                                          competition
                                                                              .title
                                                                              .toString());
                                                                    }
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                    height: 8),
                                                                Text(
                                                                  competition
                                                                      .title,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                            .grey[
                                                                        700],
                                                                    letterSpacing:
                                                                        0.25,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 4),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ]),
                            ),
                          ),
              ),
            ),
            floatingActionButton: GestureDetector(
                onTap: () {
                  onTapCreateCompetitionScreen(
                      context, controller.userId.value);
                },
                child: Padding(
                  padding: getPadding(top: 40),
                  child: Stack(children: [
                    Container(
                        height: getVerticalSize(88),
                        width: getHorizontalSize(59),
                        padding: getPadding(
                            left: 17, top: 32, right: 17, bottom: 32),
                        decoration: AppDecoration.outlineBlack90019.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder28),
                        child: Stack(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgCamera4,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.center)
                        ]))
                  ]),
                )),
            bottomNavigationBar: CustomBottomBar(
              onChanged: (BottomBarEnum type) {
                controller.type.value = type;
                getCurrentWidget(context, controller);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
          )));
    }));
  }

  onTapColumntrending() {
    Get.toNamed(AppRoutes.previewScreen);
  }

  // Handling page based on route
  void getCurrentWidget(
      BuildContext context, VotingScreenController controller) {
    if (controller.type.value == BottomBarEnum.Competition) {
      Get.toNamed(AppRoutes.competitionsScreen)
          ?.then((value) => Get.delete<CompetitionsScreenController>());
    } else if (controller.type.value == BottomBarEnum.Winner) {
      Get.toNamed(AppRoutes.winnerContainerScreen)
          ?.then((value) => Get.delete<WinnerContainerController>());
    } else if (controller.type.value == BottomBarEnum.Profile) {
      onTapProfileScreen(context, controller.userId.value);
    } else if (controller.type.value == BottomBarEnum.Voting) {
      Get.toNamed(AppRoutes.votingScreenPage)
          ?.then((value) => Get.delete<VotingScreenController>());
    }
  }

  onTapCreateCompetitionScreen(BuildContext context, String userId) async {
    SecureStorage _secureStorage = SecureStorage();
    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
    dynamic userId = await _secureStorage.getUserId();
    dynamic isLoggedOut = await _secureStorage.getIsLoggedOut();
    (isGuestUser == "true" || isLoggedOut == "true")
        ? showAlertDialogBox(
            context,
            "Please sign up or log in to create a Competition",
            userId,
            isGuestUser)
        : Get.toNamed(
            AppRoutes.createCompetitionScreen,
          );
  }

  onTapProfileScreen(BuildContext context, String userId) async {
    SecureStorage _secureStorage = SecureStorage();
    dynamic isGuestUser = await _secureStorage.getIsGuestUser();
    dynamic userId = await _secureStorage.getUserId();
    print("isGuestUserProfiel---");
    print(userId);
    print(isGuestUser);
    (isGuestUser == "true" && userId != "0")
        ? Get.toNamed(AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
            ?.then((value) => Get.delete<
                ProfileDeatilsMyParticipationTabContainerController>())
        : (isGuestUser == "true")
            ? showAlertDialogBox(
                context,
                "Please sign up or log in to view the Profile",
                userId,
                isGuestUser)
            : Get.toNamed(
                    AppRoutes.profileDeatilsMyParticipationTabContainerScreen)
                ?.then((value) => Get.delete<
                    ProfileDeatilsMyParticipationTabContainerController>());
  }

  showAlertDialogBox(
      BuildContext context, String content, String userId, String isGuestUser) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText: "LOG IN",
          onTap: () {
            (userId != "0" && isGuestUser == "true")
                ? Get.toNamed(
                    AppRoutes.signUpGuestUserScreen,
                  )
                : Get.toNamed(
                    AppRoutes.signInScreen,
                  );
          },
        );
      },
    );
  }

  showGuestUserAlertDialogBox(
      BuildContext context, String content, String compId, String compTitle) {
    VotingScreenController controller = Get.put(VotingScreenController());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomGuestUserAlertDialog(
          title: "lbl_pixat".tr,
          content: content,
          buttonText1: "YES",
          buttonText2: "REGISTER",
          onTapButton1: () {
            print("GusetUserr----");
            Get.back();
            print("GusetUserr11----");

            controller.createGuestUser(context, compId, compTitle);
          },
          onTapButton2: () {
            Get.back();
            Get.toNamed(
              AppRoutes.createAccountScreen,
            );
          },
        );
      },
    );
  }

  onTapCategoryListingScreen() {
    Get.toNamed(
      AppRoutes.competitionListScreen,
    );
  }
}
