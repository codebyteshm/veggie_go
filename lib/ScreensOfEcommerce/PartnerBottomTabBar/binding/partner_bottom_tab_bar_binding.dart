import 'package:e_commerce46/ScreensOfEcommerce/PartnerBottomTabBar/controller/partner_bottom_tab_bar_controller.dart';
import 'package:get/get.dart';

class PartnerBottomTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnerBottomTabBarController>(() => PartnerBottomTabBarController());
  }
}


