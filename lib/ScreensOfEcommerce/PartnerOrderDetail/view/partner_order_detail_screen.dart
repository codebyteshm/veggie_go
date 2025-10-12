import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/PartnerOrderDetail/controller/partner_order_detail_controller.dart';

class PartnerOrderDetailScreen extends GetView<PartnerOrderDetailController> {
  const PartnerOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.arrow_back,
              color: color00394D,
              size: 20.sp,
            ),
          ),
        ),
        title: Text(
          'Ongoing Order',
          style: openSansBold(
            fontSize: 16.sp,
            textColor: color00394D,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Header
                  _buildOrderHeader(),
                  SizedBox(height: 20.h),
                  
                  // Customer Information
                  _buildCustomerInfo(),
                  SizedBox(height: 20.h),
                  
                  // Items Ordered
                  _buildItemsOrdered(),
                  SizedBox(height: 20.h),
                  
                  // Bill Summary
                  _buildBillSummary(),
                  SizedBox(height: 20.h),
                  
                  // Order Progress
                  _buildOrderProgress(),
                  SizedBox(height: 80.h), // Space for bottom buttons
                ],
              ),
            ),
          ),
          
          // Bottom Buttons
          _buildBottomButtons(),
          
          // Bottom Navigation
          _buildBottomNavigation(),
        ],
      ),
    );
  }
  
  Widget _buildOrderHeader() {
    return Obx(() => Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.orderId.value,
                style: openSansBold(
                  fontSize: 14.sp,
                  textColor: color00394D,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF2E8),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  controller.orderStatus.value,
                  style: openSansMedium(
                    fontSize: 10.sp,
                    textColor: Color(0xFFFF9800),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Order Date',
                style: openSansRegular(
                  fontSize: 12.sp,
                  textColor: color969696,
                ),
              ),
              Spacer(),
              Text(
                controller.orderDate.value,
                style: openSansRegular(
                  fontSize: 12.sp,
                  textColor: color00394D,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Payment Status',
                style: openSansRegular(
                  fontSize: 12.sp,
                  textColor: color969696,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  controller.paymentStatus.value,
                  style: openSansMedium(
                    fontSize: 10.sp,
                    textColor: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
  
  Widget _buildCustomerInfo() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Information',
          style: openSansBold(
            fontSize: 14.sp,
            textColor: color00394D,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          controller.customerName.value,
          style: openSansBold(
            fontSize: 14.sp,
            textColor: color00394D,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.customerPhone.value,
          style: openSansRegular(
            fontSize: 12.sp,
            textColor: color969696,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'DELIVERY ADDRESS',
          style: openSansBold(
            fontSize: 10.sp,
            textColor: color969696,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          controller.deliveryAddress.value,
          style: openSansRegular(
            fontSize: 12.sp,
            textColor: color00394D,
          ),
        ),
      ],
    ));
  }
  
  Widget _buildItemsOrdered() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items Ordered',
          style: openSansBold(
            fontSize: 14.sp,
            textColor: color00394D,
          ),
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.orderItems.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final item = controller.orderItems[index];
            return _buildOrderItem(item);
          },
        ),
      ],
    ));
  }
  
  Widget _buildOrderItem(OrderItem item) {
    return Row(
      children: [
        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: colorF5F5F5,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: openSansBold(
                  fontSize: 12.sp,
                  textColor: color00394D,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                item.quantity,
                style: openSansRegular(
                  fontSize: 11.sp,
                  textColor: color969696,
                ),
              ),
            ],
          ),
        ),
        Text(
          '₹${item.price.toInt()}',
          style: openSansBold(
            fontSize: 12.sp,
            textColor: color00394D,
          ),
        ),
      ],
    );
  }
  
  Widget _buildBillSummary() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bill Summary',
          style: openSansBold(
            fontSize: 14.sp,
            textColor: color00394D,
          ),
        ),
        SizedBox(height: 12.h),
        _buildBillRow('Sub Total', '₹${controller.subTotal.value.toInt()}'),
        SizedBox(height: 8.h),
        _buildBillRow('Handling Charge', 'Free', isGreen: true),
        SizedBox(height: 8.h),
        _buildBillRow('Delivery Charge', 'Free', isGreen: true),
        SizedBox(height: 12.h),
        Divider(color: colorE1E1E1),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: openSansBold(
                fontSize: 14.sp,
                textColor: color00394D,
              ),
            ),
            Text(
              '₹${controller.grandTotal.value.toInt()}',
              style: openSansBold(
                fontSize: 14.sp,
                textColor: color00394D,
              ),
            ),
          ],
        ),
      ],
    ));
  }
  
  Widget _buildBillRow(String label, String value, {bool isGreen = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: openSansRegular(
            fontSize: 12.sp,
            textColor: color969696,
          ),
        ),
        Text(
          value,
          style: openSansRegular(
            fontSize: 12.sp,
            textColor: isGreen ? Color(0xFF4CAF50) : color00394D,
          ),
        ),
      ],
    );
  }
  
  Widget _buildOrderProgress() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Progress',
              style: openSansBold(
                fontSize: 14.sp,
                textColor: color00394D,
              ),
            ),
            if (controller.isOnHold.value)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'On hold',
                  style: openSansMedium(
                    fontSize: 10.sp,
                    textColor: Color(0xFF4CAF50),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            _buildProgressStep(0, 'Start', true),
            _buildProgressLine(true),
            _buildProgressStep(1, 'Processing', true),
            _buildProgressLine(false),
            _buildProgressStep(2, 'Payment', false),
            _buildProgressLine(false),
            _buildProgressStep(3, 'Completed', false),
          ],
        ),
      ],
    ));
  }
  
  Widget _buildProgressStep(int step, String label, bool isCompleted) {
    bool isCurrent = controller.currentStep.value == step;
    
    return Column(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: isCompleted ? Color(0xFF4CAF50) : (isCurrent ? Color(0xFF6B9B37) : colorE1E1E1),
            shape: BoxShape.circle,
          ),
          child: isCompleted
              ? Icon(Icons.check, color: whiteColor, size: 14.sp)
              : (isCurrent 
                  ? Container(
                      width: 8.w,
                      height: 8.w,
                      margin: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: openSansRegular(
            fontSize: 10.sp,
            textColor: isCompleted || isCurrent ? color00394D : color969696,
          ),
        ),
      ],
    );
  }
  
  Widget _buildProgressLine(bool isCompleted) {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        color: isCompleted ? Color(0xFF4CAF50) : colorE1E1E1,
      ),
    );
  }
  
  Widget _buildBottomButtons() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.06),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonButton(
              text: 'Go To Payment',
              backgroundColor: Color(0xFF6B9B37),
              textColor: whiteColor,
              borderRadius: BorderRadius.circular(8.r),
              height: 48.h,
              onTap: controller.goToPayment,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CommonButton(
              text: 'Cancel',
              backgroundColor: colorF5F5F5,
              textColor: color00394D,
              borderRadius: BorderRadius.circular(8.r),
              height: 48.h,
              onTap: controller.cancelOrder,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.06),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomNavItem(Icons.home, 'Home', true),
              _bottomNavItem(Icons.receipt_long, 'Orders', false),
              _bottomNavItem(Icons.local_shipping, 'Ongoing', false),
              _bottomNavItem(Icons.pending, 'Pending', false),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _bottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Color(0xFF6B9B37) : color969696,
          size: 20.sp,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: openSansRegular(
            fontSize: 10.sp,
            textColor: isActive ? Color(0xFF6B9B37) : color969696,
          ),
        ),
      ],
    );
  }
}