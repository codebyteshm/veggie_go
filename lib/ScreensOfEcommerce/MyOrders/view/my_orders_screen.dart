import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes_strings.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: CommonAppBarWidget(
          title: myOrders,
          showBackButton: true,
          bottom: TabBar(
            isScrollable: true,
            labelColor: colorPrimary,
            unselectedLabelColor: color6A6A6A,
            indicatorColor: colorPrimary,
            labelStyle: openSansSemiBold(fontSize: 14.sp),
            unselectedLabelStyle: openSansMedium(fontSize: 14.sp),
            tabs: const [
              Tab(text: all),
              Tab(text: processing),
              Tab(text: delivered),
              Tab(text: cancelled),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList([
              _OrderItem(
                orderId: '#123456',
                date: '20 Sep 2023',
                itemCount: 3,
                total: 129.99,
                status: delivered,
                statusColor: color4CAF50,
              ),
              _OrderItem(
                orderId: '#123455',
                date: '19 Sep 2023',
                itemCount: 2,
                total: 89.99,
                status: processing,
                statusColor: color2196F3,
              ),
            ]),
            _buildOrderList([
              _OrderItem(
                orderId: '#123455',
                date: '19 Sep 2023',
                itemCount: 2,
                total: 89.99,
                status: processing,
                statusColor: color2196F3,
              ),
            ]),
            _buildOrderList([
              _OrderItem(
                orderId: '#123456',
                date: '20 Sep 2023',
                itemCount: 3,
                total: 129.99,
                status: delivered,
                statusColor: color4CAF50,
              ),
            ]),
            _buildEmptyState(cancelled),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(List<_OrderItem> orders) {
    if (orders.isEmpty) {
      return _buildEmptyState(all);
    }
    
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      itemCount: orders.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(_OrderItem order) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$order$orderId',
                      style: openSansSemiBold(
                        textColor: color1C1C1C,
                        fontSize: 14.sp,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: order.statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        order.status,
                        style: openSansSemiBold(
                          textColor: order.statusColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  order.date,
                  style: openSansRegular(
                    textColor: color6A6A6A,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${order.itemCount} $items',
                  style: openSansRegular(
                    textColor: color6A6A6A,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$total\$${order.total.toStringAsFixed(2)}',
                      style: openSansSemiBold(
                        textColor: color1C1C1C,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesConstants.orderDetails);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        viewDetails,
                        style: openSansSemiBold(
                          textColor: colorPrimary,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tracking progress bar
          if (order.status == processing)
            _buildTrackingProgress(),
        ],
      ),
    );
  }

  Widget _buildTrackingProgress() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colorF5F7F9,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order is being prepared',
            style: openSansSemiBold(
              textColor: color1C1C1C,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: colorE0E0E0,
                  valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                  minHeight: 6.h,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '50%',
                style: openSansSemiBold(
                  textColor: color1C1C1C,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String tabName) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 64.w,
            color: colorBDBDBD,
          ),
          SizedBox(height: 16.h),
          Text(
            'No $tabName Orders',
            style: openSansSemiBold(
              textColor: color1C1C1C,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'You don\'t have any $tabName orders yet.',
            style: openSansRegular(
              textColor: color6A6A6A,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              // Navigate to home or product listing
              Get.until((route) => Get.currentRoute == RoutesConstants.mainScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
            ),
            child: Text(
              'Continue Shopping',
              style: openSansSemiBold(
                textColor: whiteColor,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItem {
  final String orderId;
  final String date;
  final int itemCount;
  final double total;
  final String status;
  final Color statusColor;

  _OrderItem({
    required this.orderId,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
    required this.statusColor,
  });
}
