
import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reset_request.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  RxBool isLoading = false.obs;
  final isHidden = true.obs;
  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    print("IsHidden = ${isHidden.value}");
  }

  final isHidden1 = true.obs;
  void togglePasswordView1() {
    isHidden1.value = !isHidden1.value;
    print("IsHidden = ${isHidden1.value}");
  }

  void resetPassword({required ResetPassRequestModel resetPassRequestModel}) {
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.resetPassword,
      data: resetPassRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      Get.offAllNamed(RoutesConstants.loginView);
      Utils.showSnackBar('Reset password successfully');
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
        Utils.showErrorSnackBar(
          error.response?.data['message'],
        );
      }
    });
  }

  bool isValidateSeller({
    required String password,
    required String confirmPassword,
  }) {
    if (password.isEmpty || password == "") {
      Utils.showErrorSnackBar('Please enter new password');
      return false;
    } else if (password.length < 6) {
      Utils.showErrorSnackBar(
          'password length must be at least 6 characters long');
      return false;
    } else if (confirmPassword.isEmpty || confirmPassword == "") {
      Utils.showErrorSnackBar('Please enter confirm password');
      return false;
    } else if (confirmPassword != password) {
      Utils.showErrorSnackBar('New password and confirm password must be same');
      return false;
    }
    return true;
  }

  void onTapLoginButton(ResetPassRequestModel resetPassRequestModel) {
    if (isValidateSeller(
      password: resetPassRequestModel.password.toString(),
      confirmPassword: resetPassRequestModel.confirmPassword.toString(),
    )) {
      resetPassword(
        resetPassRequestModel: ResetPassRequestModel(
          id: resetPassRequestModel.id,
          password: resetPassRequestModel.password.toString(),
          confirmPassword: resetPassRequestModel.confirmPassword.toString(),
        ),
      );
    }
  }
}
