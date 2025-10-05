import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final referralCode = 'h123XYZ';
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Invite Friend', showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _inviteEarnCard(),
            SizedBox(height: 16.h),
            Text(
              'Your Referral Code',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            _referralCodeBox(referralCode),
            SizedBox(height: 16.h),
            Text(
              'Share via',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 12.h),
            _shareRow(referralCode),
            SizedBox(height: 16.h),
            _howItWorks(),
            SizedBox(height: 16.h),
            _termsNote(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _inviteEarnCard() {
    return Container(
      height: 132.h,
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF738C48),
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: AssetImage(PNGImages.imgSection),fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                child: Image.asset(PNGImages.icWalletCoin, height: 20, width: 20) /*Icon(Icons.card_giftcard, color: whiteColor)*/,
              ),
              SizedBox(width: 12.w),
              Text(
                'Invite & Earn!',
                style: openSansSemiBold(textColor: whiteColor, fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'Get 100 coins for each friend you invite\nYour friend also gets 100 coins on signup',
            style: openSansRegular(textColor: whiteColor.withOpacity(0.95), fontSize: 11.sp),
          ),
        ],
      ),
    );
  }

  Widget _referralCodeBox(String code) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: openSansSemiBold(textColor: colorPrimary, fontSize: 24.sp,),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Share this code with friends',
                  style: openSansRegular(textColor: color969696, fontSize: 11.sp),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: code));
              Get.snackbar('Copied', 'Referral code copied to clipboard');
            },
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(color: colorF4F4F4, shape: BoxShape.circle),
              child: const Icon(Icons.copy, color: color1C1C1C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _shareRow(String code) {
    Widget itemSvg(String asset, String label, VoidCallback onTap) {
      return Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              width: 48.w,
              height: 48.w,
              // decoration: BoxDecoration(color: colorF4F4F4, shape: BoxShape.circle),
              child: Center(child: Image.asset(asset, height: 48.h)),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: openSansRegular(textColor: color969696, fontSize: 10.sp),
          ),
        ],
      );
    }

    Widget itemIcon(IconData icon, String label, VoidCallback onTap) {
      return Column(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24.r),
            child: Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(color: colorF4F4F4, shape: BoxShape.circle),
              child: Center(child: Icon(icon, color: color1C1C1C)),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: openSansRegular(textColor: color969696, fontSize: 10.sp),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        itemSvg(PNGImages.icWP, 'WhatsApp', () => Get.snackbar('Share', 'Opening WhatsApp')),
        itemSvg(PNGImages.icSMS, 'SMS', () => Get.snackbar('Share', 'Opening SMS')),
        itemSvg(PNGImages.icEmailShare, 'Email', () => Get.snackbar('Share', 'Opening Email')),
        itemSvg(PNGImages.icCopy, 'Copy Link', () {
          Clipboard.setData(ClipboardData(text: 'https://app.example.com/invite?code=$code'));
          Get.snackbar('Link Copied', 'Invite link copied to clipboard');
        }),
        itemSvg(PNGImages.icShare, 'More', () => Get.snackbar('Share', 'More options')),
      ],
    );
  }

  Widget _howItWorks() {
    Widget step(int n, String text) {
      return Row(
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: const BoxDecoration(color: Color(0xFF738C48), shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              '$n',
              style: openSansBold(textColor: whiteColor, fontSize: 12.sp),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp),
            ),
          ),
        ],
      );
    }

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info, color: colorPrimary),
              SizedBox(width: 8.w),
              Text(
                'How it works',
                style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          step(1, 'Share your referral code with friends'),
          SizedBox(height: 10.h),
          step(2, 'Friend downloads app using your code'),
          SizedBox(height: 10.h),
          step(3, 'Both get 100 coins after first order'),
        ],
      ),
    );
  }

  Widget _termsNote() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xFFEAB308).withOpacity(0.10),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFFFE4B5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning_amber_outlined, color: const Color(0xFFEAB308)),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'Terms: Coins will be credited when your friend downloads',
              style: openSansRegular(textColor: Colors.black, fontSize: 11.sp),
            ),
          ),
        ],
      ),
    );
  }
}
