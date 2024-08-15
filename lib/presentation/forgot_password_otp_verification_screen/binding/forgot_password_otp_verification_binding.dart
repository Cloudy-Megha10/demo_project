import '../controller/forgot_password_otp_verification_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordOtpVerificationController());
  }
}
