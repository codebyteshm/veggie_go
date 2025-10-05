import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../address/controller/address_controller.dart';
import '../../payment/controller/payment_controller.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentCtrl = Get.isRegistered<PaymentController>() ? Get.find<PaymentController>() : null;
    final addressCtrl = Get.isRegistered<AddressController>() ? Get.find<AddressController>() : null;
    final addrIndex = addressCtrl?.selectedIndex ?? -1;
    final addr = addrIndex >= 0 ? addressCtrl!.addresses[addrIndex] : null;
    final totalPaid = paymentCtrl?.totalPayable ?? 400;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Order Confirmed!', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12.h),
              // Success Icon
              Container(
                width: 90.w,
                height: 90.w,
                decoration: BoxDecoration(
                  color: color29AE66.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: color29AE66, size: 40.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                'Your order has been placed successfully!',
                style: openSansSemiBold(textColor: color1C1C1C, fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text('Order #123456', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
              SizedBox(height: 2.h),
              Text('Expected delivery: 14 mins', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
              SizedBox(height: 16.h),

              // Summary Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorF4F4F4,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: colorDFDFDF),
                ),
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Summary', style: openSansSemiBold(textColor: color6A6A6A, fontSize: 12.sp)),
                    SizedBox(height: 10.h),
                    _itemRow('assets/png_image/orange.png', 'Orange', 'Qty: 2', 180),
                    SizedBox(height: 8.h),
                    Container(height: 1.h, color: colorDFDFDF),
                    SizedBox(height: 8.h),
                    _itemRow('assets/png_image/orange.png', 'Banana', 'Qty: 1', 220),
                    SizedBox(height: 12.h),
                    Container(height: 1.h, color: colorDFDFDF),
                    SizedBox(height: 12.h),
                    Text('Delivery Address', style: openSansSemiBold(textColor: color6A6A6A, fontSize: 12.sp)),
                    SizedBox(height: 8.h),
                    _addressBlock(addr),
                    SizedBox(height: 12.h),
                    Container(height: 1.h, color: colorDFDFDF),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text('Total Amount Paid', style: openSansSemiBold(textColor: color6A6A6A, fontSize: 12.sp)),
                        ),
                        Text('₹$totalPaid', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),
              CommonButton(
                width: double.infinity,
                height: 48.h,
                text: 'Track My Order',
                fontSize: 16.sp,
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                buttonMargin: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Get.toNamed(RoutesConstants.trackOrderView);
                },
              ),
              SizedBox(height: 12.h),
              CommonButton(
                width: double.infinity,
                height: 48.h,
                buttonMargin: EdgeInsets.zero,
                text: 'Continue Shopping',
                fontSize: 16.sp,
                backgroundColor: whiteColor,
                textColor: colorPrimary,
                border: Border.all(color: colorPrimary),
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Get.offAllNamed(RoutesConstants.mainScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemRow(String asset, String title, String subtitle, int price) {
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(asset, fit: BoxFit.cover),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: openSansSemiBold(textColor: color1C1C1C, fontSize: 14.sp)),
              SizedBox(height: 2.h),
              Text(subtitle, style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
            ],
          ),
        ),
        Text('₹$price', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
      ],
    );
  }

  Widget _addressBlock(DeliveryAddress? addr) {
    if (addr == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rahul Sharma', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
          SizedBox(height: 2.h),
          Text('+91 98765 43210', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
          SizedBox(height: 4.h),
          Text('B-204, Green Valley Apartments,\nSector 15, Gurgaon - 122001', style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp)),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(addr.name, style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp)),
        SizedBox(height: 2.h),
        Text('+91 98765 43210', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
        SizedBox(height: 4.h),
        Text(addr.addressLine, style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp)),
      ],
    );
  }
}
