import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'color.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CommonAppBarWidget({Key? key,
    this.title,
    this.onTap,
    this.actions,
    this.backColor,
    this.isShowBackArrow = true,
    this.isShowCloseIcon = false,
    this.icon,
    this.titleWidget,
    this.centerTitle,
    this.backWidget,
    this.color,
    this.textStyle,
    this.isShowTitle = true,
    this.statusBarBrightness,
    this.paddingBack,
    this.paddingText,
    this.toolbarHeight,
    this.elevation,
    this.statusBarIconBrightness, required bool showBackButton, TabBar? bottom})
      : super(key: key);

  final String? title;
  final GestureTapCallback? onTap;
  final bool isShowBackArrow;
  final bool isShowTitle;
  final bool isShowCloseIcon;
  final List<Widget>? actions;
  final Widget? icon;
  final Widget? titleWidget;
  final Widget? backWidget;
  final Color? color;
  final Color? backColor;
  final TextStyle? textStyle;
  final bool? centerTitle;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;
  final double? toolbarHeight;
  final EdgeInsetsGeometry? paddingText;
  final EdgeInsetsGeometry? paddingBack;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        systemNavigationBarColor: whiteColor,
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: color ?? whiteColor,
      elevation: elevation ?? 0.0,
      titleSpacing: 0,
      toolbarHeight: toolbarHeight ?? 35.h,
      leading: isShowBackArrow
          ? isShowCloseIcon
          ? icon
          : backWidget ??
          GestureDetector(
            onTap: onTap ??
                    () {
                  Get.back();
                },
            child: Padding(
              padding: paddingBack ??
                  EdgeInsets.only(
                      left: 8.w, right: 8.w, top: 5.h, bottom: 5.h),
              child: const BackButton(color: Colors.black),
            ),
          )
          : const SizedBox.shrink(),
      centerTitle: centerTitle ?? true,
      title: isShowTitle
          ? centerTitle == false
          ? Padding(
        padding: EdgeInsets.only(left: 22.w),
        child: TextWidget(
          text: title ?? '',
          color: color1C1C1C,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      )
          : Padding(
        padding:
        paddingText ?? EdgeInsets.only(top: 10.h, bottom: 5.h),
        child: Text(
          title ?? '',
          style: textStyle ??
              openSansSemiBold(
                  fontSize: 18.sp, textColor: color1C1C1C),
        ),
      )
          : titleWidget,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
