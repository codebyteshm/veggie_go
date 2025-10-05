import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/product_details_controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 0.92);
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        appBar: const CommonAppBarWidget(title: 'Product Detail', isShowBackArrow: true, isShowTitle: true, centerTitle: true, showBackButton: true),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Orange – Fresh & Juicy',
                  style: openSansExtraBold(fontSize: 20.sp, textColor: color00394D),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 250.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: controller.onImageChanged,
                    itemCount: controller.productImages.length,
                    itemBuilder: (_, i) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(controller.productImages[i], fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.productImages.length,
                    (i) => Container(
                      width: 6.w,
                      height: 6.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(color: i == controller.currentImageIndex.value ? colorPrimary : colorDFDFDF, shape: BoxShape.circle),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Select Quantity',
                  style: openSansBold(fontSize: 12.sp, textColor: color00394D),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.variants.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isSelected = controller.selectedVariantIndex.value == index;
                      return GestureDetector(
                        onTap: () => controller.selectVariant(index),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: isSelected ? colorPrimary.withOpacity(0.12) : whiteColor,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: isSelected ? colorPrimary : colorDFDFDF),
                          ),
                          child: Text(
                            controller.variants[index],
                            style: openSansSemiBold(fontSize: 12.sp, textColor: isSelected ? color00394D : color969696),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return widthBox(10.w); },

                      ),
                ),
                SizedBox(height: 14.h),
                Row(
                  children: [
                    Text(
                      '₹120',
                      style: openSansBold(fontSize: 18.sp, textColor: color00394D),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '₹150',
                      style: openSansMedium(fontSize: 14.sp, textColor: color969696).copyWith(decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(6.r)),
                      child: Text(
                        '20% OFF',
                        style: openSansBold(fontSize: 10.sp, textColor: whiteColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: colorF0FDF4,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: colorDFDFDF),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: colorPrimary),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.local_offer, color: whiteColor, size: 13.sp),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Har Din Sasta!',
                              style: openSansBold(fontSize: 12.sp, textColor: color00394D),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '20% OFF on up to 3 qty.',
                              style: openSansMedium(fontSize: 11.sp, textColor: color969696),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'About the Product',
                  style: openSansBold(fontSize: 12.sp, textColor: color00394D),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Fresh, juicy oranges packed with vitamin C and natural sweetness. Perfect for fresh juice, snacking, or cooking. Sourced directly from premium orchards to ensure maximum freshness and quality.',
                  style: openSansMedium(fontSize: 12.sp, textColor: color6A6A6A),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            child: controller.quantity.value == 0
                ? Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.toNamed(RoutesConstants.cartView);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Image.asset(PNGImages.icBasket, height: 22.h, color: color00394D),
                        ),
                      ),
                      Expanded(
                        child: CommonButton(
                          height: 48.h,
                          text: 'Add',
                          backgroundColor: colorPrimary,
                          textColor: whiteColor,
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: controller.addToCart,
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 48.h,
                    decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SvgPicture.asset(SVGImages.myCartBb, height: 22.h, color: color00394D),
                        ),
                        _squareBtn(iconPath: Icons.remove, onTap: controller.decrement),
                        Expanded(
                          child: Container(
                            height: 36.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              '${controller.quantity.value}',
                              style: openSansBold(fontSize: 14.sp, textColor: whiteColor),
                            ),
                          ),
                        ),
                        _squareBtn(iconPath: Icons.add, onTap: controller.increment),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _squareBtn({required IconData iconPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colorPrimary),
        ),
        child: Center(child: Icon(iconPath, color: colorPrimary)),
      ),
    );
  }
}
