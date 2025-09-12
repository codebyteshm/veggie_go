
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_textField.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/resetPassword/controller/resetPassword_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/resetPassword/controller/reset_request.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Common/common_appbar.dart';
import '../../../../utils/key.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        extendBodyBehindAppBar: true,
        appBar: const CommonAppBarWidget(
          // toolbarHeight:20.h,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          color: Colors.transparent,
        ),
        body: Obx(
          () => Stack(
            children: [
              InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  color: whiteColor,
                  child: SingleChildScrollView(
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
                          resetPasswordText,
                          style: openSansBold(
                            textColor: color00394D,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          resetPasswordSubText,
                          textAlign: TextAlign.center,
                          style: openSansMedium(
                            textColor: color6A6A6A,
                            height: 1.5.h,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: _getPassword(),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: _getConfirmPassword(),
                        ),
                        SizedBox(height: 50.h),
                        CommonButton(
                          onTap: () {
                            controller.onTapLoginButton(ResetPassRequestModel(
                                id: SharedPreferenceUtil.getInt(forgotId),
                                password: controller.passWordController.text,
                                confirmPassword:
                                    controller.confirmPassWordController.text));
                          },
                          buttonMargin: EdgeInsets.symmetric(horizontal: 20.w),
                          text: submit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: colorDC4326,
                      ),
                    )
                  : Offstage()
            ],
          ),
        ));
  }

  Widget _getPassword() {
    return Obx(
      () => CommonTextFormField(
          controller: controller.passWordController,
          focusNode: controller.focusNodes[0],
          listOfFocusNode: controller.focusNodes,
          index: 0,
          hint: newPassword,
          textInputAction: TextInputAction.next,
          // suffixIconName: SVGImages.eyeHide,
          passwordVisible: controller.isHidden.value,
          suffixIconWidget: Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 7.h),
            child: InkWell(
              onTap: () {
                controller.togglePasswordView();
              },
              child: !controller.isHidden.value
                  ? SvgPicture.asset(SVGImages.eye)
                  : SvgPicture.asset(SVGImages.eyeHide),
            ),
          ),
          prefixIconName: SVGImages.lock),
    );
  }

  Widget _getConfirmPassword() {
    return Obx(
      () => CommonTextFormField(
          controller: controller.confirmPassWordController,
          focusNode: controller.focusNodes[1],
          listOfFocusNode: controller.focusNodes,
          index: 1,
          hint: confirmPassword,
          textInputAction: TextInputAction.done,
          // suffixIconName: SVGImages.eyeHide,
          passwordVisible: controller.isHidden1.value,
          suffixIconWidget: Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 7.h),
            child: InkWell(
              onTap: () {
                controller.togglePasswordView1();
              },
              child: !controller.isHidden1.value
                  ? SvgPicture.asset(SVGImages.eye)
                  : SvgPicture.asset(SVGImages.eyeHide),
            ),
          ),
          prefixIconName: SVGImages.lock),
    );
  }
}
