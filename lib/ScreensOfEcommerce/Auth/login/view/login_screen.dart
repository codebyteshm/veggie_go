
import 'package:country_pickers/country.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_textField.dart';
import 'package:e_commerce46/Common/country_picker.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_request.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../../utils/utills.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
        ),
        body: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
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
                        child: Image.asset(
                          PNGImages.buyerLoginBackground,
                          width: Get.width,
                          height: Get.height,
                          fit: BoxFit.cover,
                        ),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ecommerce,
                                  style: openSansSemiBold(
                                    textColor: color00394D,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  commodityTrade,
                                  style: openSansSemiBold(
                                    textColor: color00394D,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  service,
                                  style: openSansSemiBold(
                                    textColor: color00394D,
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 150.h),
                        child: Container(
                          width: Get.width,
                          height: Get.height,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.r),
                                topRight: Radius.circular(15.r)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 13,
                                  color: blackColor.withOpacity(0.05),
                                  offset: const Offset(0, -3))
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  Text(
                                    welcomeBack,
                                    style: openSansBold(
                                        fontSize: 24.sp,
                                        textColor: color00394D),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    welcomeBackSubText,
                                    style: openSansMedium(
                                        fontSize: 16.sp,
                                        textColor: color6A6A6A),
                                  ),
                                  SizedBox(height: 20.h),
                                  _getPhoneNumber(),
                                  SizedBox(height: 20.h),
                                  _getPassword(),
                                  SizedBox(height: 24.h),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            RoutesConstants.forgotPasswordView);
                                      },
                                      child: Text(
                                        forgotPassword,
                                        style: openSansMedium(
                                            fontSize: 14.sp,
                                            textColor: color949494),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  CommonButton(
                                    onTap: () async {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      if(SharedPreferenceUtil.getString(
                                          fcmTokenKey)==""){
                                        String? fcmToken = '';
                                        // String? fcmToken = await FirebaseMessaging.instance.getToken();
                                        print("FCM Token: $fcmToken");
                                        await SharedPreferenceUtil.putString(fcmTokenKey, fcmToken);
                                      }
                                      controller.onTapLoginButton(LoginRequestModel(
                                          countryCode:
                                              "+${controller.selectedDialogCountry.value.phoneCode}",
                                          phoneNumber: controller
                                              .phoneNumberController.text,
                                          password: controller
                                              .passWordController.text,
                                          deviceId:
                                              await Utils.getDeviceId() ?? "",
                                          deviceType: Utils.getDeviceTypeID(),
                                          pushToken:
                                              SharedPreferenceUtil.getString(fcmTokenKey)));
                                      // isUserLogin = true;
                                    },
                                    buttonMargin: EdgeInsets.zero,
                                    text: logIn,
                                  ),
                                  SizedBox(height: 42.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        doNotAcc,
                                        style: openSansRegular(
                                            fontSize: 14.sp,
                                            textColor: color969696),
                                      ),
                                      SizedBox(width: 8.w),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(RoutesConstants
                                              .createAccountStep1View);
                                        },
                                        child: Text(
                                          createAccount,
                                          style: openSansBold(
                                              fontSize: 14.sp,
                                              textColor: colorDC4326),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 186.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        login,
                                        style: openSansMedium(
                                            fontSize: 16.sp,
                                            textColor: color6A6A6A),
                                      ),
                                      SizedBox(width: 8.w),
                                      InkWell(
                                        onTap: () {
                                          // Get.lazyPut<HomeController>(
                                          //     () => HomeController());
                                          // Get.lazyPut<CategoriesController>(
                                          //     () => CategoriesController());
                                          // Get.lazyPut<MyCartController>(
                                          //     () => MyCartController());
                                          // Get.lazyPut<MyOrderController>(
                                          //     () => MyOrderController());
                                          Future.delayed(
                                                  Duration(microseconds: 800))
                                              .then((value) =>
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(builder: (context) =>  MainScreen()),
                                                  // )

                                                  Get.toNamed(
                                                      RoutesConstants
                                                          .mainScreen,
                                                      arguments: [
                                                        false,
                                                        0,
                                                        false
                                                      ]));
                                          // isUserLogin = false;
                                        },
                                        child: Text(
                                          asGuest,
                                          style: openSansBold(
                                              fontSize: 16.sp,
                                              textColor: colorDC4326),
                                        ),
                                      ),
                                    ],
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

  Widget _getPhoneNumber() {
    return Obx(
      () => CountryPicker(
        listOfFocusNode: controller.focusNodes,
        index: 0,
        focusNode: controller.focusNodes[0],
        controller: controller.phoneNumberController,
        textInputAction: TextInputAction.next,
        onValuePicked: (Country country) {
          controller.selectedDialogCountry.value = country;
        },
        selectedDialogCountry: controller.selectedDialogCountry.value,
      ),
    );
  }

  Widget _getPassword() {
    return Obx(
      () => CommonTextFormField(
          controller: controller.passWordController,
          focusNode: controller.focusNodes[1],
          listOfFocusNode: controller.focusNodes,
          index: 1,
          hint: password,
          textInputAction: TextInputAction.done,
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
}
