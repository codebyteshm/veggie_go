import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerOrderTab extends StatefulWidget {
  const PartnerOrderTab({super.key});

  @override
  State<PartnerOrderTab> createState() => _PartnerOrderTabState();
}

class _PartnerOrderTabState extends State<PartnerOrderTab> {
  final List<Map<String, dynamic>> _orders = [
    {
      'name': 'Priya Sharma',
      'address': '301, Sunrise Apartments, Sector 15, Noida...',
      'orderId': '#121212121',
      'total': '₹1,245',
      'paid': true,
      'cod': true,
      'items': 10,
    },
    {
      'name': 'Priyank Yadav',
      'address': '506, Sam Apartments, , Morbi...',
      'orderId': '#121212121',
      'total': '₹1,245',
      'paid': false,
      'cod': true,
      'items': 10,
    },
    {
      'name': 'Priya Sharma',
      'address': '301, Sunrise Apartments, Sector 15, Noida...',
      'orderId': '#121212121',
      'total': '₹1,245',
      'paid': true,
      'cod': true,
      'items': 10,
    },
    {
      'name': 'Priya Sharma',
      'address': '301, Sunrise Apartments, Sector 15, Noida...',
      'orderId': '#121212121',
      'total': '₹1,245',
      'paid': true,
      'cod': true,
      'items': 10,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        children: [
          // Appbar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8.r), boxShadow: [BoxShadow(color: blackColor.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 2))]),
                  child: Center(child: SvgPicture.asset('assets/svg_image/back.svg', height: 18.h, color: color00394D)),
                ),
                Expanded(
                  child: Center(
                    child: Text('All Orders', style: openSansSemiBold(fontSize: 14.sp, textColor: color00394D)),
                  ),
                ),
                SizedBox(width: 32.w),
              ],
            ),
          ),
          // Filters
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: colorE1E1E1)),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg_image/search_ic.svg', height: 18.h, color: color969696),
                      SizedBox(width: 8.w),
                      Expanded(child: Text('Search by Order ID', style: openSansRegular(fontSize: 12.sp, textColor: color969696))),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text('By Date', style: openSansRegular(fontSize: 10.sp, textColor: color969696)),
                SizedBox(height: 6.h),
                Container(
                  height: 36.h,
                  decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10.r), border: Border.all(color: colorE1E1E1)),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  alignment: Alignment.centerLeft,
                  child: Text('mm/dd/yyyy', style: openSansRegular(fontSize: 12.sp, textColor: color969696)),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemCount: _orders.length,
              itemBuilder: (_, i) => _orderItem(_orders[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderItem(Map<String, dynamic> o) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.r), boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))]),
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
                      Text(o['name'], style: openSansBold(fontSize: 12.sp, textColor: color00394D)),
                      SizedBox(height: 4.h),
                      Text(o['address'], style: openSansRegular(fontSize: 10.sp, textColor: color969696), maxLines: 2),
                    ],
                  ),
                ),
                Container(
                  width: 28.h,
                  height: 28.h,
                  decoration: BoxDecoration(color: colorF0FDF4, borderRadius: BorderRadius.circular(8.r)),
                  child: Center(child: SvgPicture.asset(SVGImages.phone, height: 16.h, color: color29AE66)),
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
                      Text('Order ID:', style: openSansRegular(fontSize: 10.sp, textColor: color969696)),
                      Text('Total:', style: openSansRegular(fontSize: 10.sp, textColor: color969696)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(o['orderId'], style: openSansSemiBold(fontSize: 10.sp, textColor: color00394D)),
                    Text(o['total'], style: openSansSemiBold(fontSize: 12.sp, textColor: color00394D)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                _chip(o['paid'] ? 'Paid' : 'Unpaid', o['paid'] ? colorF0FDF4 : colorFFBFBF, o['paid'] ? color29AE66 : colorAD0101),
                SizedBox(width: 8.w),
                _chip('COD', colorEDEDED, color969696),
                const Spacer(),
                _chip('Total items ${o['items']}', colorF0FDF4, color29AE66),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    height: 40.h,
                    text: 'Start Delivery',
                    backgroundColor: colorPrimary,
                    textColor: whiteColor,
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: CommonButton(
                    height: 40.h,
                    text: 'View All',
                    backgroundColor: whiteColor,
                    textColor: color00394D,
                    borderColor: colorE1E1E1,
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {},
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
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20.r)),
      child: Text(text, style: openSansSemiBold(fontSize: 9.sp, textColor: tc)),
    );
  }
}
