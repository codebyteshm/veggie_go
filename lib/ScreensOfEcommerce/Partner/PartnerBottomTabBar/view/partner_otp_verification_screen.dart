import 'dart:async';

import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PartnerOtpVerificationScreen extends StatefulWidget {
  const PartnerOtpVerificationScreen({super.key});

  @override
  State<PartnerOtpVerificationScreen> createState() => _PartnerOtpVerificationScreenState();
}

class _PartnerOtpVerificationScreenState extends State<PartnerOtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  FocusNode otpNode = FocusNode();
  StreamController<ErrorAnimationType> errorController =
  StreamController<ErrorAnimationType>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Otp Verification', showBackButton: true),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // Circular illustration with phone icon
              Image.asset(
                PNGImages.otpBg,
                width: 192.w,
              ),
              SizedBox(height: 18.h),
              Text(
                'Enter the 4-digit OTP provided by the customer to confirm this delivery.',
                textAlign: TextAlign.center,
                style: openSansSemiBold(fontSize: 16.sp, textColor:color374151),
              ),
              SizedBox(height: 10.h),
              Text(
                'Order ID: ${Get.arguments[0]}',
                style: openSansRegular(fontSize:14.sp, textColor: color6B7280),
              ),
              SizedBox(height: 16.h),
              _buildOtpField(context),
              SizedBox(height: 20.h),
              Text(
                'Ask the customer to share their delivery OTP',
                textAlign: TextAlign.center,
                style: openSansRegular(fontSize: 12.sp, textColor: color6B7280),
              ),
              SizedBox(height: 20.h),
              CommonButton(
                height: 44.h,
                text: 'Confirm Delivery',
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                buttonMargin: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(8.r),
                onTap: otpController.text.length == 6
                    ? () {
                        Get.toNamed(
                          RoutesConstants.partnerDeliveryCompletedView,
                          arguments: [Get.arguments[0]],
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
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
            controller: otpController,
            focusNode: otpNode,
            errorAnimationController: errorController,
            pinTheme: PinTheme(
                fieldWidth: 40.w,
                errorBorderColor: Colors.white,
                disabledColor: colorPrimary,
                shape: PinCodeFieldShape.underline,
                activeFillColor: whiteColor,
                inactiveColor: colorDFDFDF,
                selectedFillColor: whiteColor,
                selectedColor: colorDFDFDF,
                inactiveFillColor: whiteColor,
                activeColor: colorPrimary,
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