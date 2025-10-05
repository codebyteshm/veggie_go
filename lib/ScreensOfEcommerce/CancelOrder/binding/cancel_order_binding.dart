import 'package:get/get.dart';
import '../controller/cancel_order_controller.dart';

class CancelOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelOrderController>(() => CancelOrderController());
  }
}