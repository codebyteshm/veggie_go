import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/routes/routes_strings.dart';

class PartnerDeliveryCompletedScreen extends StatelessWidget {
  const PartnerDeliveryCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100.h,
                  width: 100.h,
                  decoration: const BoxDecoration(
                    color: colorPrimary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/svg_image/tick.svg', height: 40.h, color: whiteColor),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Delivery Completed!',
                  style: openSansBold(fontSize: 20.sp, textColor: colorPrimary),
                ),
                SizedBox(height: 10.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: openSansRegular(fontSize: 13.sp, textColor: color4B5563),
                    children: [
                      const TextSpan(text: 'Order ID: '),
                      TextSpan(text: Get.arguments[0], style: openSansBold(fontSize: 13.sp, textColor: color0D1833)),
                      const TextSpan(text: ' has been\n'),
                      const TextSpan(text: 'successfully delivered.'),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                CommonButton(
                  text: 'Go to Home',
                  backgroundColor: colorPrimary,
                  textColor: whiteColor,
                  buttonMargin: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () {
                    Get.offAllNamed(RoutesConstants.partnerBottomTabBarScreen);
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