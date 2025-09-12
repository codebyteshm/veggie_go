
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/temp/temp_model.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/text_widget.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'color.dart';
import 'customized_network_image.dart';
import 'image.dart';


Widget heightBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget widthBox(double width) {
  return SizedBox(
    width: width,
  );
}

Widget titleViewAll({
  required String title,
  GestureTapCallback? onTap,
  double? verticalPadding,
  horizontalPadding,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 12.h,
        horizontal: horizontalPadding ?? 0.w),
    child: Row(
      children: [
        TextWidget(
          text: title,
          color: color1C1C1C,
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
        ),
        const Spacer(),
        TextWidget(
          onTap: onTap,
          text: viewAllStr,
          color: colorA8A8A8,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
      ],
    ),
  );
}

Widget productItemCard({
  required ProductModel productData,
  GestureTapCallback? onTapCard,
  bool? isExpress,
  bool? api,
  bool offer = true,
}) {
  return GestureDetector(
    onTap: onTapCard ??
        () => isExpress == true
            ? Get.toNamed(RoutesConstants.productDetailsView,
                arguments: [true, true, productData,false])
            : Get.toNamed(RoutesConstants.productDetailsView,
                arguments: [true, false, productData,false]),
    child: Container(
      width: 165.w,
      // height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 150.h,
            child: Stack(
              children: [
                api == false
                    ? Image.asset(
                        productData.imageUrl,
                        fit: BoxFit.fill,
                        height: 170.h,
                      )
                    : CustomizedNetworkImage.getImage(
                        url: productData.imageUrl,
                        fit: BoxFit.fill,
                        height: 170.h,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.r),
                          topRight: Radius.circular(14.r),
                        ),
                        loadingWidget: Shimmer.fromColors(
                          highlightColor: Colors.grey[100]!,
                          baseColor: Colors.grey[300]!,
                          period: const Duration(seconds: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400]!,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14.r),
                                topRight: Radius.circular(14.r),
                              ),
                              // shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  bottom: 12.h,
                  right: 6.w,
                  child: productData.nubOfDayShip > 1
                      ? Container(
                          width: 77.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              color: color29AE66,
                              borderRadius: BorderRadius.circular(48.r)),
                          child: Center(
                            child: Text(
                              "Ready to ship",
                              style: openSansSemiBold(
                                  fontSize: 10.sp, textColor: whiteColor),
                            ),
                          ),
                        )
                      : Container(
                          width: 77.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.r),
                              color: colorF4CA35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SVGImages.expressIC),
                              widthBox(5.w),
                              TextWidget(
                                text: expressStr,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              productData.title,
              style: openSansMedium(fontSize: 12.sp, textColor: color00394D),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextWidget(
              text: productData.description,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
              color: color282828,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                TextWidget(
                  text: productData.priceAmt,
                  color: colorDC4326,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
                widthBox(3.w),
                TextWidget(
                  text: productData.amtCode,
                  color: colorDC4326,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
                widthBox(2.w),
                TextWidget(
                  text: "/ ${productData.unitOfMeasure}",
                  color: color969696,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: isExpress == true
                ? Offstage()
                : offer == true
                    ? Row(
                        children: [
                          TextWidget(
                            text:
                                '${productData.highPrice} ${productData.amtCode}',
                            color: color969696,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                          widthBox(8.w),
                          TextWidget(
                            text: '${productData.percentOff}% $offStr',
                            color: color00B517,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ],
                      )
                    : Offstage(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextWidget(
              text: '$minOrderStr ${productData.minOrder}',
              color: color969696,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                api == false
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          productData.urlCountry,
                          fit: BoxFit.cover,
                          width: 25.w,
                          height: 25.h,
                        ),
                      )
                    : CustomizedNetworkImage.getImage(
                        url: productData.urlCountry,
                        fit: BoxFit.fill,
                        width: 25.w,
                        height: 25.h,
                        shape: BoxShape.circle,
                        loadingWidget: Shimmer.fromColors(
                          highlightColor: Colors.grey[100]!,
                          baseColor: Colors.grey[300]!,
                          period: const Duration(seconds: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[400]!,

                              // shape: RoundedRectangleBorder(),
                            ),
                          ),
                        ),
                      ),
                widthBox(5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: sellerCountryStr,
                      color: color969696,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                    heightBox(1.h),
                    TextWidget(
                      text: productData.sellerCountry ?? "",
                      color: color1C1C1C,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
          heightBox(10.h)
        ],
      ),
    ),
  );
}

Widget brandedItemCard(
    {required CategoryModel item, GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 110.w,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 2,
            child:
                // Image.asset(
                //   item.imageUrl,
                //   fit: BoxFit.fill,
                // )
                CustomizedNetworkImage.getImage(
              url: item.imageUrl,
              fit: BoxFit.contain,
              // height: 75.h,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              loadingWidget: Shimmer.fromColors(
                highlightColor: Colors.grey[100]!,
                baseColor: Colors.grey[300]!,
                period: const Duration(seconds: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400]!,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    // shape: RoundedRectangleBorder(),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: SizedBox(
                width: 70.w,
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: item.title,
                  color: color1C1C1C,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget productItemCardWithoutLogin(
    {required ProductModel productData,
    GestureTapCallback? onTapCard,
    bool? isExpress}) {
  return GestureDetector(
    onTap: onTapCard ??
        () => Get.toNamed(RoutesConstants.productDetailsView,
            arguments: [false, false, productData,false]),
    child: Container(
      width: 165.w,
      // height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 150.h,
            child: Stack(
              children: [
                CustomizedNetworkImage.getImage(
                  url: productData.imageUrl,
                  fit: BoxFit.fill,
                  height: 150.h,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                  ),
                  loadingWidget: Shimmer.fromColors(
                    highlightColor: Colors.grey[100]!,
                    baseColor: Colors.grey[300]!,
                    period: const Duration(seconds: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400]!,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.r),
                          topRight: Radius.circular(14.r),
                        ),
                        // shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 6.w,
                  child: productData.nubOfDayShip > 1
                      ? Container(
                          width: 77.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                              color: color29AE66,
                              borderRadius: BorderRadius.circular(48.r)),
                          child: Center(
                            child: Text(
                              "Ready to ship",
                              style: openSansSemiBold(
                                  fontSize: 10.sp, textColor: whiteColor),
                            ),
                          ),
                        )
                      : Container(
                          width: 77.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.r),
                              color: colorF4CA35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(SVGImages.expressIC),
                              widthBox(5.w),
                              TextWidget(
                                text: expressStr,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextWidget(
              text: productData.title,
              color: color00394D,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          // heightBox(6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextWidget(
              maxLines: 3,
              text: productData.description,
              color: color282828,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          // heightBox(2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TextWidget(
              text: '$minOrderStr ${productData.minOrder}',
              color: color969696,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          // heightBox(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                CustomizedNetworkImage.getImage(
                  url: productData.urlCountry,
                  fit: BoxFit.fill,
                  width: 25.w,
                  height: 25.h,
                  shape: BoxShape.circle,
                  loadingWidget: Shimmer.fromColors(
                    highlightColor: Colors.grey[100]!,
                    baseColor: Colors.grey[300]!,
                    period: const Duration(seconds: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400]!,

                        // shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ),
                widthBox(5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: sellerCountryStr,
                      color: color969696,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                    heightBox(1.h),
                    TextWidget(
                      text: productData.sellerCountry,
                      color: color1C1C1C,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
          heightBox(10.h),
        ],
      ),
    ),
  );
}
