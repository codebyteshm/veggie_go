
import 'package:e_commerce46/ScreensOfEcommerce/Auth/resetPassword/controller/resetPassword_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}