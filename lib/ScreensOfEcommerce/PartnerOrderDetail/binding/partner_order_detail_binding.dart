import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/PartnerOrderDetail/controller/partner_order_detail_controller.dart';

class PartnerOrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnerOrderDetailController>(() => PartnerOrderDetailController());
  }
}