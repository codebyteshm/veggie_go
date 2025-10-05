import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:get/get.dart';

class BottomTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomTabBarController>(() => BottomTabBarController());
  }
}


