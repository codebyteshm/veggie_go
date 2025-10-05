import 'dart:async';

import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/utills.dart';
import 'otpVerification_request.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otpController = TextEditingController();
  FocusNode otpNode = FocusNode();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>.broadcast();
  RxBool isLoading = false.obs;
  var phoneNumber;

  @override
  void onInit() {
    phoneNumber = Get.arguments[0];
    // otpController.text = email[2].toString();
    super.onInit();
  }

  LoginResponse? loginResponse;
  void otp({required OtpRequestModel otpRequestModel}) {
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.verifyOtp,
      data: otpRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      loginResponse = LoginResponse.fromJson(value.data);
      // await saveLoginDataToSP(loginModel!);
      // SharedPreferenceUtil.putBool(isLoginKey, true);
      // SharedPreferenceUtil.putInt(userIdKey, loginModel?.payload?.id ?? 0);
      // email[1] == true
      //     ? SharedPreferenceUtil.putBool(isLoginKey, true)
      //     : SharedPreferenceUtil.putBool(isLoginKey, false);
      // if (email[1] == true) {
      //   if (email[3] == 1) {
      //     SharedPreferenceUtil.putBool(isLoginKey, false);
      //   } else {
      //     SharedPreferenceUtil.putBool(isLoginKey, false);
      //   }
      // } else {
      //   SharedPreferenceUtil.putBool(isLoginKey, false);
      // }
      // if (email[1] == true) {
      //   if (email[3] == 1) {
      //     Get.offAllNamed(RoutesConstants.loginView);
      //   } else {
      //     Get.offAllNamed(RoutesConstants.loginView);
      //     Utils.showErrorSnackBar("Seller Account Created");
      //   }
      // } else {
      //   Get.offAllNamed(RoutesConstants.resetPasswordView);
      // }
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
        Utils.showErrorSnackBar(
          error.response?.data['message'],
        );
      }
    });
  }

  bool isValidateLogin({required String otp}) {
    if (otp.isEmpty || otp == "") {
      Utils.showErrorSnackBar('Please enter otp');
      return false;
    }

    return true;
  }

  void onTapLoginButton(OtpRequestModel otpRequestModel) {
    if (isValidateLogin(
      otp: otpRequestModel.otp.toString(),
    )) {
      otp(
        otpRequestModel: OtpRequestModel(
          otp: otpRequestModel.otp.toString(),
        ),
      );
    }
  }
}
