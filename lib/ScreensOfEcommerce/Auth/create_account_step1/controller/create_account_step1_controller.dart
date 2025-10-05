import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountStep1Controller extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  final List<FocusNode> focusNodes = List.generate(5, (_) => FocusNode());

  final RxBool isLoading = false.obs;

  bool validate() {
    if (firstNameController.text.trim().isEmpty) {
      Get.snackbar('', '$firstName required');
      return false;
    }
    if (lastNameController.text.trim().isEmpty) {
      Get.snackbar('', '$lastName required');
      return false;
    }
    if (phoneNumberController.text.trim().length < 10) {
      Get.snackbar('', 'Please enter valid mobile number');
      return false;
    }
    if (emailController.text.trim().isNotEmpty && !GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar('', 'Please enter valid email');
      return false;
    }
    return true;
  }

  void onNext() {
    if (!validate()) return;
    Get.toNamed(RoutesConstants.otpVerificationView, arguments: ['+91 ${phoneNumberController.text.trim()}']);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    referralCodeController.dispose();
    for (final node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}


