import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes_strings.dart';

class WalletDashboardScreen extends StatelessWidget {
  const WalletDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppBarWidget(
        title: wallet,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Balance Card
            _buildWalletBalanceCard(),
            SizedBox(height: 24.h),
            
            // Add Money Button
            CommonButton(
              text: addMoney,
              onTap: () {
                // Navigate to add money screen
              },
              backgroundColor: colorPrimary,
              textColor: whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              height: 48.h,
            ),
            SizedBox(height: 24.h),
            
            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  recentTransactions,
                  style: openSansSemiBold(
                    textColor: color1C1C1C,
                    fontSize: 16.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to transaction history
                    Get.toNamed(RoutesConstants.transactionHistory);
                  },
                  child: Text(
                    'View All',
                    style: openSansSemiBold(
                      textColor: colorPrimary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            
            // Transaction List
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletBalanceCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colorPrimary, colorPrimary.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            walletBalance,
            style: openSansRegular(
              textColor: whiteColor.withOpacity(0.8),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '\$',
                style: openSansBold(
                  textColor: whiteColor,
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '1,245.50',
                style: openSansBold(
                  textColor: whiteColor,
                  fontSize: 32.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('+12.5%', 'This Month'),
              _buildStatItem('\$245.50', 'This Week'),
              _buildStatItem('24', 'Transactions'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: openSansSemiBold(
            textColor: whiteColor,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: openSansRegular(
            textColor: whiteColor.withOpacity(0.8),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList() {
    final transactions = [
      _TransactionItem(
        title: 'Grocery Store',
        date: 'Today, 10:30 AM',
        amount: -45.99,
        isCredit: false,
        icon: Icons.shopping_bag_outlined,
      ),
      _TransactionItem(
        title: 'Wallet Top-up',
        date: 'Yesterday, 3:15 PM',
        amount: 100.00,
        isCredit: true,
        icon: Icons.account_balance_wallet_outlined,
      ),
      _TransactionItem(
        title: 'Restaurant',
        date: 'Yesterday, 1:45 PM',
        amount: -28.50,
        isCredit: false,
        icon: Icons.restaurant_outlined,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return _buildTransactionItem(transaction);
      },
    );
  }

  Widget _buildTransactionItem(_TransactionItem transaction) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: transaction.isCredit ? color4CAF50.withOpacity(0.1) : colorF44336.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: transaction.isCredit ? color4CAF50 : colorF44336,
              size: 20.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: openSansSemiBold(
                    textColor: color1C1C1C,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  transaction.date,
                  style: openSansRegular(
                    textColor: color6A6A6A,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.amount > 0 ? '+' : ''}\$${transaction.amount.abs().toStringAsFixed(2)}',
            style: openSansSemiBold(
              textColor: transaction.isCredit ? color4CAF50 : color1C1C1C,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionItem {
  final String title;
  final String date;
  final double amount;
  final bool isCredit;
  final IconData icon;

  _TransactionItem({
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
    required this.icon,
  });
}
