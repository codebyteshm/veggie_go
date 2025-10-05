import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(
        title: 'Delete Account',
        isShowBackArrow: true,
        showBackButton: true,
        color: whiteColor,
        elevation: 6,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colorDFDFDF),
                boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
              ),
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22.w,
                    backgroundColor: colorPrimary.withOpacity(0.15),
                    child: Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Image.asset(PNGImages.appLogo),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe', style: openSansBold(fontSize: 13.sp, textColor: color00394D)),
                        Text('john.doe@gmail.com', style: openSansMedium(fontSize: 12.sp, textColor: color969696)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: colorDFDFDF),
                  boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
                ),
                padding: EdgeInsets.all(12.w),
                child: Text(
                  'We’re sad to see you go. Deleting your account is permanent and cannot be undone. All your orders, order history, and preferences will be lost forever.',
                  style: openSansMedium(fontSize: 12.sp, textColor: color00394D),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            CommonButton(
              text: 'Delete Account',
              backgroundColor: colorDC4326,
              onTap: () => _showDeleteConfirm(context),
              buttonMargin: EdgeInsets.zero,
            ),
            SizedBox(height: 8.h),
            CommonButton(
              text: 'Cancel',
              backgroundColor: whiteColor,
              textColor: color00394D,
              border: Border.all(color: colorDFDFDF),
              onTap: Get.back,
              buttonMargin: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirm(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 52.w,
                  width: 52.w,
                  decoration: BoxDecoration(color: colorDC4326.withOpacity(0.12), shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Icon(Icons.warning_amber_rounded, color: colorDC4326, size: 28.sp),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Are you sure you want to delete your account?',
                  textAlign: TextAlign.center,
                  style: openSansBold(fontSize: 14.sp, textColor: color00394D),
                ),
                SizedBox(height: 8.h),
                Text(
                  'This action is permanent and cannot be undone. All your orders, order history, and preferences will be lost forever.',
                  textAlign: TextAlign.center,
                  style: openSansMedium(fontSize: 12.sp, textColor: color969696),
                ),
                SizedBox(height: 14.h),
                CommonButton(
                  text: 'Delete Account',
                  backgroundColor: colorDC4326,
                  onTap: () {
                    Navigator.of(context).pop();
                    Get.back();
                    // TODO: call API to delete account
                    Get.snackbar('Account', 'Delete request submitted');
                  },
                  buttonMargin: EdgeInsets.zero,
                ),
                SizedBox(height: 8.h),
                CommonButton(
                  text: 'Cancel',
                  backgroundColor: whiteColor,
                  textColor: color00394D,
                  border: Border.all(color: colorDFDFDF),
                  onTap: () => Navigator.of(context).pop(),
                  buttonMargin: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}