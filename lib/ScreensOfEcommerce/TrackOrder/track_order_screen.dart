import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller/track_order_controller.dart';

class TrackOrderScreen extends GetView<TrackOrderController> {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Track My Order', showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OrderInfoCard(controller: controller),
              SizedBox(height: 12.h),
              _Timeline(controller: controller),
              SizedBox(height: 12.h),
              _DeliveryExecutiveCard(controller: controller),
              SizedBox(height: 12.h),
              _OrderItemsCard(),
              SizedBox(height: 16.h),

              // Bottom actions
              CommonButton(
                width: double.infinity,
                height: 48.h,
                text: 'Go to Payment',
                buttonMargin: EdgeInsets.zero,
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  Get.toNamed(RoutesConstants.paymentMethodView);
                },
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      height: 48.h,
                      text: 'Cancel Order',
                      buttonMargin: EdgeInsets.zero,
                      backgroundColor: const Color(0xFFEA4D4D),
                      textColor: whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        // Navigate to cancel order flow screens
                        Get.toNamed(RoutesConstants.cancelConfirmView);
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: colorDFDFDF),
                    ),
                    child: const Icon(Icons.settings, color: color969696),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrderInfoCard extends StatelessWidget {
  const _OrderInfoCard({Key? key, required this.controller}) : super(key: key);
  final TrackOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ${controller.orderId.value}',
              style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 8.h),
            Text(
              '${controller.customerName.value} • ${controller.customerPhone.value}',
              style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              controller.addressLine.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: openSansRegular(textColor: color969696, fontSize: 12.sp),
            ),
            SizedBox(height: 14.h),
            Container(
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(8.r)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(color: colorF0FDF4, borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Expected Delivery: ${controller.expectedDelivery.value}',
                      style: openSansSemiBold(textColor: colorPrimary, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({Key? key, required this.controller}) : super(key: key);
  final TrackOrderController controller;

  Color _dotColor(StatusState s) {
    switch (s) {
      case StatusState.completed:
        return colorPrimary;
      case StatusState.active:
        return colorPrimary;
      case StatusState.pending:
        return color0E0E0;
    }
  }

  IconData _iconFor(StatusState s) {
    switch (s) {
      case StatusState.completed:
        return Icons.check;
      case StatusState.active:
        return Icons.radio_button_checked;
      case StatusState.pending:
        return Icons.radio_button_unchecked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          for (var i = 0; i < controller.statuses.length; i++)
            _TimelineRow(
              status: controller.statuses[i],
              isLast: i == controller.statuses.length - 1,
              dotColor: _dotColor(controller.statuses[i].state),
              icon: _iconFor(controller.statuses[i].state),
            ),
        ],
      );
    });
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({Key? key, required this.status, required this.isLast, required this.dotColor, required this.icon}) : super(key: key);
  final TrackStatus status;
  final bool isLast;
  final Color dotColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline column
        Column(
          children: [
            Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
                border: Border.all(color: dotColor),
              ),
              child: Icon(icon, color: whiteColor, size: 16.sp),
            ),
            if (!isLast) Container(width: 2.w, height: 40.h, color: colorDFDFDF),
          ],
        ),
        SizedBox(width: 12.w),
        // Content
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status.title,
                  style: openSansSemiBold(textColor: status.state == StatusState.active ? colorPrimary : color1C1C1C, fontSize: 14.sp),
                ),
                SizedBox(height: 2.h),
                Text(
                  status.subtitle,
                  style: openSansRegular(textColor: status.state == StatusState.completed ? color969696 : color969696, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DeliveryExecutiveCard extends StatelessWidget {
  const _DeliveryExecutiveCard({Key? key, required this.controller}) : super(key: key);
  final TrackOrderController controller;

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
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(color: colorPrimary, shape: BoxShape.circle),
              child: const Icon(Icons.person, color: whiteColor),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Executive',
                    style: openSansSemiBold(textColor: color6A6A6A, fontSize: 12.sp),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    controller.deliveryExecutive.value,
                    style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            _roundIconButton(Icons.call),
          ],
        ),
      );
    });
  }

  Widget _roundIconButton(IconData icon) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(color: colorPrimary, shape: BoxShape.circle),
      child: Icon(icon, color: whiteColor, size: 18.sp),
    );
  }
}

class _OrderItemsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order Items (5 items)',
                  style: openSansSemiBold(textColor: color6A6A6A, fontSize: 12.sp),
                ),
              ),
              // optional more actions
            ],
          ),
          SizedBox(height: 10.h),
          _itemRow(PNGImages.orange, 'Organic Bananas', '1 kg', 45),
          SizedBox(height: 8.h),
          _itemRow(PNGImages.orange, 'Organic Bananas', '1 kg', 45),
          SizedBox(height: 8.h),
          Center(
            child: Text(
              'View all items',
              style: openSansSemiBold(textColor: color969696, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemRow(String asset, String title, String subtitle, int price) {
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(color: colorF4F4F4, borderRadius: BorderRadius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(asset, fit: BoxFit.cover),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
              ),
              SizedBox(height: 2.h),
              Text(
                subtitle,
                style: openSansRegular(textColor: color969696, fontSize: 12.sp),
              ),
            ],
          ),
        ),
        Text(
          '₹$price',
          style: openSansSemiBold(textColor: color1C1C1C, fontSize: 12.sp),
        ),
      ],
    );
  }
}