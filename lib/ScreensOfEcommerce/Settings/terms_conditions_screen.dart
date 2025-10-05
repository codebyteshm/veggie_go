import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(
        title: 'Terms & Conditions',
        isShowBackArrow: true,
        showBackButton: true,
        color: whiteColor,
        elevation: 6,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            _section(
              '1. User Agreement',
              'By accessing and using this mobile application, you accept and agree to be bound by the terms and provision of this agreement. These terms apply to the entire website and any email or other type of communication between you and FreshMart.',
            ),
            _section(
              '2. Orders & Payments',
              'All orders placed through our app are subject to product availability. We reserve the right to refuse or cancel any order for any reason. Payment must be made at the time of ordering through our secure payment gateway. We accept all major cards and digital payment methods.',
            ),
            _section(
              '3. Refund & Cancellation',
              'Orders can be cancelled within 30 minutes of placement. Refunds for cancelled orders will be processed within 3-5 business days. For damaged or spoiled products, please contact our customer support within 24 hours of delivery for a refund or replacement.',
            ),
            _section(
              '4. Delivery Terms',
              'We strive to deliver fresh produce within the estimated delivery time. However, delivery times may vary due to weather conditions, traffic, or other unforeseen circumstances. We are not responsible for delays beyond our control.',
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'By continuing to use this app, you agree to our Terms & Conditions.',
                textAlign: TextAlign.center,
                style: openSansMedium(fontSize: 11.sp, textColor: color969696),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, String body) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorDFDFDF),
          boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: openSansBold(fontSize: 13.sp, textColor: color00394D)),
              SizedBox(height: 6.h),
              Text(body, style: openSansMedium(fontSize: 12.sp, textColor: color00394D)),
            ],
          ),
        ),
      ),
    );
  }
}