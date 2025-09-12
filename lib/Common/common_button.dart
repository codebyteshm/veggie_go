
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class CommonButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final String? stringAssetName;
  final GestureTapCallback? onTap;
  final bool showLoading;
  final bool isIcon;
  final bool isTrailingIcon;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? assetHeight;
  final double? assetWidth;
  final double? fontSize;
  final double borderWidth;
  final Widget? iconWidget;
  final Widget? textWidget;
  final EdgeInsetsGeometry? buttonMargin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const CommonButton(
      {Key? key,
      this.width,
      this.text,
      this.onTap,
      this.textWidget,
      this.showLoading = false,
      this.textColor,
      this.verticalPadding,
      this.stringAssetName,
      this.isIcon = false,
      this.assetWidth,
      this.assetHeight,
      this.fontSize,
      this.horizontalPadding,
      this.borderColor,
      this.backgroundColor,
      this.borderWidth = 1.0,
      this.iconWidget,
      this.buttonMargin,
      this.borderRadius,
      this.border,
      this.height,
      this.isTrailingIcon = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          margin: buttonMargin ?? EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: backgroundColor ?? colorDC4326,
              borderRadius: borderRadius ?? BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.16),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
              border: border),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? 16.h,
                horizontal: horizontalPadding ?? 0.0),
            child: Center(
              child: showLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: whiteColor,
                        strokeWidth: 3,
                      ),
                    )
                  : textWidget??Text(
                      text ?? "",
                      style: openSansBold(
                          fontSize: fontSize ?? 16.sp,
                          textColor: textColor ?? whiteColor),
                    ),
            ),
          )),
    );
  }
}
