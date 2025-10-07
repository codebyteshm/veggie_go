import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Driver/controller/driver_controller.dart';

class DriverScreen extends GetView<DriverController> {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Under development'),
    );
    // return Scaffold(
    //   backgroundColor: whiteColor,
    //   body: Container(
    //     width: Get.width,
    //     height: Get.height,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // Header Section
    //         Container(
    //           height: ,
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             color: Colors.red,
    //             // gradient: LinearGradient(
    //             //   begin: Alignment.topCenter,
    //             //   end: Alignment.bottomCenter,
    //             //   colors: [Color(0xFF6B9B37), Color(0xFF8BB347)],
    //             // ),
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(16.r),
    //               bottomRight: Radius.circular(16.r)
    //             ),
    //           ),
    //           child: SafeArea(
    //             child: Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   // Top Bar
    //                   Row(
    //                     children: [
    //                       Container(
    //                         padding: EdgeInsets.all(8.w),
    //                         decoration: BoxDecoration(
    //                           color: whiteColor.withOpacity(0.2),
    //                           borderRadius: BorderRadius.circular(8.r),
    //                         ),
    //                         child: Icon(
    //                           Icons.apps,
    //                           color: whiteColor,
    //                           size: 20.sp,
    //                         ),
    //                       ),
    //                       Spacer(),
    //                       CircleAvatar(
    //                         radius: 20.w,
    //                         backgroundColor: whiteColor,
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(20.w),
    //                           child: Image.asset(
    //                             PNGImages.dummy,
    //                             width: 40.w,
    //                             height: 40.w,
    //                             fit: BoxFit.cover,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(height: 20.h),
    //
    //                   // VEGGIGO Logo
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                         padding: EdgeInsets.all(8.w),
    //                         decoration: BoxDecoration(
    //                           color: whiteColor.withOpacity(0.2),
    //                           borderRadius: BorderRadius.circular(8.r),
    //                         ),
    //                         child: Icon(
    //                           Icons.eco,
    //                           color: whiteColor,
    //                           size: 16.sp,
    //                         ),
    //                       ),
    //                       SizedBox(width: 8.w),
    //                       Text(
    //                         'VEGGIGO',
    //                         style: openSansBold(
    //                           fontSize: 18.sp,
    //                           textColor: whiteColor,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(height: 16.h),
    //
    //                   // Greeting
    //                   Text(
    //                     'Hi, Alex',
    //                     style: openSansBold(
    //                       fontSize: 24.sp,
    //                       textColor: whiteColor,
    //                     ),
    //                   ),
    //                   SizedBox(height: 4.h),
    //                   Text(
    //                     'Are You Ready for Delivery?',
    //                     style: openSansRegular(
    //                       fontSize: 14.sp,
    //                       textColor: whiteColor.withOpacity(0.9),
    //                     ),
    //                   ),
    //                   SizedBox(height: 20.h),
    //
    //                   // Stats Card
    //                   Container(
    //                     padding: EdgeInsets.all(16.w),
    //                     decoration: BoxDecoration(
    //                       color: whiteColor,
    //                       borderRadius: BorderRadius.circular(12.r),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: blackColor.withOpacity(0.1),
    //                           blurRadius: 8,
    //                           offset: Offset(0, 4),
    //                         ),
    //                       ],
    //                     ),
    //                     child: Obx(() => Column(
    //                       children: [
    //                         Text(
    //                           'Activated',
    //                           style: openSansRegular(
    //                             fontSize: 12.sp,
    //                             textColor: color969696,
    //                           ),
    //                         ),
    //                         SizedBox(height: 8.h),
    //                         Text(
    //                           '${controller.activatedOrders.value}',
    //                           style: openSansBold(
    //                             fontSize: 32.sp,
    //                             textColor: Color(0xFF6B9B37),
    //                           ),
    //                         ),
    //                         SizedBox(height: 16.h),
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: [
    //                             Column(
    //                               children: [
    //                                 Text(
    //                                   '${controller.pendingOrders.value}',
    //                                   style: openSansBold(
    //                                     fontSize: 20.sp,
    //                                     textColor: color00394D,
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 4.h),
    //                                 Text(
    //                                   'Pending',
    //                                   style: openSansRegular(
    //                                     fontSize: 12.sp,
    //                                     textColor: color969696,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                             Column(
    //                               children: [
    //                                 Text(
    //                                   '${controller.completedOrders.value}',
    //                                   style: openSansBold(
    //                                     fontSize: 20.sp,
    //                                     textColor: color00394D,
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 4.h),
    //                                 Text(
    //                                   'Completed',
    //                                   style: openSansRegular(
    //                                     fontSize: 12.sp,
    //                                     textColor: color969696,
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     )),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //
    //         // Assign Orders Section
    //         Expanded(
    //           child: Padding(
    //             padding: EdgeInsets.all(16.w),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       'Assign Orders',
    //                       style: openSansBold(
    //                         fontSize: 16.sp,
    //                         textColor: color00394D,
    //                       ),
    //                     ),
    //                     GestureDetector(
    //                       onTap: controller.viewAllOrders,
    //                       child: Text(
    //                         'View All',
    //                         style: openSansMedium(
    //                           fontSize: 12.sp,
    //                           textColor: Color(0xFF6B9B37),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: 16.h),
    //
    //                 // Order Cards
    //                 Expanded(
    //                   child: Obx(() => ListView.separated(
    //                     itemCount: controller.assignedOrders.length,
    //                     separatorBuilder: (context, index) => SizedBox(height: 16.h),
    //                     itemBuilder: (context, index) {
    //                       final order = controller.assignedOrders[index];
    //                       return _buildOrderCard(order);
    //                     },
    //                   )),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
  
  Widget _buildOrderCard(OrderAssignment order) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                order.customerName,
                style: openSansBold(
                  fontSize: 14.sp,
                  textColor: color00394D,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: order.isPaid ? Color(0xFFE8F5E8) : Color(0xFFFFF2E8),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  order.isPaid ? 'Paid' : 'Unpaid',
                  style: openSansMedium(
                    fontSize: 10.sp,
                    textColor: order.isPaid ? Color(0xFF4CAF50) : Color(0xFFFF9800),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            order.address,
            style: openSansRegular(
              fontSize: 12.sp,
              textColor: color969696,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Order ${order.orderId} • ${order.phone}',
                style: openSansRegular(
                  fontSize: 11.sp,
                  textColor: color969696,
                ),
              ),
              Spacer(),
              Text(
                order.amount,
                style: openSansBold(
                  fontSize: 14.sp,
                  textColor: color00394D,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.startDelivery(order),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF6B9B37),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        'Start Delivery',
                        style: openSansMedium(
                          fontSize: 12.sp,
                          textColor: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: controller.viewAllOrders,
                child: Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: colorF5F5F5,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      'View All',
                      style: openSansMedium(
                        fontSize: 12.sp,
                        textColor: color00394D,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () => controller.callCustomer(order.phone),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF6B9B37),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: whiteColor,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
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