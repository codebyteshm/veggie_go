import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerHomeTab extends StatefulWidget {
  const PartnerHomeTab({super.key});

  @override
  State<PartnerHomeTab> createState() => _PartnerHomeTabState();
}

class _PartnerHomeTabState extends State<PartnerHomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Assign Orders',
                  style: openSansBold(fontSize: 16.sp, textColor: color00394D),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: openSansSemiBold(fontSize: 12.sp, textColor: colorPrimary),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: 2,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _orderCard(
                    name: 'Sarah Johnson',
                    addressLine1: '123 Oak Street, Apt 4B Downtown, City Center',
                    orderId: '#DL2024001',
                    phone: '+1 234-567-8900',
                    amount: 250,
                    paymentStatus: i == 0 ? "Paid" : 'Unpaid',
                    isPaid: i == 0 ? true : false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    // Header with stack: background + overlay stats card.
    return Container(
      height: 360.h,
      child: Stack(
        children: [
          Container(
            height: 210.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorPrimary,
              image: DecorationImage(image: AssetImage(PNGImages.homeBackground), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(SVGImages.sideManu),
                      const Spacer(),
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(borderRadius: BorderRadius.circular(80.r), child: Image.asset(PNGImages.dummyProfile)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90.w),
                    child: Image.asset(PNGImages.appLogo),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Hi, Alex',
                    style: openSansBold(fontSize: 18.sp, textColor: whiteColor),
                  ),
                  Text(
                    'Are You Ready for Delivery?',
                    style: openSansRegular(fontSize: 12.sp, textColor: whiteColor),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 20.w, right: 20.w, bottom: 0, child: _statsCard()),
        ],
      ),
    );
  }

  Widget _statsCard() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Text(
            'Activated',
            style: openSansRegular(fontSize: 12.sp, textColor: color969696),
          ),
          SizedBox(height: 6.h),
          Text(
            '3',
            style: openSansBold(fontSize: 32.sp, textColor: colorPrimary),
          ),
          SizedBox(height: 12.h),
          Container(height: 1.h, color: colorE1E1E1),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '1',
                    style: openSansBold(fontSize: 18.sp, textColor: color00394D),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Pending',
                    style: openSansRegular(fontSize: 12.sp, textColor: color969696),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '12',
                    style: openSansBold(fontSize: 18.sp, textColor: color00394D),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Completed',
                    style: openSansRegular(fontSize: 12.sp, textColor: color969696),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderCard({required String name, required String addressLine1, required String orderId, required String phone, required int amount, required String paymentStatus, required bool isPaid}) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: openSansSemiBold(fontSize: 14.sp, textColor: color1F2937),
                ),
              ),
              _statusBadge(paymentStatus, isPaid),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            color: Colors.transparent,
            width: 240.w,
            child: Text(
              addressLine1,
              style: openSansRegular(fontSize: 14.sp, textColor: color4B5563),
            ),
          ),

          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order $orderId  •  $phone',
                  style: openSansRegular(fontSize: 12.sp, textColor: color6B7280),
                ),
              ),
              Text(
                '₹$amount',
                style: openSansBold(fontSize: 18.sp, textColor: colorPrimary),
              ),
            ],
          ),
          SizedBox(height: 12.h),
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
              Expanded(
                child: Container(
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
              ),
              SizedBox(width: 10.w),
              _callButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String label, bool isPaid) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: isPaid ? colorDCFCE7 : colorFEE2E2, borderRadius: BorderRadius.circular(20.r)),
      child: Text(
        label,
        style: openSansSemiBold(fontSize: 11.sp, textColor: isPaid ? colorPrimary : colorAD0101),
      ),
    );
  }

  Widget _callButton() {
    return Container(
      width: 44.h,
      height: 44.h,
      decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: SvgPicture.asset(SVGImages.phone, height: 15.h, color: whiteColor),
      ),
    );
  }
}
