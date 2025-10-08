import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension StringExtension on String {
  //* -----------------function------------------

  ///Capital first latter
  ///Ex: james bond => James bond
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  ///Remove whitespace
  String removeAllWhitespace() {
    return replaceAll(' ', '');
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  //remove before spacing from the string
  String removeLeadingSpaces() {
    return replaceAll(RegExp(r'^\s+'), '');
  }

  String toTitleCase() {
    // Normalize to lowercase and replace underscores/dashes with spaces
    String cleaned = replaceAllMapped(RegExp(r'[_\-]'), (match) => ' ');

    // Insert space before camelCase/PascalCase transitions
    cleaned = cleaned.replaceAllMapped(RegExp(r'(?<=[a-z])(?=[A-Z])'), (match) => ' ');

    // Capitalize each word
    return cleaned
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Convert hex code to color
  Color hexToColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Combine Country code & Mobile number
  String withCountryCode({required String countryDialCode}) {
    return "$countryDialCode $this";
  }

  ///show snackBar
  showSnackBar(BuildContext context, {
    Color? textColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(this, style: TextStyle(color: textColor)),
          backgroundColor: backgroundColor,
          margin: margin,
          padding: padding,
        ),
      );

  Future<bool?> toast({
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
  }) {
    return Fluttertoast.showToast(
      msg: this,
      toastLength: length == Toast.LENGTH_LONG ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: setToastGravity(gravity),
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }


  ToastGravity setToastGravity(ToastGravity gravity) {
    switch (gravity) {
      case ToastGravity.CENTER:
        return ToastGravity.CENTER;
      case ToastGravity.BOTTOM:
        return ToastGravity.BOTTOM;
      case ToastGravity.TOP:
        return ToastGravity.TOP;
      case ToastGravity.TOP_LEFT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.TOP_RIGHT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.BOTTOM_LEFT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.BOTTOM_RIGHT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.CENTER_LEFT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.CENTER_RIGHT:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.SNACKBAR:
      // TODO: Handle this case.
        throw UnimplementedError();
      case ToastGravity.NONE:
      // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}