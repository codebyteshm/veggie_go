
import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:e_commerce46/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_request.dart';
import 'login_response.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  RxBool isLoading = false.obs;
  // Rx<Country> selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('974').obs;

  LoginResponse? loginModel;
  final isHidden = true.obs;

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    print("IsHidden = ${isHidden.value}");
  }

  void userLogin({required LoginRequestModel loginRequestModel}) {
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.loginUrl,
      data: loginRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      loginModel = LoginResponse.fromJson(value.data);
      if (loginModel?.payload?.role == "Seller") {
        Utils.showErrorSnackBar("Seller Account");
      } else {
        // await saveLoginDataToSP(loginModel!);
        SharedPreferenceUtil.putBool(isLoginKey, true);
        SharedPreferenceUtil.putInt(userIdKey, loginModel?.payload?.id ?? 0);
        Get.offAllNamed(RoutesConstants.getStartView);
      }
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
        Utils.showErrorSnackBar(
          error.response?.data['message'],
        );
      }
    });
  }

  bool isValidateLogin({required String phoneNumber, required String password}) {
    if (phoneNumber.isEmpty || phoneNumber == "") {
      Utils.showErrorSnackBar('Please enter mobile number ');
      return false;
    }
    if (phoneNumber.length < 10) {
      Utils.showErrorSnackBar('Please enter valid mobile number ');
      return false;
    }
    return true;
  }

  void onTapLoginButton(LoginRequestModel loginRequestModel) {
    if (isValidateLogin(
        password: loginRequestModel.password.toString(),
        phoneNumber: loginRequestModel.phoneNumber.toString())) {
      // Navigate directly to home screen
      Get.offAllNamed(RoutesConstants.homeView);
      // Previous OTP verification navigation (commented out)
      // Get.toNamed(RoutesConstants.otpVerificationView,arguments: [phoneNumberController]);
      // userLogin(
      //   loginRequestModel: LoginRequestModel(
      //     countryCode: loginRequestModel.countryCode.toString(),
      //     phoneNumber: loginRequestModel.phoneNumber.toString(),
      //     password: loginRequestModel.password.toString(),
      //     deviceId: loginRequestModel.deviceId.toString(),
      //     deviceType: loginRequestModel.deviceType.toString(),
      //     pushToken: loginRequestModel.pushToken.toString(),
      //   ),
      // );
    }
  }
}
