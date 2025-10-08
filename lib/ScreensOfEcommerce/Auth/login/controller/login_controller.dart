import 'package:dio/dio.dart';
import 'package:e_commerce46/Common/string_extention.dart';
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
  List<FocusNode> focusNodes = [FocusNode(), FocusNode()];
  RxBool isLoading = false.obs;

  // Rx<Country> selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('974').obs;

  LoginResponse? loginModel;
  SendOtpModelResponse? sendOtpModelResponse;
  final isHidden = true.obs;

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    print("IsHidden = ${isHidden.value}");
  }

  void userLogin() {
    isLoading.value = true;
    DioHelper.postData(url: RestConstants.loginUrl, data: {"phone" : phoneNumberController.text})
        .then((value) async {
          isLoading.value = false;
          loginModel = LoginResponse.fromJson(value.data);
          if (loginModel?.data?.user?.role == "USER") {
            Utils.showErrorSnackBar("Seller Account");
          } else {
            await saveLoginDataToSP(loginModel!);
            SharedPreferenceUtil.putBool(isLoginKey, true);
            Get.offAllNamed(RoutesConstants.getStartView);
          }
        })
        .catchError((error) {
          isLoading.value = false;
          error.response?.data['message'].toString().toast;
        });
  }



  void sendOtp() {
    isLoading.value = true;
    DioHelper.postData(url: RestConstants.loginUrl, data: {"phone" : phoneNumberController.text})
        .then((value) async {
          isLoading.value = false;
          sendOtpModelResponse = SendOtpModelResponse.fromJson(value.data);
          if(sendOtpModelResponse?.status == true) {
            Get.toNamed(RoutesConstants.otpVerificationView, arguments: [(phoneNumberController.text)]);
          }else{
            sendOtpModelResponse?.message?.toast();
          }
        })
        .catchError((error) {
          isLoading.value = false;
          if (error is DioError) {
            Utils.showErrorSnackBar(error.response?.data['message']);
          }
        });
  }

  bool isValidateLogin({required String phoneNumber}) {
    if (phoneNumber.isEmpty || phoneNumber == "") {
      'Please enter mobile number '.toast();
      return false;
    }
    if (phoneNumber.length < 10) {
      'Please enter valid mobile number '.toast();
      return false;
    }
    return true;
  }

  void onTapLoginButton(LoginRequestModel loginRequestModel) {
    if (isValidateLogin(phoneNumber: loginRequestModel.phone.toString())) {
      // Navigate directly to home screen
      // Get.toNamed(RoutesConstants.otpVerificationView, arguments: ["${loginRequestModel.countryCode} ${loginRequestModel.phoneNumber}"]);
      // Previous OTP verification navigation (commented out)
      // Get.toNamed(RoutesConstants.otpVerificationView,arguments: [phoneNumberController]);
    sendOtp();
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
