
import 'package:e_commerce46/ScreensOfEcommerce/Auth/forgotPassword/controller/forgotPassword_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}