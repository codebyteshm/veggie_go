
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'color.dart';

class CommonTextFormField extends StatefulWidget {
  final String? hint,
      label,
      initialValue,
      fontFamilyText,
      fontFamilyHint,
      counterText,
      prefixIconName;
  final Widget? prefixIcon;
  final Widget? mobile;
  final Color? color;
  final Color? borderColor;
  final Color? hintColor;
  final Color? prefixIconColor;
  final Color? textColor;
  final Color? focusColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;
  final bool? isDense;
  final GestureTapCallback? onTap;
  final TextAlignVertical? textAlignVertical;
  final GestureTapCallback? onTapSuffixIcon;
  final double? height;
  final double? width;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isShadowEnable;
  final bool isBorderEnable;
  final FontWeight? fontWeightText;
  final FontWeight? fontWeightHint;
  final String? suffixIconName;
  final Widget? suffixIconWidget;
  final double? suffixIconHeight;
  final double? suffixIconWidth;
  final bool passwordVisible;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final bool autoFocus;
  final bool expands;
  final bool? enabled;
  final TextStyle? hintStyle;
  final double? fontSize,
      hintSize,
      borderRadius,
      contentPaddingHorizontal,
      contentPaddingVertical;
  final BoxConstraints? prefixIconConstraints;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;
  final List<FocusNode> listOfFocusNode;
  final int index;

  CommonTextFormField(
      {Key? key,
      this.hint,
      this.textAlignVertical,
      this.label,
      this.hintSize,
      required this.listOfFocusNode,
      required this.index,
      this.expands = false,
      this.autoFocus = false,
      this.prefixIconConstraints,
      this.prefixIconName,
      this.prefixIcon,
      this.color,
      this.prefixIconColor,
      this.controller,
      this.focusNode,
      this.initialValue,
      this.readOnly,
      this.mobile,
      this.textAlign,
      this.hintStyle,
      this.suffixIcon,
      this.textInputType,
      this.maxLines = 1,
      this.isDense,
      this.onTap,
      this.contentPadding,
      this.height,
      this.onFieldSubmitted,
      this.validator,
      this.maxLength,
      required this.textInputAction,
      this.inputFormatters,
      this.width,
      this.hintColor,
      this.isBorderEnable = true,
      this.isShadowEnable = true,
      this.fontFamilyText,
      this.fontFamilyHint,
      this.fontWeightHint,
      this.fontWeightText,
      this.suffixIconName,
      this.suffixIconHeight,
      this.suffixIconWidth,
      this.onTapSuffixIcon,
      this.passwordVisible = false,
      this.suffixIconWidget,
      this.onChanged,
      this.onEditingComplete,
      this.counterText,
      this.borderRadius,
      this.fontSize,
      this.contentPaddingHorizontal,
      this.contentPaddingVertical,
      this.enabled,
      this.textColor,
      this.borderColor,
      this.minLines,
      this.radius,
      this.focusColor})
      : super(key: key);

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  ScrollController listScrollController = ScrollController();
  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }
  @override
  void initState() {
    widget.listOfFocusNode.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: true,
      child: TextFormField(
        textAlignVertical: widget.textAlignVertical,
        style: openSansSemiBold(
          textColor: widget.textColor ?? color1C1C1C,
          fontSize: widget.fontSize ?? 16.sp,
        ),
        autofocus: widget.autoFocus,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        onTap: widget.onTap,
        obscureText: widget.passwordVisible,
        maxLength: widget.maxLength,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly ?? false,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        textAlign: widget.textAlign ?? TextAlign.left,
        keyboardType: widget.textInputType,
        expands: widget.expands,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          enabled: widget.enabled ?? true,
          counterText: widget.counterText ?? "",
          isDense: widget.isDense ?? widget.isDense,
          prefixIcon: widget.prefixIconName?.isNotEmpty ?? false
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: SvgPicture.asset(
                        widget.prefixIconName!,
                        color: widget.listOfFocusNode[widget.index].hasFocus
                            ? colorDC4326
                            : color969696,
                        // color: widget.prefixIconColor,
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 22.h,
                      color: colorDFDFDF,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    widget.mobile ?? Offstage()
                  ],
                )
              : widget.prefixIcon,
          suffixIcon: widget.suffixIconWidget ??
              (widget.suffixIconName != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: widget.onTapSuffixIcon,
                      child: Padding(
                        padding: EdgeInsets.only(top: 17.h, bottom: 9.h),
                        child: SvgPicture.asset(widget.suffixIconName!),
                      ))
                  : null),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              openSansMedium(fontSize: 16.sp, textColor: color969696),
          errorMaxLines: 2,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(
                  horizontal: widget.contentPaddingHorizontal ?? 0.w,
                  vertical: widget.contentPaddingVertical ?? 18.h),
          filled: true,
          prefixIconConstraints: widget.prefixIconConstraints,
          fillColor: widget.color ?? whiteColor,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorDFDFDF, width: 1),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorDC4326, width: 1),
          ),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? color9F9F9F)),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? color9F9F9F)),
          // disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? color9F9F9F)),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? color9F9F9F)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? colorDC4326 )),
          // // focusedBorder: OutlineInputBorder(
          // //     borderRadius: BorderRadius.circular(20.r),
          // //     borderSide: BorderSide(color: focusColor ?? colorEBEBEB)),
          // focusedErrorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(radius ?? 20.r),
          //     borderSide: BorderSide(color: borderColor ?? color9F9F9F)),
        ),
      ),
    );
  }

  void scrollDown() {
    listScrollController.animateTo(
      listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
