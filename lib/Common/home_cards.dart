import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/customized_network_image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCategoryCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const HomeCategoryCard({Key? key, required this.imagePath, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122.h,
      width: 170.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colorPrimary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorPrimary),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
      ),
      child: Column(
        children: [
          // Image.asset(imagePath, height: 70.h),
          CustomizedNetworkImage.getImage(url: imagePath,height: 70.h,fit: BoxFit.contain),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: openSansBold(fontSize: 16.sp, textColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String unit;
  final GestureTapCallback? onTapAdd;

  const HomeProductCard({
    Key? key,
    required this.onTapAdd,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesConstants.productDetailsView);
      },
      child: Container(
        width: 171.w,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: colorPrimary.withOpacity(0.60)),
          boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10,offset: Offset(0, 4))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                child: CustomizedNetworkImage.getImage(url: imagePath, height: 120.h,fit: BoxFit.cover),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          price,
                          style: openSansBold(fontSize: 12.sp, textColor: colorPrimary),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '₹/kg',
                          style: openSansMedium(fontSize: 10.sp, textColor: color969696),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: onTapAdd,
                          child: Container(
                            width: 15.w,
                            height: 15.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: colorPrimary),
                            child: Icon(Icons.add, color: whiteColor, size: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(
                          width: 58.w,
                          child: Text(
                            title,
                            maxLines: 2,
                            style: openSansMedium(fontSize: 12.sp, textColor: color00394D,overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Spacer(),
                        _chip(unit),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.10), blurRadius: 6)],
      ),
      child: Row(
        children: [
          Text(
            text,
            style: openSansBold(fontSize: 10.sp, textColor: color969696),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, size: 14.sp, color: color969696),
        ],
      ),
    );
  }
}
