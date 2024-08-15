import 'package:demo_project/core/app_export.dart';
import 'package:demo_project/presentation/delete_user_screen/models/delete_user_model.dart';
import 'package:flutter/material.dart';

class DeleteUserController extends GetxController {
  TextEditingController deleteuseryesController = TextEditingController();

  Rx<DeleteUserModel> deleteUserModelObj = DeleteUserModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    deleteuseryesController.dispose();
  }
}
