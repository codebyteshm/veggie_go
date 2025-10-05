import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/payment_controller.dart';
import 'package:e_commerce46/routes/routes_strings.dart';

class PaymentMethodScreen extends GetView<PaymentController> {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Select Payment Method', showBackButton: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SummaryCard(controller: controller),
                  SizedBox(height: 12.h),
                  Obx(() {
                    return Column(
                      children: [
                        for (var i = 0; i < controller.methods.length; i++)
                          _MethodCard(option: controller.methods[i], onTap: () => controller.selectMethod(i)),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, -4))],
            ),
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
            child: Obx(() {
              return CommonButton(
                width: double.infinity,
                buttonMargin: EdgeInsets.zero,
                height: 48.h,
                text: 'Pay ₹${controller.totalPayable}',
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Get.toNamed(RoutesConstants.orderSuccessView);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({Key? key, required this.controller}) : super(key: key);
  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorDFDFDF),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('Item Total', '₹${controller.itemTotal.value}'),
            SizedBox(height: 6.h),
            _row('Delivery Charges', '₹Free', valueColor: color666666),
            SizedBox(height: 6.h),
            _row('Handling Charges', '₹Free', valueColor: color666666),
            SizedBox(height: 10.h),
            Container(height: 1.h, color: colorDFDFDF),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Total Payable',
                    style: openSansBold(textColor: color1C1C1C, fontSize: 14.sp),
                  ),
                ),
                Text(
                  '₹${controller.totalPayable}',
                  style: openSansBold(textColor: color1C1C1C, fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _row(String label, String value, {Color? valueColor}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: openSansRegular(textColor: color969696, fontSize: 12.sp),
          ),
        ),
        Text(
          value,
          style: openSansSemiBold(textColor: valueColor ?? color1C1C1C, fontSize: 12.sp),
        ),
      ],
    );
  }
}

class _MethodCard extends StatelessWidget {
  const _MethodCard({Key? key, required this.option, required this.onTap}) : super(key: key);
  final PaymentMethodOption option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selected = option.selected && option.enabled;
    final borderColor = selected ? colorPrimary : colorDFDFDF;
    final bg = option.enabled ? whiteColor : colorF4F4F4;

    return Opacity(
      opacity: option.enabled ? 1 : 0.6,
      child: GestureDetector(
        onTap: option.enabled ? onTap : null,
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: borderColor, width: 1),
          ),
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: colorF4F4F4),
                child: Image.asset(option.key),
                // child: Icon(_iconFor(option.key), color: color1C1C1C, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.title,
                      style: openSansSemiBold(textColor: color1C1C1C, fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      option.subtitle,
                      style: openSansRegular(textColor: color969696, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              _RadioVisual(selected: selected),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconFor(String key) {
    switch (key) {
      case 'upi':
        return Icons.phone_iphone;
      case 'wallet':
        return Icons.account_balance_wallet_outlined;
      case 'cod':
        return Icons.local_shipping_outlined;
      default:
        return Icons.payment;
    }
  }
}

class _RadioVisual extends StatelessWidget {
  const _RadioVisual({Key? key, required this.selected}) : super(key: key);
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.w,
      height: 22.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: selected ? colorPrimary : color969696),
        color: selected ? colorPrimary : Colors.transparent,
      ),
      child: selected ? Image.asset(PNGImages.icSelectedRadio) : null,
    );
  }
}
