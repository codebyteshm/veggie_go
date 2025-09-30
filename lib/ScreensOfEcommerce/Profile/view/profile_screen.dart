import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppBarWidget(
        title: myProfile,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 24.h),
            _buildProfileOption(
              icon: Icons.person_outline,
              title: personalInfo,
              onTap: () {
                // Navigate to personal info screen
              },
            ),
            _buildDivider(),
            _buildProfileOption(
              icon: Icons.shopping_bag_outlined,
              title: myOrders,
              onTap: () {
                Get.toNamed(RoutesConstants.myOrders);
              },
            ),
            _buildDivider(),
            _buildProfileOption(
              icon: Icons.account_balance_wallet_outlined,
              title: wallet,
              onTap: () {
                Get.toNamed(RoutesConstants.walletDashboard);
              },
            ),
            _buildDivider(),
            _buildProfileOption(
              icon: Icons.settings_outlined,
              title: settings,
              onTap: () {
                // Navigate to settings screen
              },
            ),
            _buildDivider(),
            _buildProfileOption(
              icon: Icons.help_outline,
              title: helpCenter,
              onTap: () {
                // Navigate to help center
              },
            ),
            _buildDivider(),
            _buildProfileOption(
              icon: Icons.logout,
              title: logOut,
              textColor: colorF44336,
              onTap: () {
                // Handle logout
              },
            ),
            SizedBox(height: 24.h),
            _buildDeleteAccountButton(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colorPrimary, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/profile_placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'John Doe',
          style: openSansSemiBold(
            textColor: color1C1C1C,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'johndoe@example.com',
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: textColor ?? color1C1C1C,
              size: 24.w,
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: openSansMedium(
                textColor: textColor ?? color1C1C1C,
                fontSize: 16.sp,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: color6A6A6A,
              size: 16.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: colorE0E0E0,
    );
  }

  Widget _buildDeleteAccountButton() {
    return TextButton(
      onPressed: () {
        _showDeleteAccountDialog();
      },
      child: Text(
        'Delete Account',
        style: openSansMedium(
          textColor: colorF44336,
          fontSize: 14.sp,
          // decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          deleteAccountTitle,
          style: openSansSemiBold(
            textColor: color1C1C1C,
            fontSize: 18.sp,
          ),
        ),
        content: Text(
          deleteAccountMessage,
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              cancel,
              style: openSansMedium(
                textColor: color6A6A6A,
                fontSize: 14.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle account deletion
              Get.back();
              _showAccountDeletedDialog();
            },
            child: Text(
              delete,
              style: openSansMedium(
                textColor: colorF44336,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAccountDeletedDialog() {
    Get.dialog(
      AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: color4CAF50,
              size: 60.w,
            ),
            SizedBox(height: 16.h),
            Text(
              accountDeleted,
              style: openSansSemiBold(
                textColor: color1C1C1C,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          accountDeletedMessage,
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                // Navigate to home or login screen
                Get.offAllNamed(RoutesConstants.loginView);
              },
              child: Text(
                'OK',
                style: openSansSemiBold(
                  textColor: colorPrimary,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
