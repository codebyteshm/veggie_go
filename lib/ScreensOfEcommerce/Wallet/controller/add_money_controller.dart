import 'package:get/get.dart';

class AddMoneyController extends GetxController {
  final RxDouble balance = 1250.0.obs;
  final RxDouble selectedQuickAmount = 0.0.obs;
  final RxString customAmountText = ''.obs;
  final RxBool useUpi = true.obs;

  double get enteredAmount {
    if (customAmountText.value.isNotEmpty) {
      final parsed = double.tryParse(customAmountText.value.replaceAll(',', ''));
      return parsed ?? 0.0;
    }
    return selectedQuickAmount.value;
  }

  void selectQuick(double amt) {
    selectedQuickAmount.value = amt;
    customAmountText.value = '';
  }

  void setCustom(String text) {
    customAmountText.value = text;
    selectedQuickAmount.value = 0.0;
  }

  Future<void> addMoney() async {
    // if (enteredAmount <= 0) {
    //   Get.snackbar('Invalid Amount', 'Please enter a valid amount');
    //   return;
    // }
    // await Future.delayed(const Duration(milliseconds: 400));
    // balance.value += enteredAmount;
    Get.back();
    // Get.snackbar('Success', '₹${enteredAmount.toStringAsFixed(0)} added to wallet');
  }
}