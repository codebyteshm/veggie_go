import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_textField.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/create_account_step1/controller/create_account_step1_controller.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateAccountStep1View extends GetView<CreateAccountStep1Controller> {
  CreateAccountStep1View({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      extendBodyBehindAppBar: true,
      appBar: const CommonAppBarWidget(
        toolbarHeight: 0,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        color: Colors.transparent,
        showBackButton: false,
      ),
      body: InkWell(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Obx(
          () => Stack(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.asset(PNGImages.buyerLoginBackground, width: Get.width, fit: BoxFit.fitWidth),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 55.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65.w),
                          child: Image.asset(PNGImages.appLogo),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.w),
                          child: Text(
                            appSubText,
                            style: openSansSemiBold(textColor: color00394D, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 160.h),
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
                          boxShadow: [BoxShadow(blurRadius: 13, color: blackColor.withOpacity(0.05), offset: const Offset(0, -3))],
                        ),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30.h),
                                Text(hiThereWelcome, style: openSansBold(fontSize: 24.sp, textColor: color00394D)),
                                SizedBox(height: 2.h),
                                Text(hiThereWelcomeSubText, style: openSansMedium(fontSize: 14.sp, textColor: colorPrimary.withOpacity(0.70))),
                                SizedBox(height: 20.h),
                                Text(personalDetails, style: openSansBold(fontSize: 14.sp, textColor: color00394D)),
                                SizedBox(height: 14.h),
                                _firstName(),
                                SizedBox(height: 16.h),
                                _lastName(),
                                SizedBox(height: 16.h),
                                _mobileNumber(),
                                SizedBox(height: 16.h),
                                _email(),
                                SizedBox(height: 16.h),
                                _referral(),
                                SizedBox(height: 24.h),
                                Obx(
                                  ()=> CommonButton(
                                    showLoading: controller.isLoading.value,
                                    onTap: controller.onNext,
                                    text: next,
                                    backgroundColor: colorPrimary,
                                    textColor: whiteColor,
                                    height: 48.h,
                                    width: Get.width,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(alreadyAccount, style: openSansMedium(fontSize: 12.sp, textColor: colorPrimary.withOpacity(0.70))),
                                      GestureDetector(
                                        onTap: () => Get.toNamed(RoutesConstants.loginView),
                                        child: Text(login, style: openSansBold(fontSize: 12.sp, textColor: color00394D)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstName() {
    return CommonTextFormField(
      controller: controller.firstNameController,
      focusNode: controller.focusNodes[0],
      listOfFocusNode: controller.focusNodes,
      index: 0,
      textInputType: TextInputType.name,
      fontSize: 16.sp,
      hint: '$firstName *',
      hintColor: colorPrimary.withOpacity(0.70),
      textInputAction: TextInputAction.next,
      prefixIconName: SVGImages.profile,
    );
  }

  Widget _lastName() {
    return CommonTextFormField(
      controller: controller.lastNameController,
      focusNode: controller.focusNodes[1],
      listOfFocusNode: controller.focusNodes,
      index: 1,
      textInputType: TextInputType.name,
      fontSize: 16.sp,
      hint: '$lastName *',
      hintColor: colorPrimary.withOpacity(0.70),
      textInputAction: TextInputAction.next,
      prefixIconName: SVGImages.profile,
    );
  }

  Widget _mobileNumber() {
    return CommonTextFormField(
      controller: controller.phoneNumberController,
      focusNode: controller.focusNodes[2],
      listOfFocusNode: controller.focusNodes,
      index: 2,
      textInputType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.digitsOnly,
      ],
      fontSize: 16.sp,
      hint: '$mobileNumber *',
      hintColor: colorPrimary.withOpacity(0.70),
      textInputAction: TextInputAction.next,
      prefixIcon: SizedBox(
        width: 110,
        height: 45,
        child: Row(
          children: [
            widthBox(5),
            SvgPicture.asset(SVGImages.phone, color: colorPrimary),
            widthBox(10),
            VerticalDivider(indent: 6, endIndent: 6),
            widthBox(10),
            Text('+91', style: openSansBold(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }

  Widget _email() {
    return CommonTextFormField(
      controller: controller.emailController,
      focusNode: controller.focusNodes[3],
      listOfFocusNode: controller.focusNodes,
      index: 3,
      textInputType: TextInputType.emailAddress,
      fontSize: 16.sp,
      hint: '$emailAddressText *',
      hintColor: colorPrimary.withOpacity(0.70),
      textInputAction: TextInputAction.next,
      prefixIconName: SVGImages.email,
    );
  }

  Widget _referral() {
    return CommonTextFormField(
      controller: controller.referralCodeController,
      focusNode: controller.focusNodes[4],
      listOfFocusNode: controller.focusNodes,
      index: 4,
      textInputType: TextInputType.text,
      fontSize: 16.sp,
      hint: 'Enter A Referral Code',
      hintColor: colorPrimary.withOpacity(0.70),
      textInputAction: TextInputAction.done,
      prefixIconName: SVGImages.lock,
    );
  }
}


