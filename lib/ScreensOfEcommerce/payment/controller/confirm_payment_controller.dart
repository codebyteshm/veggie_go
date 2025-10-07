import 'package:get/get.dart';

class ConfirmPaymentController extends GetxController {
  RxString selectedPaymentMethod = 'UPI/ QR Scan'.obs;
  RxBool isUpiSelected = true.obs;
  RxBool isCashSelected = false.obs;
  RxBool showUpiDetails = false.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
    if (method == 'UPI/ QR Scan') {
      isUpiSelected.value = true;
      isCashSelected.value = false;
      showUpiDetails.value = true;
    } else if (method == 'Cash Payment') {
      isUpiSelected.value = false;
      isCashSelected.value = true;
      showUpiDetails.value = false;
    }
  }

  void confirmPayment() {
    if (selectedPaymentMethod.value == 'UPI/ QR Scan') {
      Get.snackbar(
        'Payment Confirmed',
        'UPI payment method selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Payment Confirmed',
        'Cash payment method selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void cancelPayment() {
    Get.back();
  }

  void scanQrCode() {
    Get.snackbar(
      'QR Scanner',
      'Opening QR scanner...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}