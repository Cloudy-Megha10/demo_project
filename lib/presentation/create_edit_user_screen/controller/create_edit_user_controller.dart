import 'package:kainok_app/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'create_edit_user_respository.dart';

class CreateEditUserController extends GetxController {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController likedController = TextEditingController();
  TextEditingController disLikedController = TextEditingController();

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  RxString selectedId = "".obs;

  CreateEditRepository createEditRepository = CreateEditRepository();

  RxList<String> locationList = [""].obs;

  RxString? _selectedCity;
  RxBool isActive = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
