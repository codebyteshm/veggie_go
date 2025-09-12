
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color.dart';
import 'image.dart';

class CommonDropDownContainer extends StatefulWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final String? prefixIconName;
  String? selectedValue;
  final FocusNode? focusNode;
  final List? dropdownItems;
  final TextStyle? hintStyle;
  final String? hint;
  final List<FocusNode> listOfFocusNode;
  final int index;
  final void Function(Object?)? onChanged;

  CommonDropDownContainer({
    Key? key,
    this.text,
    this.onTap,
    required this.onChanged,
    this.prefixIconName,
    this.selectedValue,
    this.dropdownItems,
    this.focusNode,
    this.hint,
    this.hintStyle,
    required this.listOfFocusNode,
    required this.index,
  }) : super(key: key);

  @override
  State<CommonDropDownContainer> createState() =>
      _CommonDropDownContainerState();
}

class _CommonDropDownContainerState extends State<CommonDropDownContainer> {
  @override
  void setState(fn) {
    if (mounted) {
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
    return DropdownButtonFormField(
      isExpanded: true,
      borderRadius: BorderRadius.circular(16.r),
      icon: Offstage(),
      style: openSansSemiBold(
        textColor: color1C1C1C,
        fontSize: 16.sp,
      ),
      focusNode: widget.focusNode,
      decoration: InputDecoration(
          fillColor: whiteColor,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorDFDFDF, width: 1),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorDC4326, width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18.h),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              openSansMedium(fontSize: 16.sp, textColor: color969696),
          prefixIconConstraints: BoxConstraints(minWidth: 5.w),
          prefixIcon: widget.prefixIconName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: widget.prefixIconName != null
                          ? SvgPicture.asset(
                              widget.prefixIconName!,
                              color:
                                  widget.listOfFocusNode[widget.index].hasFocus
                                      ? colorDC4326
                                      : color969696,
                            )
                          : Offstage(),
                    ),
                    Container(
                      width: 1.w,
                      height: 22.h,
                      color: colorDFDFDF,
                    ),
                    SizedBox(width: 15.w),
                  ],
                )
              : Offstage(),
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 17.h, bottom: 9.h),
            child: SvgPicture.asset(
                widget.listOfFocusNode[widget.index].hasFocus
                    ? SVGImages.selectDropdown
                    : SVGImages.dropDown),
          )),
      // validator: (value) => value == null ? "Select a country" : null,
      value: widget.selectedValue,
      onChanged: widget.onChanged,
      //     (dynamic newValue) {
      //   widget.selectedValue = newValue!;
      // },
      items: widget.dropdownItems?.map((items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items ?? ""),
        );
      }).toList(),
    );
  }
}
