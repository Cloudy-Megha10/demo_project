import 'package:flutter/services.dart';
import 'package:kainok_app/core/app_export.dart';
import 'package:kainok_app/presentation/preview_fullscreen_screen/models/preview_fullscreen_model.dart';

class PreviewFullscreenController extends GetxController {
  Rx<PreviewFullscreenModel> previewFullscreenModelObj =
      PreviewFullscreenModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
