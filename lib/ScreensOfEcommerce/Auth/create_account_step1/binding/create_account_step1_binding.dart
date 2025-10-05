import 'package:e_commerce46/ScreensOfEcommerce/Auth/create_account_step1/controller/create_account_step1_controller.dart';
import 'package:get/get.dart';

class CreateAccountStep1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountStep1Controller>(() => CreateAccountStep1Controller());
  }
}


