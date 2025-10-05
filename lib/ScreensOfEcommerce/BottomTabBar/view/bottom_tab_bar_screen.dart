import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/view/tabs/home_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/view/tabs/product_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/view/tabs/wallet_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/view/tabs/order_tab.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomTabBarScreen extends GetView<BottomTabBarController> {
  const BottomTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = const [HomeTab(), ProductTab(), WalletTab(), OrderTab()];
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            body: tabs[controller.currentIndex.value],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, -4))],
              ),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  height: 62.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _item(0, PNGImages.icBottomHome, 'Home'),
                      _item(1, PNGImages.icBottomProduct, 'Product'),
                      SizedBox(width: 60.w),
                      _item(2, PNGImages.icBottomWallet, 'Wallet'),
                      _item(3, PNGImages.icBottomOrders, 'Order'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: (Get.width / 2) - 28.w,
            bottom: 34.h,
            child: GestureDetector(
              onTap: (){
                Get.toNamed(RoutesConstants.cartView);
              },
              child: Container(
                height: 56.w,
                width: 56.w,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: colorPrimary.withOpacity(0.35), blurRadius: 12, offset: const Offset(0, 6))],
                ),
                child: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: SvgPicture.asset(SVGImages.myCartFillBb, color: whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(int index, String icon, String label) {
    final isActive = controller.currentIndex.value == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => controller.onTabSelected(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset( icon, height: 22.h, color: isActive ? colorPrimary : color9DB2CE),
          SizedBox(height: 4.h),
          Text(
            label,
            style: openSansSemiBold(fontSize: 10.sp, textColor: isActive ? color00394D : color969696),
          ),
        ],
      ),
    );
  }
}
