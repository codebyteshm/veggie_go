import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Wallet', showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _balanceCard(),
            SizedBox(height: 16.h),
            Row(children: [
              Expanded(child: _action('Add Money', Icons.add, onTap: () => Get.toNamed(RoutesConstants.addMoneyView))),
              SizedBox(width: 12.w),
              Expanded(child: _action('Transactions', Icons.list_alt, onTap: () => Get.toNamed(RoutesConstants.transactionsView))),
            ]),
            SizedBox(height: 16.h),
            _inviteCard(onTap: () => Get.toNamed(RoutesConstants.referralCoinsView)),
            SizedBox(height: 16.h),
            Align(alignment: Alignment.centerLeft, child: Text('Recent Activity', style: openSansBold(fontSize: 14.sp, textColor: color00394D))),
            SizedBox(height: 10.h),
            _txn('Money Added', 'Today, 2:30 PM', '+₹500', true),
            SizedBox(height: 8.h),
            _txn('Order Payment', 'Yesterday, 6:45 PM', '-₹125', false),
          ],
        ),
      ),
    );
  }

  Widget _action(String title, IconData icon, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(color: const Color(0xFF738C48), borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(color: whiteColor.withOpacity(0.2), shape: BoxShape.circle),
            child: Icon(icon, color: whiteColor),
          ),
          SizedBox(height: 8.h),
          Text(title, style: openSansBold(fontSize: 14.sp, textColor: whiteColor)),
        ],
      ),
    ));
  }

  Widget _txn(String title, String time, String amount, bool isCredit) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.r), boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)]),
      child: Row(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: (isCredit ? colorPrimary : colorDC4326).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Image.asset(isCredit ? PNGImages.icWalletPlus : PNGImages.icWalletCart),
            // child: Icon(isCredit ? Icons.add : Icons.shopping_cart, color: isCredit ? colorPrimary : colorDC4326),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: openSansSemiBold(fontSize: 12.sp, textColor: color1C1C1C)),
                SizedBox(height: 4.h),
                Text(time, style: openSansRegular(fontSize: 11.sp, textColor: color969696)),
              ],
            ),
          ),
          Text(
            amount,
            style: openSansSemiBold(fontSize: 12.sp, textColor: isCredit ? colorPrimary : colorDC4326),
          ),
        ],
      ),
    );
  }

  Widget _inviteCard({VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          // color: const Color(0xFFEFF6E9),
          gradient: LinearGradient(colors: [
            colorPrimary.withOpacity(0.10),
            colorPrimary.withOpacity(0.20),
            colorPrimary.withOpacity(0.30),
            colorPrimary.withOpacity(0.30),
            colorPrimary.withOpacity(0.20),
            colorPrimary.withOpacity(0.10),

          ]),
          borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(height: 36.w, width: 36.w, decoration: BoxDecoration(color: colorPrimary.withOpacity(0.15), shape: BoxShape.circle), child: Icon(Icons.card_giftcard, color: colorPrimary)),
          SizedBox(width: 12.w),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Invite friends and earn referral coins!', style: openSansSemiBold(fontSize: 12.sp, textColor: color1C1C1C)), SizedBox(height: 2.h), Text('Share your code and get rewards', style: openSansRegular(fontSize: 10.sp, textColor: color969696))])),
          Icon(Icons.chevron_right, color: color1C1C1C)
        ],
      ),
    ));
  }

  Widget _balanceCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
        border: Border.all(color: colorDFDFDF),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text('Available Balance', style: openSansRegular(fontSize: 12.sp, textColor: color969696)),
        SizedBox(height: 6.h),
        Text('₹1,250', style: openSansExtraBold(fontSize: 26.sp, textColor: color1C1C1C)),
        SizedBox(height: 6.h),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(PNGImages.icWalletActive,height: 16.h,width: 16.w,),
          SizedBox(width: 6.w),
          Text('Wallet Active', style: openSansRegular(fontSize: 12.sp, textColor: colorPrimary)),
        ])
      ]),
    );
  }
}


