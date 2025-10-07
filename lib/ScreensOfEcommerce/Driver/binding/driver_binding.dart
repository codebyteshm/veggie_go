import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Driver/controller/driver_controller.dart';

class DriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverController>(() => DriverController());
  }
}