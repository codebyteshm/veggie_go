import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/home_cards.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/product_tab_controller.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({Key? key}) : super(key: key);

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final TextEditingController _searchController = TextEditingController();
  final ProductTabController _controller = Get.put(ProductTabController());
  // BottomTabBarController controller = Get.find<BottomTabBarController>();

  @override
  void initState() {
    // _controller.c
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: whiteColor,
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Vegetables & Fruits',
          style: openSansBold(fontSize: 16.sp, textColor: color00394D),
        ),
      ),
      body: GetBuilder<ProductTabController>(
        init: _controller,
        builder: (controller) {
          return Container(
            width: Get.width,
            height: Get.height,
            color: whiteColor.withOpacity(0.5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 12.h),
                  child: Row(
                    children: [
                      // Categories selector
                      Expanded(
                        flex: 11,
                        child: GestureDetector(
                          onTap: controller.openCategorySheet,
                          child: Container(
                            height: 40.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
                              border: Border.all(color: colorDFDFDF),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Categories',
                                  style: openSansSemiBold(fontSize: 12.sp, textColor: color00394D),
                                ),
                                Spacer(),
                                Icon(Icons.keyboard_arrow_down_rounded, size: 18.sp, color: color969696),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Search by name
                      Expanded(
                        flex: 11,
                        child: Container(
                          height: 40.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
                            border: Border.all(color: colorDFDFDF),
                          ),
                          child: Row(
                            children: [
                              // Icon(Icons.search, color: color969696, size: 18.sp),
                              // SizedBox(width: 6.w),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (v) {
                                    controller.searchQuery.value = v;
                                    controller.update();
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Search by Name',
                                    hintStyle: openSansMedium(fontSize: 12.sp, textColor: color969696),
                                    border: InputBorder.none,
                                  ),
                                  style: openSansMedium(fontSize: 12.sp, textColor: color00394D),
                                ),
                              ),
                              if (_searchController.text.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    controller.searchQuery.value = '';
                                    controller.update();
                                  },
                                  child: Icon(Icons.close, color: color969696, size: 16.sp),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 14.h, top: 8.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: controller.filteredProducts.length,
                    itemBuilder: (_, i) {
                      final p = controller.filteredProducts[i];
                      return HomeProductCard(
                        imagePath: p.imagePath,
                        title: p.title,
                        price: p.price,
                        unit: p.unit,
                        onTapAdd: () => controller.openProductSheet(p),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
