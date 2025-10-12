import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartnerPaymentCollectionScreen extends StatefulWidget {
  const PartnerPaymentCollectionScreen({super.key});

  @override
  State<PartnerPaymentCollectionScreen> createState() => _PartnerPaymentCollectionScreenState();
}

class _PartnerPaymentCollectionScreenState extends State<PartnerPaymentCollectionScreen> {
  String? _paymentMethod; // 'cod' or 'upi'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Payment Collection', showBackButton: true),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _orderInfoCard(),
                SizedBox(height: 12.h),
                _paymentMethodCard(),
                SizedBox(height: 12.h),
                _orderProgressCard(),
                SizedBox(height: 30.h),
                CommonButton(
                  height: 44.h,
                  text: 'Confirm Payment',
                  backgroundColor: _paymentMethod == null ? colorD1D5DB : colorPrimary,
                  textColor:  _paymentMethod == null ? color6B7280 :whiteColor,
                  buttonMargin: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: _paymentMethod == null
                      ? null
                      : () {
                          Get.toNamed(
                            RoutesConstants.partnerOtpVerificationView,
                            arguments: ['ORD-2025-00001'],
                          );
                        },
                ),
                SizedBox(height: 6.h),
                Center(
                  child: Text(
                    'Ensure payment is received before completing the delivery',
                    style: openSansRegular(fontSize: 10.sp, textColor: color969696),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _cardWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.r), border: Border.all(color: colorE1E1E1)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: child,
    );
  }

  Widget _orderInfoCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Order ID: ', style: openSansSemiBold(fontSize: 10.sp, textColor: color969696)),
              Text('#DEL789456', style: openSansSemiBold(fontSize: 10.sp, textColor: color0D1833)),
            ],
          ),
          SizedBox(height: 8.h),
          Text('Rajesh Kumar', style: openSansSemiBold(fontSize: 12.sp, textColor: color0D1833)),
          SizedBox(height: 4.h),
          Text('Building A-203, Green Valley Apartments, Sector 15, Noida - 201301', style: openSansRegular(fontSize: 11.sp, textColor: color4B5563)),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Total', style: openSansRegular(fontSize: 11.sp, textColor: color4B5563)),
                  Text('Amount', style: openSansRegular(fontSize: 11.sp, textColor: color4B5563)),
                ]),
              ),
              Text('₹485.00', style: openSansBold(fontSize: 14.sp, textColor: colorPrimary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentMethodCard() {
    return _cardWrapper(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Select Payment Method', style: openSansBold(fontSize: 12.sp, textColor: color0D1833)),
        SizedBox(height: 10.h),
        _paymentOption('Pay By COD', 'cod',),
        SizedBox(height: 10.h),
        _paymentOption('Pay By UPI', 'upi',),
      ]),
    );
  }

  Widget _paymentOption(String title, String value) {
    final selected = _paymentMethod == value;
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = value),
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: selected ? colorPrimary : colorD1D5DB),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(children: [
          Container(
            height: 18.h,
            width: 18.h,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: selected ? colorPrimary : colorD1D5DB, width: 2)),
            child: selected
                ? Center(
                    child: Container(height: 8.h, width: 8.h, decoration: const BoxDecoration(color: colorPrimary, shape: BoxShape.circle)),
                  )
                : null,
          ),
          SizedBox(width: 10.w),
          Expanded(child: Text(title, style: openSansSemiBold(fontSize: 12.sp, textColor: color0D1833))),
        ]),
      ),
    );
  }

  Widget _orderProgressCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order Progress',
                style: openSansSemiBold(fontSize: 12.sp, textColor: FigmaColors.textStrong),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _progressIcon('assets/svg_image/tick.svg', 'Start', active: true),
              _connector(active: true),
              _progressIcon(SVGImages.op2, 'Processing', active: true),
              _connector(active: false),
              _progressIcon(SVGImages.op3, 'Payment', active: false),
              _connector(active: false),
              _progressIcon(SVGImages.op4, 'Completed', active: false),
            ],
          ),
        ],
      ),
    );
  }


  Widget _progressIcon(String assetPath, String text, {bool active = false}) {
    return Column(children: [
      Container(
        height: 32.w,
        width: 32.w,
        decoration: BoxDecoration(color: active ? colorPrimary : colorF3F4F6, shape: BoxShape.circle, border: Border.all(color: active ? colorPrimary : colorE1E1E1)),
        alignment: Alignment.center,
        child: SvgPicture.asset(assetPath, height: 18.w, width: 18.w, color: active ? whiteColor : colorE1E1E1),
      ),
      SizedBox(height: 5.h),
      Text(text, textAlign: TextAlign.center, style: openSansMedium(fontSize: 11.sp, textColor: active ? colorPrimary : colorE1E1E1)),
    ]);
  }

  Widget _connector({bool active = false}) {
    return Container(height: 2.h, width: 30.w, color: active ? colorPrimary : colorE1E1E1);
  }
}