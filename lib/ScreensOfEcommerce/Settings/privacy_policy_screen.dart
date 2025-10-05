import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(
        title: 'Privacy Policy',
        isShowBackArrow: true,
        showBackButton: true,
        color: whiteColor,
        elevation: 6,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _para(
              'This privacy policy explains how we collect, use, and protect your personal information when you use our fruits and vegetables store application.',
            ),
            SizedBox(height: 12.h),
            _section('1. Data Collection',
                'We collect information you provide directly to us, such as when you create an account, make a purchase, or contact us for support. This may include your name, email address, phone number, delivery address, and payment information.'),
            _section('2. Data Usage',
                'We use the information we collect to provide, maintain, and improve our services, process transactions, send you technical notices and support messages, and communicate with you about new products, services, and promotional offers.'),
            _section('3. Information Sharing',
                'We do not sell, trade, or rent your personal information to third parties. We may share your information with trusted service providers who assist us in operating our app and conducting our business, subject to confidentiality agreements.'),
            _section('4. Data Security',
                'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. This includes encryption, secure servers, and regular security audits.'),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Last updated: December 15, 2024',
                style: openSansMedium(fontSize: 11.sp, textColor: color969696),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _para(String text) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
      ),
      child: Text(text, style: openSansMedium(fontSize: 12.sp, textColor: color00394D)),
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