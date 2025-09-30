import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppBarWidget(
        title: 'Order #123456',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status
            _buildOrderStatus(),
            SizedBox(height: 24.h),
            
            // Order Items
            _buildSectionTitle(orderSummary),
            SizedBox(height: 12.h),
            _buildOrderItems(),
            SizedBox(height: 16.h),
            
            // Delivery Information
            _buildSectionTitle(deliveryInfo),
            SizedBox(height: 12.h),
            _buildDeliveryInfo(),
            SizedBox(height: 16.h),
            
            // Payment Information
            _buildSectionTitle(paymentInfo),
            SizedBox(height: 12.h),
            _buildPaymentInfo(),
            SizedBox(height: 16.h),
            
            // Order Summary
            _buildOrderSummary(),
            SizedBox(height: 24.h),
            
            // Action Buttons
            _buildActionButtons(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorF5F7F9,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: color4CAF50,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Order Delivered',
                style: openSansSemiBold(
                  textColor: color1C1C1C,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Your order has been delivered on 22 Sep 2023',
            style: openSansRegular(
              textColor: color6A6A6A,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 12.h),
          LinearProgressIndicator(
            value: 1.0,
            backgroundColor: colorE0E0E0,
            valueColor: AlwaysStoppedAnimation<Color>(color4CAF50),
            minHeight: 6.h,
            borderRadius: BorderRadius.circular(3.r),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Placed',
                style: openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                'Shipped',
                style: openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                'Out for Delivery',
                style: openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                'Delivered',
                style: openSansSemiBold(
                  textColor: color4CAF50,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: openSansSemiBold(
        textColor: color1C1C1C,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildOrderItems() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // Sample data
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return _buildOrderItem();
      },
    );
  }

  Widget _buildOrderItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: colorF5F7F9,
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage('assets/images/product_placeholder.png'),
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
                'Fresh Organic Tomatoes',
                style: openSansSemiBold(
                  textColor: color1C1C1C,
                  fontSize: 14.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                '1kg',
                style: openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '\$3.99',
                style: openSansSemiBold(
                  textColor: color1C1C1C,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        Text(
          'Qty: 2',
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryInfo() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorF5F7F9,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Name', 'John Doe'),
          SizedBox(height: 8.h),
          _buildInfoRow('Phone', '+1 234 567 8900'),
          SizedBox(height: 8.h),
          _buildInfoRow('Address', '123 Main St, Apt 4B\nNew York, NY 10001'),
          SizedBox(height: 8.h),
          _buildInfoRow('Delivery Date', '22 Sep 2023'),
          SizedBox(height: 8.h),
          _buildInfoRow('Delivery Time', '10:00 AM - 12:00 PM'),
        ],
      ),
    );
  }

  Widget _buildPaymentInfo() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorF5F7F9,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Payment Method', 'Credit Card (•••• 4242)'),
          SizedBox(height: 8.h),
          _buildInfoRow('Payment Status', 'Paid'),
          SizedBox(height: 8.h),
          _buildInfoRow('Transaction ID', 'TXN123456789'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: openSansRegular(
              textColor: color6A6A6A,
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            value,
            style: openSansMedium(
              textColor: color1C1C1C,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorF5F7F9,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildSummaryRow(subtotal, '\$129.98'),
          SizedBox(height: 8.h),
          _buildSummaryRow(shipping, '\$5.99'),
          SizedBox(height: 8.h),
          _buildSummaryRow(discount, '-\$10.00'),
          SizedBox(height: 8.h),
          _buildSummaryRow(tax, '\$12.60'),
          SizedBox(height: 12.h),
          Divider(height: 1, color: colorE0E0E0),
          SizedBox(height: 12.h),
          _buildSummaryRow(
            grandTotal,
            '\$138.57',
            isBold: true,
            textColor: colorPrimary,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false, Color? textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? openSansSemiBold(
                  textColor: textColor ?? color1C1C1C,
                  fontSize: 14.sp,
                )
              : openSansRegular(
                  textColor: color6A6A6A,
                  fontSize: 14.sp,
                ),
        ),
        Text(
          value,
          style: isBold
              ? openSansSemiBold(
                  textColor: textColor ?? color1C1C1C,
                  fontSize: 14.sp,
                )
              : openSansMedium(
                  textColor: color1C1C1C,
                  fontSize: 14.sp,
                ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CommonButton(
            text: 'Need Help?',
            onTap: () {
              // Navigate to help center
            },
            backgroundColor: whiteColor,
            textColor: color1C1C1C,
            border: Border.all(color: colorE0E0E0),
            borderRadius: BorderRadius.circular(8.r),
            height: 48.h,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CommonButton(
            text: 'Reorder',
            onTap: () {
              // Handle reorder
            },
            backgroundColor: colorPrimary,
            textColor: whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            height: 48.h,
          ),
        ),
      ],
    );
  }
}
