import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              // Success Icon
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: color29AE66.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: color29AE66,
                    size: 60.w,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              
              // Success Message
              Text(
                orderPlacedSuccessfully,
                style: openSansBold(
                  textColor: color1C1C1C,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Your order has been placed successfully! You will receive an order confirmation shortly.',
                style: openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              
              // Order Details Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: colorF9F9F9,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: colorE1E1E1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOrderDetailRow(orderId, '#123456'),
                    SizedBox(height: 12.h),
                    _buildOrderDetailRow(orderDate, '20 Sep 2023, 10:30 AM'),
                    SizedBox(height: 12.h),
                    _buildOrderDetailRow(orderTotal, '\$24.99'),
                    SizedBox(height: 12.h),
                    _buildOrderDetailRow(paymentMethod, 'Credit Card (•••• 4242)'),
                    SizedBox(height: 12.h),
                    _buildOrderDetailRow(deliveryAddress, '123 Main St, Apt 4B, New York, NY 10001'),
                    SizedBox(height: 12.h),
                    _buildOrderDetailRow(expectedDelivery, '22 Sep 2023'),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Buttons
              CommonButton(
                text: trackOrder,
                onTap: () {
                  // Navigate to track order screen
                },
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                height: 48.h,
              ),
              SizedBox(height: 16.h),
              CommonButton(
                text: continueShopping,
                onTap: () {
                  // Navigate to home screen
                  // Get.offAllNamed(Routes.HOME);
                },
                backgroundColor: whiteColor,
                textColor: colorPrimary,
                border: Border.all(color: colorPrimary, width: 1),
                borderRadius: BorderRadius.circular(8.r),
                height: 48.h,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: openSansMedium(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: openSansMedium(
              textColor: color1C1C1C,
              fontSize: 14.sp,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
