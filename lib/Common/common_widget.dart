
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';


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
