import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? textHeight;
  final TextStyle? textStyle;
  final TextDecoration? decoration;

  const TextWidget( {super.key,
    this.text,
    this.color = blackColor,
    this.fontSize,
    this.fontFamily = 'OpenSans_Regular',
    this.letterSpacing,
    this.textAlign,
    this.onTap,
    this.fontWeight = FontWeight.normal,
    this.textOverflow,
    this.maxLines,
    this.textHeight,
    this.textStyle,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Text(
        text!,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: true,
        overflow: textOverflow,
        style: textStyle ??
            TextStyle(
              color: color,
              height: textHeight,
              fontSize: fontSize ?? 14.sp,
              letterSpacing: letterSpacing,
              decoration: decoration,
              fontFamily: fontFamily ?? 'OpenSans_Regular',
              fontWeight: fontWeight ?? FontWeight.w500
            ),
      ),
    );
  }
}
