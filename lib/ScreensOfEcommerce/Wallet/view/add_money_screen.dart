import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/add_money_controller.dart';

class AddMoneyScreen extends GetView<AddMoneyController> {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Add Money', showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _balanceSmallCard(),
            SizedBox(height: 16.h),
            Text(
              'Quick Add',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            Center(child: _quickAddRow()),
            SizedBox(height: 16.h),
            Text(
              'Custom Amount',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            _amountField(),
            SizedBox(height: 16.h),
            Text(
              'Payment Method',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            _paymentMethod(),
            SizedBox(height: 20.h),
            CommonButton(
              text: 'Add Money',
              height: 48.h,
              width: double.infinity,
              backgroundColor: colorPrimary,
              textColor: whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              onTap: controller.addMoney,
            ),
          ],
        ),
      ),
    );
  }

  Widget _balanceSmallCard() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorDFDFDF),
          boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Balance',
                    style: openSansRegular(fontSize: 11.sp, textColor: color969696),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '₹${controller.balance.value.toStringAsFixed(0)}',
                    style: openSansBold(fontSize: 20.sp, textColor: color1C1C1C),
                  ),
                ],
              ),
            ),
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(color: colorF4F4F4, shape: BoxShape.circle),
              child: Image.asset(PNGImages.icWalletActive),
              // child: const Icon(Icons.account_balance_wallet, color: colorPrimary),
            ),
          ],
        ),
      );
    });
  }

  Widget _quickAddRow() {
    final amounts = [100.0, 500.0, 1000.0, 2000.0];
    return Obx(() {
      return Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        direction: Axis.horizontal,

        children: amounts.map((amt) {
          final selected = controller.selectedQuickAmount.value == amt;
          return GestureDetector(
            onTap: () => controller.selectQuick(amt),
            child: Container(
              width: Get.width / 2.4,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: selected ? colorPrimary : colorDFDFDF),
              ),
              alignment: Alignment.center,
              child: Text(
                '₹ ${amt.toStringAsFixed(0)}',
                style: openSansBold(textColor: color1C1C1C, fontSize: 12.sp),
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget _amountField() {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: controller.setCustom,
      decoration: InputDecoration(
        hintText: 'Enter Amount',
        hintStyle: openSansRegular(textColor: color969696, fontSize: 12.sp),
        filled: true,
        fillColor: whiteColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorDFDFDF),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorDFDFDF),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorPrimary),
        ),
      ),
    );
  }

  Widget _paymentMethod() {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorDFDFDF),
        ),
        child: Row(
          children: [
            Radio(value: controller.useUpi.value, activeColor: colorPrimary, onChanged: (v) => controller.useUpi.value = v ?? true),
            Text(
              'UPI',
              style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp),
            ),
          ],
        ),
      );
    });
  }
}
