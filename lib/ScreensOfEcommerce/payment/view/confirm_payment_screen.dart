import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/confirm_payment_controller.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConfirmPaymentController>();
    
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppBarWidget(
        title: 'Payment',
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCurrentPaymentMethod(),
              SizedBox(height: 24.h),
              _buildSelectNewPaymentMethod(controller),
              SizedBox(height: 24.h),
              Obx(() => controller.showUpiDetails.value 
                  ? _buildUpiDetails() 
                  : SizedBox.shrink()),
              heightBox(80.h),
              _buildActionButtons(controller),
              SizedBox(height: 16.h),
              _buildFooterText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Payment Method',
          style: openSansMedium(
            textColor: color6A6A6A,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: colorF3F4F6,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.money,
                  color: whiteColor,
                  size: 20.w,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COD',
                    style: openSansSemiBold(
                      textColor: color1C1C1C,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Cash on Delivery',
                    style: openSansRegular(
                      textColor: color6A6A6A,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: whiteColor,
                  size: 16.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectNewPaymentMethod(ConfirmPaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select New Payment Method',
          style: openSansMedium(
            textColor: color6A6A6A,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
        _buildPaymentOption(
          controller: controller,
          icon: Icons.qr_code_scanner,
          title: 'UPI/ QR Scan',
          subtitle: 'Digital payment',
          isSelected: controller.isUpiSelected,
          onTap: () => controller.selectPaymentMethod('UPI/ QR Scan'),
          iconColor: Color(0xFF2196F3),
          backgroundColor: Color(0xFFE3F2FD),
        ),
        SizedBox(height: 12.h),
        _buildPaymentOption(
          controller: controller,
          icon: Icons.account_balance_wallet,
          title: 'Cash Payment',
          subtitle: 'Digital payment',
          isSelected: controller.isCashSelected,
          onTap: () => controller.selectPaymentMethod('Cash Payment'),
          iconColor: Color(0xFF2196F3),
          backgroundColor: Color(0xFFE3F2FD),
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required ConfirmPaymentController controller,
    required IconData icon,
    required String title,
    required String subtitle,
    required RxBool isSelected,
    required VoidCallback onTap,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return Obx(() => GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected.value ? Color(0xFF6B9B37) : colorE0E0E0,
            width: isSelected.value ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20.w,
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: openSansSemiBold(
                    textColor: color1C1C1C,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  subtitle,
                  style: openSansRegular(
                    textColor: color6A6A6A,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isSelected.value ? Color(0xFF6B9B37) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected.value ? Color(0xFF6B9B37) : colorE0E0E0,
                  width: 2,
                ),
              ),
              child: isSelected.value
                  ? Icon(
                      Icons.circle,
                      color: whiteColor,
                      size: 12.w,
                    )
                  : null,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildUpiDetails() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorF3F4F6,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(PNGImages.icCustomerAgree,height: 20.h,width: 20.w,),
              SizedBox(width: 8.w),
              Text(
                'Customer agrees to switch\n to UPI payment?',
                style: openSansSemiBold(
                  textColor: color1C1C1C,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () => Get.find<ConfirmPaymentController>().scanQrCode(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: colorE5E7EB),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.qr_code_scanner,
                    color: Color(0xFF2196F3),
                    size: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Tap to scan QR or enter UPI ID',
                    style: openSansMedium(
                      textColor: color4B5563,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ConfirmPaymentController controller) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: controller.confirmPayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6B9B37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Confirm',
              style: openSansSemiBold(
                textColor: whiteColor,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 50.h,
          child: OutlinedButton(
            onPressed: controller.cancelPayment,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorE0E0E0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Cancel',
              style: openSansSemiBold(
                textColor: color6A6A6A,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterText() {
    return Text(
      'After confirmation, you will collect payment via selected method.',
      style: openSansRegular(
        textColor: color6A6A6A,
        fontSize: 12.sp,
      ),
      textAlign: TextAlign.center,
    );
  }
}