import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/get_my_order_response_model.dart';
import 'package:e_commerce46/utils/dateOrTime.dart';
import 'package:e_commerce46/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({Key? key}) : super(key: key);

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  BottomTabBarController bottomTabBarController = Get.find<BottomTabBarController>();

  @override
  void initState() {
    super.initState();
    bottomTabBarController.getMyOrderCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBarWidget(title: 'My Orders', showBackButton: true, isShowBackArrow: true, isShowTitle: true, centerTitle: true),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemBuilder: (_, i) {
          final data = _orders()[i];
          var orderData = bottomTabBarController.getMyOrderResponse.data?.orders?[i];
          return _orderCard(context, data,item1: orderData);
        },
        separatorBuilder: (_, __) => SizedBox(height: 12.h),
        // itemCount: _orders().length,
        itemCount: bottomTabBarController.getMyOrderResponse.data?.orders?.length ?? 0,
      ),
    );
  }

  List<_OrderItem> _orders() {
    return const [
      _OrderItem(
        id: '#ORD001234',
        dateTime: 'Dec 15, 2024 • 2:30 PM',
        status: 'Delivered',
        price: 245.50,
        summary: 'Apples, Bananas +2 more',
        emojis: '🍎🍎',
      ),
      _OrderItem(
        id: '#ORD001235',
        dateTime: 'Dec 14, 2024 • 4:15 PM',
        status: 'Pending',
        price: 189.25,
        summary: 'Carrots And Tomatoes',
        emojis: '🥕🍅',
      ),
      _OrderItem(
        id: '#ORD001236',
        dateTime: 'Dec 13, 2024 • 1:45 PM',
        status: 'Cancelled',
        price: 312.75,
        summary: 'Oranges, Banana +3 more',
        emojis: '🍊🍅',
      ),
    ];
  }

  Widget _orderCard(BuildContext context, _OrderItem item,{Orders? item1}) {
    final String summary = generateCompactOrderSummary(item1?.items ?? []);
    print(summary);
    print('object');
    return GestureDetector(
      onTap: () {
        Get.to(() => const OrderDetailsView());
      },
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorDFDFDF),
          boxShadow: [BoxShadow(color: blackColor.withOpacity(0.04), blurRadius: 8)],
        ),
        padding: EdgeInsets.all(12.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(child: Text('#${item1?.orderNumber ?? ''}', style: openSansBold(fontSize: 12.sp, textColor: color00394D))),
              _statusChip(item1?.status ?? ''),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Expanded(
                child: Text(formatIsoDate(item1?.createdAt.toString() ?? ''), style: openSansRegular(fontSize: 11.sp, textColor: color969696)),),],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(item.emojis, style: openSansBold(fontSize: 16.sp, textColor: color00394D)),
              SizedBox(width: 8.w),
              Expanded(child: Text(summary, style: openSansRegular(fontSize: 12.sp, textColor: color00394D), maxLines: 1, overflow: TextOverflow.ellipsis)),
            ],
          ),
          SizedBox(height: 10.h),
          Text('₹${item1?.totalAmount.toString() ?? ''}', style: openSansBold(fontSize: 14.sp, textColor: color00394D)),
        ]),
      ),
    );
  }

  String generateCompactOrderSummary(List<Items> items) {
    if (items.isEmpty) {
      return 'No items in order';
    }

    final Set<String> uniqueProductNames = {};
    for (final item in items) {
      // final productName = item['variant']?['product']?['name'];
      final productName = item.variant?.product?.name ?? '';
      if (productName != null) {
        uniqueProductNames.add(productName as String);
      }
    }

    final List<String> namesList = uniqueProductNames.toList();
    final int uniqueCount = namesList.length;

    if (uniqueCount == 0) {
      return 'No products';
    }

    if (uniqueCount <= 2) {
      return namesList.join(', ');
    } else {
      final String firstTwo = namesList.sublist(0, 2).join(', ');
      final int remaining = uniqueCount - 2;
      return '$firstTwo +$remaining more';
    }
  }

  Widget _statusChip(String status) {
    Color bg;
    Color fg;
    switch (status) {
      case 'Delivered':
        bg = const Color(0xFFDBF3E6); // light green
        fg = color29AE66;
        break;
      case 'Pending':
        bg = const Color(0xFFFFF0D9); // light amber
        fg = const Color(0xFFF0AD4E);
        break;
      case 'Cancelled':
        bg = const Color(0xFFFFE3E0); // light red
        fg = colorDC4326;
        break;
      default:
        bg = colorF4F4F4;
        fg = color969696;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20.r), border: Border.all(color: bg)),
      child: Text(status, style: openSansBold(fontSize: 10.sp, textColor: fg)),
    );
  }

  Widget _avatarBadge(String letter) {
    return Container(
      width: 34.w,
      height: 34.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF7EAC9),
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.10), blurRadius: 6)],
      ),
      child: Center(
        child: Container(
          width: 30.w,
          height: 30.w,
          decoration: const BoxDecoration(color: Color(0xFFFFC857), shape: BoxShape.circle),
          child: Center(
            child: Text(letter, style: openSansBold(fontSize: 14.sp, textColor: color00394D)),
          ),
        ),
      ),
    );
  }
}

class _OrderItem {
  final String id;
  final String dateTime;
  final String status;
  final double price;
  final String summary;
  final String emojis;

  const _OrderItem({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.price,
    required this.summary,
    required this.emojis,
  });
}

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Order Details', isShowBackArrow: true, isShowTitle: true, centerTitle: true, showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _orderDetailCard(),
              SizedBox(height: 12.h),
              _shippingAddressCard(),
              SizedBox(height: 12.h),
              _cartSummaryCard(),
              SizedBox(height: 16.h),
              CommonButton(
                width: double.infinity,
                height: 50.h,
                text: 'Reorder',
                buttonMargin: EdgeInsets.zero,
                backgroundColor: const Color(0xFF6B9B37),
                textColor: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                fontSize: 16.sp,
                onTap: () {
                  // TODO: Hook into reorder flow if available
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderDetailCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.04), blurRadius: 8)],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Details', style: openSansBold(textColor: color00394D, fontSize: 16.sp)),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order status', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
                  SizedBox(height: 4.h),
                  Text('Delivered', style: openSansSemiBold(textColor: color29AE66, fontSize: 12.sp)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Order Id', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
                  SizedBox(height: 4.h),
                  Text('#ORD001234', style: openSansSemiBold(textColor: colorPrimary, fontSize: 12.sp)),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ordered', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
                  SizedBox(height: 4.h),
                  Text('Mon 24, Jan 2023', style: openSansSemiBold(textColor: color00394D, fontSize: 12.sp)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Total price', style: openSansRegular(textColor: color969696, fontSize: 12.sp)),
                  SizedBox(height: 4.h),
                  Text('₹233 /-', style: openSansSemiBold(textColor: color00394D, fontSize: 12.sp)),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _itemRow(PNGImages.orange, 'Apple', '₹100', '/ Kg', '₹150 / Kg', '66% off', '03'),
          SizedBox(height: 12.h),
          _itemRow(PNGImages.orange, 'Orange', '₹50', '/ 500gm', '₹120 / 500 gm', '66% off', '02'),
        ],
      ),
    );
  }

  Widget _itemRow(String asset, String title, String price, String unit, String oldPrice, String discount, String qty) {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.w,
          decoration: BoxDecoration(color: colorF4F4F4, borderRadius: BorderRadius.circular(8.r)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(asset, fit: BoxFit.cover),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: openSansBold(textColor: color00394D, fontSize: 14.sp)),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(price, style: openSansBold(textColor: color29AE66, fontSize: 12.sp)),
                  Text(' $unit', style: openSansRegular(textColor: color29AE66, fontSize: 12.sp)),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(oldPrice, style: openSansRegular(textColor: color969696, fontSize: 11.sp).copyWith(decoration: TextDecoration.lineThrough)),
                  SizedBox(width: 6.w),
                  Text(discount, style: openSansRegular(textColor: color29AE66, fontSize: 11.sp)),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(qty, style: openSansBold(textColor: color00394D, fontSize: 16.sp)),
            SizedBox(height: 2.h),
            Text('Order Qty', style: openSansRegular(textColor: color969696, fontSize: 10.sp)),
          ],
        ),
      ],
    );
  }

  Widget _shippingAddressCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.04), blurRadius: 8)],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Address', style: openSansBold(textColor: color00394D, fontSize: 16.sp)),
          SizedBox(height: 16.h),
          Text('John deo', style: openSansBold(textColor: color00394D, fontSize: 14.sp)),
          SizedBox(height: 8.h),
          Text(
            '4517 Washington Ave. Manchester ,Kentucky \nPreston Rd. Inglewood',
            style: openSansRegular(textColor: color969696, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _cartSummaryCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.04), blurRadius: 8)],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cart Summary', style: openSansBold(textColor: color00394D, fontSize: 16.sp)),
          SizedBox(height: 16.h),
          _summaryRow('Total saving', '₹150/-'),
          SizedBox(height: 12.h),
          _summaryRow('Sub total', '₹550/-'),
          SizedBox(height: 12.h),
          Divider(color: colorDFDFDF, height: 1.h, thickness: 1),
          SizedBox(height: 12.h),
          _summaryRow('Total Amount', '₹400/-', isBold: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      children: [
        Expanded(child: Text(label, style: isBold ? openSansBold(textColor: color00394D, fontSize: 12.sp) : openSansRegular(textColor: color969696, fontSize: 12.sp))),
        Text(value, style: isBold ? openSansBold(textColor: color00394D, fontSize: 12.sp) : openSansRegular(textColor: color00394D, fontSize: 12.sp)),
      ],
    );
  }
}


