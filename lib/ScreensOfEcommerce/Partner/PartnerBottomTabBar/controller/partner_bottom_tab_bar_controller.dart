import 'package:get/get.dart';

class PartnerBottomTabBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void onTabSelected(int index) {
    currentIndex.value = index;
  }
}


