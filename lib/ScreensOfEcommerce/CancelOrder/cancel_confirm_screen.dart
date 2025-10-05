import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CancelConfirmScreen extends StatelessWidget {
  const CancelConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Cancel Order', showBackButton: true),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(color: const Color(0xFFFFEAEA), shape: BoxShape.circle),
                  child: Icon(Icons.warning_amber_rounded, color: const Color(0xFFEA4D4D), size: 28.sp),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Are you sure you want to cancel\nyour order?',
                  textAlign: TextAlign.center,
                  style: openSansSemiBold(textColor: color1C1C1C, fontSize: 16.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  "You can't undo this action later.",
                  textAlign: TextAlign.center,
                  style: openSansRegular(textColor: color969696, fontSize: 12.sp),
                ),
                SizedBox(height: 20.h),
                CommonButton(
                  width: double.infinity,
                  height: 44.h,
                  buttonMargin: EdgeInsets.zero,
                  text: 'Yes, Cancel Order',
                  backgroundColor: colorPrimary,
                  textColor: whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    Get.toNamed(RoutesConstants.cancelReasonView);
                  },
                ),
                SizedBox(height: 10.h),
                CommonButton(
                  width: double.infinity,
                  height: 44.h,
                  text: 'Go Back',
                  backgroundColor: colorF4F4F4,
                  textColor: color1C1C1C,
                  buttonMargin: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
