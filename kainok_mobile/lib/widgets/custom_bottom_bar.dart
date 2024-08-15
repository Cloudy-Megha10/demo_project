import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kainok_app/theme/app_decoration.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';
import 'custom_image_view.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      title: "lbl_competitions".tr,
      type: BottomBarEnum.Competition,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgFavoriteGray600,
      title: "lbl_voting".tr,
      type: BottomBarEnum.Voting,
    ),
    BottomMenuModel(
      icon: "",
      //title: "lbl_progress".tr,
      type: BottomBarEnum.Voting,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgWinner,
      title: "lbl_winner".tr,
      type: BottomBarEnum.Winner,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgProfile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            backgroundBlendMode: BlendMode.clear,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
            ),
            child: BottomNavigationBar(
              // backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              currentIndex: selectedIndex.value,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                return BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].icon,
                        height: getSize(
                          24.00,
                        ),
                        width: getSize(
                          24.00,
                        ),
                        // color: ColorConstant.black900,
                      ),
                      Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtAller12.copyWith(
                          letterSpacing: 0.40,
                          height: 1.25,
                          color: ColorConstant.black900,
                        ),
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        height: getSize(30),
                        width: getSize(30),
                        decoration: AppDecoration.lightGray.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder28,
                        ),
                        child: CustomImageView(
                          svgPath: bottomMenuList[index].icon,
                          height: getSize(
                            24.00,
                          ),
                          width: getSize(
                            24.00,
                          ),
                          color: ColorConstant.black900,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtAller12.copyWith(
                            letterSpacing: 0.40,
                            height: 1.25,
                            color: ColorConstant.black900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                );
              }),
              onTap: (index) {
                selectedIndex.value = index;
                onChanged!(bottomMenuList[index].type);
              },
            ),
          ),
        ));
  }
}

enum BottomBarEnum {
  Competition,
  Voting,
  Winner,
  Profile,
  previewScreen,
  Images,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, this.title, required this.type});

  String icon;

  String? title;

  BottomBarEnum type;
}

///Set default widget when screen is not configured with bottom menu
Widget getDefaultWidget() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please replace the respective Widget here',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}
