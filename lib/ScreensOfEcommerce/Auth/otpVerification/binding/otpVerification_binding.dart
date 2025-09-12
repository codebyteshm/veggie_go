
import 'package:e_commerce46/ScreensOfEcommerce/Auth/otpVerification/controller/otpVerification_controller.dart';
import 'package:get/get.dart';

class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController());
  }
}