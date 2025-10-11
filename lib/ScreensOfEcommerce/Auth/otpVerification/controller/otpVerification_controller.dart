import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce46/Common/string_extention.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_request.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/utills.dart';

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

  void verifyOtpApiCall({required LoginRequestModel loginRequestModel}) {
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.verifyOtp,
      data: loginRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      loginResponse = LoginResponse.fromJson(value.data);
      await saveLoginDataToSP(loginResponse!);
      SharedPreferenceUtil.putBool(isLoginKey, true);
      if(loginResponse?.data?.user?.role == "USER"){
        Get.offAllNamed(RoutesConstants.mainScreen);
      }
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
          error.response?.data['message'].toString().toast;
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

  Future<void> onTapLoginButton() async {
    if (isValidateLogin(
      otp: otpController.text,
    )) {
      verifyOtpApiCall(
        loginRequestModel: LoginRequestModel(
          code: otpController.text,
            phone: phoneNumber,
            platform: Platform.isAndroid ? 'android' : 'ios',
            deviceId: await Utils.getDeviceId() ?? "",
        fcmToken: SharedPreferenceUtil.getString(fcmTokenKey),
        ),
      );
    }
  }
}
