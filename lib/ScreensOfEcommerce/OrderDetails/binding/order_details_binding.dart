import 'package:e_commerce46/ScreensOfEcommerce/OrderDetails/controller/order_details_controller.dart';
import 'package:get/get.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(),
    );
  }
}
