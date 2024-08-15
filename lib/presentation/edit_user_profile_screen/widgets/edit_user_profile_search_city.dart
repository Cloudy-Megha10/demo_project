import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';
import '../controller/edit_user_profile_controller.dart';

class SearchBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EditUserProfileController controller = Get.put(EditUserProfileController());
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.cityController,
            style: TextStyle(
              color: ColorConstant.black900Dd,
              fontSize: getFontSize(
                14,
              ),
              fontFamily: 'Aller',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              filled: true,
              fillColor: ColorConstant.gray100,
              hintText: 'Search City...',
              prefixIcon: Icon(
                Icons.search,
                color: ColorConstant.black900,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.gray300),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.gray300),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                controller.onChange();
              } else {}
            },
          ),
          SizedBox(height: 5.0),
          Obx(() => SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.73,
                        width: double.infinity,
                        child: Padding(
                            padding: getPadding(left: 23, top: 10, right: 23),
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: controller.locationList.length,
                                separatorBuilder: (_, __) => const Divider(),
                                itemBuilder: (context, int index) {
                                  return ListTile(
                                    title: Text(controller.locationList[index],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsRegular11Black9008e
                                            .copyWith(
                                                letterSpacing: 0.25,
                                                height: 1.29)),
                                    onTap: () {
                                      goBack();
                                      controller.selectedValue(controller
                                          .locationList[index]
                                          .toString());
                                    },
                                  );
                                })))
                  ],
                ),
              )),
        ],
      ),
    );
  }

  goBack() {
    Get.back();
  }
}
