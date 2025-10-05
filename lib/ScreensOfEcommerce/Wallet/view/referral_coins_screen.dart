import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/referral_coins_controller.dart';

class ReferralCoinsScreen extends GetView<ReferralCoinsController> {
  const ReferralCoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Referral Coins', showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _coinsCard(),
            SizedBox(height: 16.h),
            _inviteCard(),
            SizedBox(height: 16.h),
            _historyHeader(),
            SizedBox(height: 8.h),
            _historyList(),
          ],
        ),
      ),
    );
  }

  Widget _coinsCard() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF738C48),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            // Icon(Icons.savings, color: whiteColor, size: 28.sp),
            Image.asset(PNGImages.icWalletCoin,height: 40.h,width: 40.w,),
            SizedBox(height: 8.h),
            Text('You have 500 Coins', style: openSansSemiBold(textColor: whiteColor, fontSize: 14.sp)),
            SizedBox(height: 4.h),
            Text('1 Coin = ₹1 conversion value', style: openSansRegular(textColor: whiteColor.withOpacity(0.9), fontSize: 11.sp)),
          ],
        ),
      );
  }

  Widget _inviteCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: const Color(0xFFEFF6E9), borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(color: colorPrimary.withOpacity(0.15), shape: BoxShape.circle),
                child: Icon(Icons.group_add, color: colorPrimary),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Invite Friends & Earn', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
                    SizedBox(height: 2.h),
                    Text('Invite your friends and both of you earn 100 coins!', style: openSansRegular(textColor: color1C1C1C, fontSize: 11.sp)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CommonButton(
            text: 'Invite Now',
            height: 44.h,
            width: double.infinity,
            backgroundColor: colorPrimary,
            textColor: whiteColor,
            borderRadius: BorderRadius.circular(12.r),
            onTap: () {
              Get.toNamed(RoutesConstants.inviteFriendView);
            },
          ),
        ],
      ),
    );
  }

  Widget _historyHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Referral History', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 14.sp)),
        Icon(Icons.watch_later_outlined, color: color969696),
      ],
    );
  }

  Widget _historyList() {
    final items = controller.history;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        final item = items[index];
        final coins = item['coins'] as int;
        final isCredit = coins > 0;
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.r), border: Border.all(color: colorDFDFDF)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title'], style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
                    SizedBox(height: 4.h),
                    Text(item['date'], style: openSansRegular(textColor: color969696, fontSize: 11.sp)),
                  ],
                ),
              ),
              Text('${isCredit ? '+' : ''}${coins} coins', style: openSansSemiBold(textColor: isCredit ? colorPrimary : colorDC4326, fontSize: 12.sp)),
            ],
          ),
        );
      },
    );
  }
}