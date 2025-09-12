import 'package:flutter/material.dart';

TextStyle openSansBold({Color? textColor, double? fontSize}) => TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: 'OpenSans_Bold',
    );

TextStyle openSansRegular({Color? textColor, double? fontSize}) => TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: 'OpenSans_Regular',
    );

TextStyle openSansMedium(
        {Color? textColor, double? fontSize, double? height}) =>
    TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: 'OpenSans_Medium',
      height: height,
    );

TextStyle openSansSemiBold(
        {Color? textColor, double? fontSize, TextDecoration? decoration}) =>
    TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: 'OpenSans_SemiBold',
      decoration: decoration,
    );

TextStyle openSansExtraBold({Color? textColor, double? fontSize}) => TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: 'OpenSans_ExtraBold',
    );

TextStyle openSansLight({Color? textColor, double? fontSize, double? height}) =>
    TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontFamily: 'OpenSans_Light',
        height: height);
