
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/otpVerification/controller/otpVerification_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Home/view/test_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Common/common_appbar.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  OtpVerificationView({Key? key}) : super(key: key);
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
          color: Colors.transparent, showBackButton: true,
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
                        PNGImages.otpBg,
                        width: 192.w,
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        oTPVerification,
                        style: openSansBold(
                          textColor: color00394D,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        weJustSentYou,
                        style: openSansMedium(
                          textColor: colorPrimary.withOpacity(0.70),
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            at,
                            style: openSansMedium(
                              textColor: color6A6A6A,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'text---------',
                            style: openSansBold(
                              textColor: color282829,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      _buildOtpField(context),
                      SizedBox(height: 50.h),
                      CommonButton(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => TestHomeApp()));
                        },
                        buttonMargin: EdgeInsets.symmetric(horizontal: 20.w),
                        text: confirm,
                      ),
                      SizedBox(height: 50.h),
                      InkWell(
                        onTap: () {
                          // controller.forgotPassword(
                          //     forgotRequestModel: ForgotRequestModel(
                          //         countryCode: controller.email[4],
                          //         phoneNumber: controller.email[5]));
                        },
                        child: Text(
                          resendOTP,
                          style: openSansMedium(
                            textColor: color6A6A6A,
                            fontSize: 14.sp,
                          ),
                        ),
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

  Widget _buildOtpField(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            controller: controller.otpController,
            focusNode: controller.otpNode,
            errorAnimationController: controller.errorController,
            pinTheme: PinTheme(
                fieldWidth: 40.w,
                errorBorderColor: Colors.white,
                disabledColor: Colors.red,
                shape: PinCodeFieldShape.underline,
                activeFillColor: whiteColor,
                inactiveColor: colorDFDFDF,
                selectedFillColor: whiteColor,
                selectedColor: colorDFDFDF,
                inactiveFillColor: whiteColor,
                activeColor: colorDC4326,
                borderWidth: 1.h),
            cursorColor: blackColor,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            autoFocus: false,
            enableActiveFill: true,
            enablePinAutofill: true,
            animationType: AnimationType.fade,
            autoDisposeControllers: false,
            autovalidateMode: AutovalidateMode.always,
            textStyle: openSansBold(fontSize: 24.sp, textColor: color130F26),
            onChanged: (String value) {},
          ),
        ),
      ],
    );
  }
}
