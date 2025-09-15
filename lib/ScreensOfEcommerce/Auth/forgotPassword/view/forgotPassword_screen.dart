

import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/forgotPassword/controller/forGot_request.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/forgotPassword/controller/forgotPassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Common/common_appbar.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        extendBodyBehindAppBar: true,
        appBar: const CommonAppBarWidget(
          // toolbarHeight:20.h,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          color: Colors.transparent,
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Obx(
            () => Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height,
                  color: whiteColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 85.h),
                      Image.asset(
                        PNGImages.forgotPassBg,
                        width: 192.w,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        forgotPasswordText,
                        style: openSansBold(
                          textColor: color00394D,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        forgotPasswordSubText,
                        textAlign: TextAlign.center,
                        style: openSansMedium(
                          textColor: color6A6A6A,
                          height: 1.5.h,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                      //   child: _getPhoneNumber(),
                      // ),
                      SizedBox(height: 50.h),
                      CommonButton(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.onTapLoginButton(ForgotRequestModel(
                            // countryCode: "+${controller.selectedDialogCountry.value.phoneCode}",
                            phoneNumber: controller.phoneNumberController.text,
                          ));
                        },
                        buttonMargin: EdgeInsets.symmetric(horizontal: 20.w),
                        text: sendNow,
                      ),
                    ],
                  ),
                ),
                controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 4.w,
                        color: colorDC4326,
                      ))
                    : const Offstage()
              ],
            ),
          ),
        ));
  }

  // Widget _getPhoneNumber() {
  //   return Obx(
  //     () => CountryPicker(
  //       listOfFocusNode: controller.focusNodes,
  //       index: 0,
  //       focusNode: controller.focusNodes[0],
  //       controller: controller.phoneNumberController,
  //       onValuePicked: (Country country) {
  //         controller.selectedDialogCountry.value = country;
  //       },
  //       textInputAction: TextInputAction.done,
  //       selectedDialogCountry: controller.selectedDialogCountry.value,
  //     ),
  //   );
  // }
}
