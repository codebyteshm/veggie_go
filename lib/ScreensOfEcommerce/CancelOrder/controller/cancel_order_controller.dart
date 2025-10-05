import 'package:get/get.dart';

class CancelOrderController extends GetxController {
  final List<String> reasons = const [
    'Ordered by mistake',
    'Found a better price elsewhere',
    'Delivery time too long',
    'Changed mind',
    'Others',
  ];

  final RxString selectedReason = ''.obs;

  void selectReason(String reason) {
    selectedReason.value = reason;
  }
}