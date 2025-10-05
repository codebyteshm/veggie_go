import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/cart/controller/cart_controller.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: const CommonAppBarWidget(
          title: 'Cart',
          isShowBackArrow: true,
          isShowTitle: true,
          centerTitle: true,
          showBackButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    ...controller.items.map((entry) => _CartItemCard(
                          entry: entry,
                          onIncrement: () => controller.increment(entry.id),
                          onDecrement: () => controller.decrement(entry.id),
                        )).toList(),
                    SizedBox(height: 16.h),
                    _buildPriceDetails(context, controller.subtotal),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
            _buildCheckoutButton(context, controller.totalPayable),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails(BuildContext context, double subtotal) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colorF5F5F5,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', '₹${subtotal.toStringAsFixed(0)}', isTotal: false),
          _buildPriceRow('Delivery Charges', '₹Free', isFree: true),
          _buildPriceRow('Handling Charges', '₹Free', isFree: true),
          SizedBox(height: 8.h),
          Divider(height: 20.h, thickness: 1, color: colorDFDFDF),
          SizedBox(height: 8.h),
          _buildPriceRow('Total Payable', '₹${subtotal.toStringAsFixed(0)}', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false, bool isFree = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? openSansBold(fontSize: 12.sp, textColor: color00394D)
                : openSansMedium(fontSize: 12.sp, textColor: color6A6A6A),
          ),
          Text(
            value,
            style: isTotal
                ? openSansBold(fontSize: 12.sp, textColor: color00394D)
                : openSansMedium(fontSize: 12.sp, textColor: isFree ? color00B517 : color00394D),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context, double total) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
        child: CommonButton(
          height: 48.h,
          fontSize: 14.sp,
          text: 'Proceed to Address Selection',
          backgroundColor: colorPrimary,
          textColor: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          onTap: () {
            Get.toNamed(RoutesConstants.addressView);
          },
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartEntry entry;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemCard({
    required this.entry,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: colorF0F0F0, blurRadius: 2, spreadRadius: 0, offset: const Offset(0, 1)),
        ],
        border: Border.all(color: colorDFDFDF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(entry.imagePath, width: 60.w, height: 60.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.name, style: openSansBold(fontSize: 12.sp, textColor: color00394D)),
                SizedBox(height: 2.h),
                Text(entry.unit, style: openSansMedium(fontSize: 11.sp, textColor: color6A6A6A)),
                SizedBox(height: 2.h),
                Obx(() => Text('₹${entry.price.toStringAsFixed(0)} x ${entry.quantity.value} = ₹${(entry.price * entry.quantity.value).toStringAsFixed(0)}',
                    style: openSansMedium(fontSize: 11.sp, textColor: color6A6A6A))),
              ],
            ),
          ),
          _buildQuantitySelector(),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colorF6F6F6,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _squareBtn(iconPath: Icons.remove, onTap: onDecrement),
          widthBox(16.w),
          Obx(() => Text('${entry.quantity.value}', style: openSansBold(fontSize: 12.sp, textColor: color00394D))),
          widthBox(16.w),
          _squareBtn(iconPath: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }

  Widget _squareBtn({required IconData iconPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Icon(iconPath, color: colorPrimary),
    );
  }
}

// Local model removed; using CartEntry from CartController