import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/controller/partner_bottom_tab_bar_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/view/partner_home_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/view/partner_ongoing_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/view/partner_order_tab.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/view/partner_pending_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartnerBottomTabBarScreen extends GetView<PartnerBottomTabBarController> {
  const PartnerBottomTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [PartnerHomeTab(), PartnerOrderTab(), PartnerOngoingTab(), PartnerPendingTab()];
    return Obx(
      () => Scaffold(
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
                children: [_item(0, SVGImages.bHome, 'Home'), _item(1, SVGImages.bOrders, 'Orders'), _item(2, SVGImages.bOngoing, 'Ongoing'), _item(3, SVGImages.bPending, 'Pending')],
              ),
            ),
          ),
        ),
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
          SvgPicture.asset(icon, height: 22.h, color: isActive ? colorPrimary : color9DB2CE),
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
