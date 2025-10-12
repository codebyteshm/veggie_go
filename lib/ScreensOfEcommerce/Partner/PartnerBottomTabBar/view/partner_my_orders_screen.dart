import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/routes/routes_strings.dart';

class PartnerMyOrdersScreen extends StatefulWidget {
  const PartnerMyOrdersScreen({super.key});

  @override
  State<PartnerMyOrdersScreen> createState() => _PartnerMyOrdersScreenState();
}

class _PartnerMyOrdersScreenState extends State<PartnerMyOrdersScreen> {
  int _selectedTab = 0; // 0: All, 1: Completed, 2: On-hold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'My Orders', showBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Row(
              children: [
                _tabChip('All', 0),
                SizedBox(width: 8.w),
                _tabChip('Completed', 1),
                SizedBox(width: 8.w),
                _tabChip('On-hold', 2),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemCount: 5,
              itemBuilder: (_, index) => _orderItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabChip(String label, int index) {
    final bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? colorPrimary : whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: isSelected ? color166534 : colorE1E1E1),
        ),
        child: Text(
          label,
          style: openSansSemiBold(fontSize: 12.sp, textColor: isSelected ? whiteColor : color4B5563),
        ),
      ),
    );
  }

  Widget _orderItem(int index) {
    final bool isCompleted = index == 0 || _selectedTab == 1;
    final bool isOnHold = index == 1 || _selectedTab == 2;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Priya Sharma', style: openSansSemiBold(fontSize: 16.sp, textColor: color111827)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isCompleted ? colorDCFCE7 : (isOnHold ? colorF3F4F6 : colorF3F4F6),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    isCompleted ? 'Completed' : (isOnHold ? 'On-hold' : 'Pending'),
                    style: openSansSemiBold(fontSize: 10.sp, textColor: isCompleted ? color166534 : color4B5563),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              '301, Sunrise Apartments, Sector 15, Noida...',
              style: openSansRegular(fontSize: 14.sp, textColor: color6B7280),
              maxLines: 4,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order ID:', style: openSansRegular(fontSize: 14.sp, textColor: color4B5563)),
                      Text('Phone:', style: openSansRegular(fontSize: 14.sp, textColor: color4B5563)),
                      Text('Total:', style: openSansRegular(fontSize: 14.sp, textColor: color4B5563)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('#121212121', style: openSansSemiBold(fontSize: 14.sp, textColor: color111827)),
                    Text('+91 87654 32109', style: openSansSemiBold(fontSize: 14.sp, textColor: color111827)),
                    Text('₹892', style: openSansSemiBold(fontSize: 18.sp, textColor: colorPrimary)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                if (isOnHold) ...[
                  Expanded(
                    child: CommonButton(
                      height: 44.h,
                      text: 'Re-Accept',
                      backgroundColor: colorPrimary,
                      textColor: whiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {},
                      fontSize: 14.sp,
                      buttonMargin: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
                Expanded(
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: colorD1D5DB),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RoutesConstants.partnerOrderDetailView);
                      },
                      child: Center(
                        child: Text('View Order', style: openSansSemiBold(fontSize: 14.sp, textColor: color374151)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}