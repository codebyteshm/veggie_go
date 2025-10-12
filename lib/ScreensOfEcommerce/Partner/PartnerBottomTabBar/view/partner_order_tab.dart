import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PartnerOrderTab extends StatefulWidget {
  const PartnerOrderTab({super.key});

  @override
  State<PartnerOrderTab> createState() => _PartnerOrderTabState();
}

class _PartnerOrderTabState extends State<PartnerOrderTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'All Orders', showBackButton: true,isShowBackArrow: false,),
      body: Column(
        children: [

          // Filters
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                // Use subtle border to align with Partner Home card style
                border: Border.all(color: colorE1E1E1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: colorE1E1E1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg_image/search_ic.svg', height: 18.h, color: color969696),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'Search by Order ID',
                              style: openSansRegular(fontSize: 12.sp, textColor: color969696),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'By Date',
                      style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 36.h,
                      width: Get.width/2,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: colorE1E1E1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'mm/dd/yyyy',
                        style: openSansRegular(fontSize: 16.sp, textColor: blackColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // List
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

  Widget _orderItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        // Use subtle border to align with Partner Home card style
        border: Border.all(color: colorE1E1E1),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        'Priya Sharma',
                        style: openSansSemiBold(fontSize: 16.sp, textColor: color111827),
                      ),
                      SizedBox(height: 4.h),
                      // Address
                      Container(
                        color: Colors.transparent,
                        width: 230.w,
                        child: Text(
                          '301, Sunrise Apartments, Sector 15, Noida...',
                          style: openSansRegular(fontSize: 14.sp, textColor: color6B7280),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Forward indicator
                Container(
                  width: 40.h,
                  height: 40.h,
                  decoration: BoxDecoration(color: colorPrimary, shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(SVGImages.phone, height: 15.h, color: whiteColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID:',
                        style: openSansRegular(fontSize: 14.sp, textColor: color4B5563),
                      ),
                      Text(
                        'Total:',
                        style: openSansRegular(fontSize: 14.sp, textColor: color4B5563),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '#121212121',
                      style: openSansSemiBold(fontSize: 14.sp, textColor: color111827),
                    ),
                    Text(
                      '₹1,245',
                      style: openSansSemiBold(fontSize: 18.sp, textColor: colorPrimary),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                // Payment status chip aligned with Partner Home colors
                _chip(index == 0 ? 'Paid' : 'Unpaid', index == 0 ? colorDCFCE7 : colorFEE2E2, index == 0 ? color166534 : colorAD0101),
                SizedBox(width: 8.w),
                _chip('COD', color2B2B2A.withOpacity(0.1), color2B2B2A),
                const Spacer(),
                _chip('Total items ${10}', colorDCFCE7, color166534),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    height: 44.h,
                    text: 'Start Delivery',
                    backgroundColor: colorPrimary,
                    textColor: whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {},
                    fontSize: 14.sp,
                    buttonMargin: EdgeInsets.zero,
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  width: 104.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(color: colorD1D5DB),
                  ),
                  child: Center(
                    child: Text(
                      "View all",
                      style: openSansSemiBold(fontSize: 14.sp, textColor: color374151),
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

  Widget _chip(String text, Color bg, Color tc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20.r)),
      child: Text(
        text,
        style: openSansSemiBold(fontSize: 12.sp, textColor: tc),
      ),
    );
  }
}
