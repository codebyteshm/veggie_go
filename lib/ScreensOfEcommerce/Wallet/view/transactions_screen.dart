import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = _sampleItems();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Transactions', showBackButton: true),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final item = items[index];
          return _transactionTile(
            title: item.title,
            time: item.time,
            amount: item.amount,
            isCredit: item.amount.startsWith('+'),
            icon: item.icon,
            tint: item.tint,
          );
        },
      ),
    );
  }

  Widget _transactionTile({
    required String title,
    required String time,
    required String amount,
    required bool isCredit,
    required IconData icon,
    required Color tint,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.04), blurRadius: 8)],
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(color: tint.withOpacity(0.12), shape: BoxShape.circle),
            child: Icon(icon, color: tint),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
                SizedBox(height: 4.h),
                Text(time, style: openSansRegular(textColor: color969696, fontSize: 11.sp)),
              ],
            ),
          ),
          Text(amount, style: openSansSemiBold(textColor: isCredit ? colorPrimary : colorDC4326, fontSize: 12.sp)),
        ],
      ),
    );
  }

  List<_TxnItem> _sampleItems() {
    return [
      _TxnItem('Money Added via UPI', 'Today, 2:45 PM', '+₹500', Icons.add, colorPrimary),
      _TxnItem('Order Payment', 'Today, 11:30 AM', '-₹245', Icons.remove, colorDC4326),
      _TxnItem('Referral Bonus', 'Yesterday, 6:20 PM', '+₹50', Icons.card_giftcard, colorPrimary),
      _TxnItem('Withdrawal to Bank', 'Yesterday, 3:15 PM', '-₹300', Icons.arrow_upward, colorDC4326),
      _TxnItem('Money Added via Card', 'Jan 15, 4:22 PM', '+₹1,000', Icons.add, colorPrimary),
      _TxnItem('Order Payment', 'Jan 14, 7:45 AM', '-₹180', Icons.remove, colorDC4326),
    ];
  }
}

class _TxnItem {
  final String title;
  final String time;
  final String amount;
  final IconData icon;
  final Color tint;
  _TxnItem(this.title, this.time, this.amount, this.icon, this.tint);
}