import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/cancel_order_controller.dart';

class CancelReasonScreen extends GetView<CancelOrderController> {
  const CancelReasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Select Cancellation Reason', showBackButton: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final selected = controller.selectedReason.value;
                  return ListView.separated(
                    itemCount: controller.reasons.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      final reason = controller.reasons[index];
                      final isSelected = selected == reason;
                      return InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () => controller.selectReason(reason),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: isSelected ? colorPrimary : colorDFDFDF),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: isSelected ? colorPrimary : color969696,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  reason,
                                  style: openSansRegular(
                                    textColor: color1C1C1C,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Obx(() {
                final enabled = controller.selectedReason.value.isNotEmpty;
                return Column(
                  children: [
                    CommonButton(
                      buttonMargin: EdgeInsets.zero,
                      width: double.infinity,
                      height: 44.h,
                      text: 'Submit Cancellation',
                      backgroundColor: enabled ? colorPrimary : colorD1D5DB,
                      textColor: enabled ? whiteColor : color969696,
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: enabled
                          ? () {
                              // Here you'd call API to cancel. For now we just pop to previous screens.
                              Get.back();
                              Get.back();
                              Get.snackbar('Order Cancelled', 'Your order has been cancelled.', snackPosition: SnackPosition.BOTTOM);
                            }
                          : null,
                    ),
                    SizedBox(height: 10.h),
                    CommonButton(
                      width: double.infinity,
                      height: 44.h,
                      buttonMargin: EdgeInsets.zero,
                      text: 'Go Back',
                      backgroundColor: colorF3F4F6,
                      textColor: color1C1C1C,
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () => Get.back(),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}