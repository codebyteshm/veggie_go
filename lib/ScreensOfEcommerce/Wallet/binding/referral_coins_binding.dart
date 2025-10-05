import 'package:get/get.dart';
import '../controller/referral_coins_controller.dart';

class ReferralCoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferralCoinsController>(() => ReferralCoinsController());
  }
}