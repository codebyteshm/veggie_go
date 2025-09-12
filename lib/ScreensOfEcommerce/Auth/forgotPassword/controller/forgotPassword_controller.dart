import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/routes_strings.dart';
import '../../../../utils/utills.dart';
import 'forGot_request.dart';
import 'forgotPassword_response.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  List<FocusNode> focusNodes = [
    FocusNode(),
  ];
  Rx<Country> selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('974').obs;
  RxBool isLoading = false.obs;
  ForgotRespnse? forgotRespnse;
  void forgotPassword({required ForgotRequestModel forgotRequestModel}) {
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.forGot,
      data: forgotRequestModel.toJson(),
    ).then((value) async {
      isLoading.value = false;
      forgotRespnse = ForgotRespnse.fromJson(value.data);
      SharedPreferenceUtil.putInt(forgotId, forgotRespnse?.payload?.id ?? 0);
      Get.offAllNamed(RoutesConstants.otpVerificationView, arguments: [
        "+${selectedDialogCountry.value.phoneCode} ${phoneNumberController.text}",
        false,
        forgotRespnse?.payload?.otp,
        0,
        "+${selectedDialogCountry.value.phoneCode}",
        "${phoneNumberController.text}"
      ]);
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
        Utils.showErrorSnackBar(
          error.response?.data['message'],
        );
      }
    });
  }

  bool isValidateLogin({required String phoneNumber}) {
    if (phoneNumber.isEmpty || phoneNumber == "") {
      Utils.showErrorSnackBar('Please enter phone number ');
      return false;
    }
    return true;
  }

  void onTapLoginButton(ForgotRequestModel forgotRequestModel) {
    if (isValidateLogin(
        phoneNumber: forgotRequestModel.phoneNumber.toString())) {
      forgotPassword(
        forgotRequestModel: ForgotRequestModel(
          countryCode: forgotRequestModel.countryCode.toString(),
          phoneNumber: forgotRequestModel.phoneNumber.toString(),
        ),
      );
    }
  }
}
