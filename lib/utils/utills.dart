import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../Common/custom_dialog.dart';

class Utils {
  static const String iosDeviceTypeId = "ios";
  static const String androidDeviceTypeId = "android";
  static const animationDuration = Duration(milliseconds: 200);

  static showSnackBar(String? message) {
    GetSnackBar(
      message: message,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    ).show();
  }


  static showErrorSnackBar(String? message) {
    GetSnackBar(message: message??"No internet connection found!", duration: Duration(seconds: 5), backgroundColor: Color(0xFFD9534F)).show();
  }

  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  // static Future<String?> getFirebaseToken() async {
  //   return await FirebaseMessaging.instance.getToken();
  // }

  static String getDeviceTypeID() {
    return Platform.isAndroid ? androidDeviceTypeId : iosDeviceTypeId;
  }

  static showCommonDialog(
      {required String message,
        String? title,
        Function? onTap,
        String? positiveText,
        String? negativeText,
        Function? onNegativeTap,
        bool? isDialog,
        TextAlign textAlign = TextAlign.left,
        VoidCallback? onClose,
        bool shouldClose = true}) {
    title ??= "sorry";
    positiveText ??= "okay";
    return Get.dialog(
        CustomDialog(
          textAlign: textAlign,
          onTap: onTap,
          message: message,
          negativeText: negativeText,
          onNegativeTap: onNegativeTap,
          positiveText: positiveText,
          title: title,
          shouldClose: shouldClose,
        ),
        name: 'common-dialog',
        useSafeArea: true,
        barrierDismissible: shouldClose);
  }

  // static showSnackBarOfVideo(String? message) {
  //   GetSnackBar(
  //     message: message,
  //     duration: Duration(seconds: 2),
  //     backgroundColor: color003374,
  //   ).show();
  // }
}
