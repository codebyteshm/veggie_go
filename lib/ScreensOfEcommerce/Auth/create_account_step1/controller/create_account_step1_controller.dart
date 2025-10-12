import 'package:dio/dio.dart';
import 'package:e_commerce46/Common/string_extention.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/create_account_step1/model/register_request_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
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
  SendOtpModelResponse? sendOtpModelResponse;
  LoginResponse? loginResponse;

  bool validate() {
    if (firstNameController.text.trim().isEmpty) {
      '$firstName required'.toast();
      return false;
    }
    if (lastNameController.text.trim().isEmpty) {
      '$lastName required'.toast();
      return false;
    }
    if (phoneNumberController.text.trim().length < 10) {
      'Please enter valid mobile number'.toast();
      return false;
    }
    if (emailController.text.trim().isNotEmpty && !GetUtils.isEmail(emailController.text.trim())) {
      'Please enter valid email'.toast();
      return false;
    }
    return true;
  }

  void onNext() {
    if (!validate()) return;
    registerCall();
  }

  /// Send OTP for registration and navigate to OTP screen on success
  void registerCall() {
    RegisterRequestModel registerRequestModel = RegisterRequestModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phone: phoneNumberController.text.trim(),
      email: emailController.text.trim(),
      role: 'USER',
      referredByCode: referralCodeController.text.trim()
    );
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.registerUrl,
      data: registerRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      loginResponse = LoginResponse.fromJson(value.data);
      await saveLoginDataToSP(loginResponse!);
      SharedPreferenceUtil.putBool(isLoginKey, true);
      if(loginResponse?.data?.user?.role == "USER") {
        Get.offAllNamed(RoutesConstants.mainScreen);
      }
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
        error.response?.data['message'].toString().toast;
      }
    });
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


