import 'package:e_commerce46/Common/image.dart';
import 'package:get/get.dart';

class PaymentMethodOption {
  PaymentMethodOption({
    required this.key,
    required this.title,
    required this.subtitle,
    required this.enabled,
    this.selected = false,
  });

  final String key; // e.g. 'upi', 'wallet', 'cod'
  final String title;
  final String subtitle;
  final bool enabled;
  bool selected;
}

class PaymentController extends GetxController {
  final RxList<PaymentMethodOption> methods = <PaymentMethodOption>[
    PaymentMethodOption(
      key: PNGImages.icUpiBox,
      title: 'UPI',
      subtitle: 'Fast, secure payments via UPI',
      enabled: true,
      selected: true,
    ),
    PaymentMethodOption(
      key: PNGImages.icWallet,
      title: 'Wallet',
      subtitle: 'Available Balance: ₹450',
      enabled: true,
      selected: false,
    ),
    PaymentMethodOption(
      key: PNGImages.icCOD,
      title: 'Cash on Delivery',
      subtitle: 'Currently unavailable',
      enabled: false,
      selected: false,
    ),
  ].obs;

  final RxInt itemTotal = 285.obs;
  final RxInt deliveryCharges = 0.obs; // Free
  final RxInt handlingCharges = 0.obs; // Free

  int get totalPayable => itemTotal.value + deliveryCharges.value + handlingCharges.value;

  void selectMethod(int index) {
    for (var i = 0; i < methods.length; i++) {
      if (!methods[i].enabled) continue;
      methods[i].selected = i == index;
    }
    methods.refresh();
  }
}