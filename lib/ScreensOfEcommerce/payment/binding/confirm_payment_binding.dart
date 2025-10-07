import 'package:get/get.dart';
import '../controller/confirm_payment_controller.dart';

class ConfirmPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmPaymentController>(
      () => ConfirmPaymentController(),
    );
  }
}