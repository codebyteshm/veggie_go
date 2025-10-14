import 'dart:io';

import 'package:e_commerce46/Common/app_network_image.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/image_selection_dialog.dart';
import 'package:e_commerce46/Common/strings.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/update_user_request_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController(text: 'kalpan');
  final TextEditingController _lastNameController = TextEditingController(text: 'kaneriya');
  final TextEditingController _emailController = TextEditingController(text: 'Kalpankaneriya123@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+91 1234567890');
  BottomTabBarController bottomTabBarController = Get.find<BottomTabBarController>();
  String _imagePath = '';

  User userDetail = User();

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData()async{
     LoginResponse loginResponse = await getLoginDataFromSP() ?? LoginResponse();
     userDetail = loginResponse.data?.user ?? User();
     currentUser = userDetail;

     _firstNameController.text = userDetail.firstName ?? '';
     _lastNameController.text = userDetail.lastName ?? '';
     _emailController.text = userDetail.email ?? '';
     _phoneController.text = userDetail.phone ?? '';
     setState(() {});
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CommonAppBarWidget(
        title: 'Profile',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20.h),
            _buildPersonalDetailsSection(),
            SizedBox(height: 40.h),
            _buildSaveButton(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Future<void> onImageSelection(BuildContext context) async {
    dynamic getImage = await ImageSelectDialog.onImageSelection(mainContext: context);

    if (getImage != null && getImage is String) {
      _imagePath = getImage;
    }
    setState(() {});
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorE0E0E0, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.w),
                child:  _imagePath.isEmpty
                    ? AppNetworkImage(
                    url: '${RestConstants.imageDomain}${userDetail.profileImage}' ?? '',
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.cover, shape: BoxShape.circle) : Container(
                  width: 80.w,
                  height: 80.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      Colors.transparent,
                      image: DecorationImage(
                          image: Image.file(File(_imagePath)).image,
                          fit: BoxFit.cover)),
                )
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  onImageSelection(context);
                },
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                    border: Border.all(color: whiteColor, width: 2),
                  ),
                  child: Image.asset(PNGImages.icEditImage)
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
           '${userDetail.firstName} ${userDetail.lastName}',
          style: openSansSemiBold(
            textColor: color1C1C1C,
            fontSize: 20.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          '${userDetail.email}',
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalDetailsSection() {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorE5E7EB,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Details',
            style: openSansSemiBold(
              textColor: color1C1C1C,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 20.h),
          _buildInputField(
            label: 'First Name',
            controller: _firstNameController,
          ),
          SizedBox(height: 10.h),
          _buildInputField(
            label: 'Last Name',
            controller: _lastNameController,
          ),
          SizedBox(height: 10.h),
          _buildInputField(
            label: 'Email',
            controller: _emailController,
          ),
          SizedBox(height: 10.h),
          _buildInputField(
            label: 'Phone Number',
            readOnly: true,
            controller: _phoneController,
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    bool readOnly = false,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          decoration: BoxDecoration(
            color: colorF5F5F5,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            style: openSansRegular(
              textColor: color1C1C1C,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              suffixIcon: Icon(
                Icons.edit,
                color: Color(0xFF6B9B37),
                size: 20.w,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
            bottomTabBarController.updateProfile(updateUserRequestModel: UpdateUserRequestModel(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              phone: _phoneController.text,
              profileImage: _imagePath,
              id : userDetail.id
            ));

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        child: Text(
          'Save Changes',
          style: openSansSemiBold(
            textColor: whiteColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  void _showSaveSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Color(0xFF4CAF50),
              size: 60.w,
            ),
            SizedBox(height: 16.h),
            Text(
              'Success',
              style: openSansSemiBold(
                textColor: color1C1C1C,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          'Your profile has been updated successfully.',
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'OK',
                style: openSansSemiBold(
                  textColor: Color(0xFF6B9B37),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Logout',
          style: openSansSemiBold(
            textColor: color1C1C1C,
            fontSize: 18.sp,
          ),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: openSansRegular(
            textColor: color6A6A6A,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: openSansMedium(
                textColor: color6A6A6A,
                fontSize: 14.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              // Navigate to login screen
              Get.offAllNamed(RoutesConstants.loginView);
            },
            child: Text(
              'Logout',
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
}
