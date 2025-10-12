import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/controller/partner_bottom_tab_bar_controller.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Settings/delete_account_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Settings/privacy_policy_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Settings/terms_conditions_screen.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PartnerHomeTab extends StatefulWidget {
  const PartnerHomeTab({super.key});

  @override
  State<PartnerHomeTab> createState() => _PartnerHomeTabState();
}

class _PartnerHomeTabState extends State<PartnerHomeTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whiteColor,
      drawer: _AppDrawer(
          onHome: () {
            final btc = Get.isRegistered<PartnerBottomTabBarController>() ? Get.find<PartnerBottomTabBarController>() : null;
            btc?.onTabSelected(0);
            Get.back();
          },
          onOrders: () {
            Get.back();
            Get.toNamed(RoutesConstants.partnerMyOrdersView);
          },
          onPrivacy: () {
            Get.back();
            Get.to(() => const PrivacyPolicyScreen());
          },
          onTerms: () {
            Get.back();
            Get.to(() => const TermsConditionsScreen());
          },
          onDeleteAccount: () {
            Get.back();
            Get.to(() => const DeleteAccountScreen());
          },
          onLogout: () {
            Get.back();
            Get.offAllNamed(RoutesConstants.loginView);
          }
        // showModalBottomSheet<void>(
        //     isScrollControlled: true,
        //     backgroundColor: whiteColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(16.r),
        //         topLeft: Radius.circular(16.r),
        //       ),
        //     ),
        //     context: context,
        //     builder: (BuildContext context) {
        //       return Padding(
        //         padding: MediaQuery.of(context).viewInsets,
        //         child: SizedBox(
        //             height: 255.h,
        //             child: Column(
        //               children: [
        //                 SizedBox(height: 20.h),
        //                 Container(
        //                   width: Get.width,
        //                   color: Colors.transparent,
        //                   child: Stack(
        //                     children: [
        //                       Column(
        //                         children: [
        //                           Center(
        //                             child: Text(
        //                               'logout',
        //                               style: openSansBold(
        //                                   fontSize: 18.sp, textColor: blackColor),
        //                             ),
        //                           ),
        //                           heightBox(24.h),
        //                           Text(
        //                             'logoutSub',
        //                             textAlign: TextAlign.center,
        //                             style: openSansBold(
        //                                 fontSize: 18.sp, textColor: color00394D),
        //                           ),
        //                           heightBox(40.h),
        //                           CommonButton(
        //                             onTap: () {},
        //                             text: 'logout',
        //                           )
        //                         ],
        //                       ),
        //                       Positioned(
        //                         right: 15.w,
        //                         top: 5.h,
        //                         child: InkWell(
        //                           onTap: () {
        //                             Get.back();
        //                           },
        //                           child: SvgPicture.asset(SVGImages.email),
        //                         ),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ],
        //             )),
        //       );
        //     },
        //   );}
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Assign Orders',
                      style: openSansBold(fontSize: 16.sp, textColor: color00394D),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: openSansSemiBold(fontSize: 12.sp, textColor: colorPrimary),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: _orderCard(
                      name: 'Sarah Johnson',
                      addressLine1: '123 Oak Street, Apt 4B Downtown, City Center',
                      orderId: '#DL2024001',
                      phone: '+1 234-567-8900',
                      amount: 250,
                      paymentStatus: i == 0 ? "Paid" : 'Unpaid',
                      isPaid: i == 0 ? true : false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    // Header with stack: background + overlay stats card.
    return Container(
      height: 360.h,
      child: Stack(
        children: [
          Container(
            height: 210.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorPrimary,
              image: DecorationImage(image: AssetImage(PNGImages.homeBackground), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _scaffoldKey.currentState?.openDrawer(),
                        child: SvgPicture.asset(SVGImages.sideManu),
                      ),                      const Spacer(),
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(borderRadius: BorderRadius.circular(80.r), child: Image.asset(PNGImages.dummyProfile)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90.w),
                    child: Image.asset(PNGImages.appLogo),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Hi, Alex',
                    style: openSansBold(fontSize: 18.sp, textColor: whiteColor),
                  ),
                  Text(
                    'Are You Ready for Delivery?',
                    style: openSansRegular(fontSize: 12.sp, textColor: whiteColor),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 20.w, right: 20.w, bottom: 0, child: _statsCard()),
        ],
      ),
    );
  }

  Widget _statsCard() {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Text(
            'Activated',
            style: openSansRegular(fontSize: 12.sp, textColor: color969696),
          ),
          SizedBox(height: 6.h),
          Text(
            '3',
            style: openSansBold(fontSize: 32.sp, textColor: colorPrimary),
          ),
          SizedBox(height: 12.h),
          Container(height: 1.h, color: colorE1E1E1),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '1',
                    style: openSansBold(fontSize: 18.sp, textColor: color00394D),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Pending',
                    style: openSansRegular(fontSize: 12.sp, textColor: color969696),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '12',
                    style: openSansBold(fontSize: 18.sp, textColor: color00394D),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Completed',
                    style: openSansRegular(fontSize: 12.sp, textColor: color969696),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderCard({required String name, required String addressLine1, required String orderId, required String phone, required int amount, required String paymentStatus, required bool isPaid}) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: openSansSemiBold(fontSize: 14.sp, textColor: color1F2937),
                ),
              ),
              _statusBadge(paymentStatus, isPaid),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            color: Colors.transparent,
            width: 240.w,
            child: Text(
              addressLine1,
              style: openSansRegular(fontSize: 14.sp, textColor: color4B5563),
            ),
          ),

          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order $orderId  •  $phone',
                  style: openSansRegular(fontSize: 12.sp, textColor: color6B7280),
                ),
              ),
              Text(
                '₹$amount',
                style: openSansBold(fontSize: 18.sp, textColor: colorPrimary),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  height: 44.h,
                  text: 'Start Delivery',
                  backgroundColor: colorPrimary,
                  textColor: whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () {},
                  fontSize: 14.sp,
                  buttonMargin: EdgeInsets.zero,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(color: colorD1D5DB),
                  ),
                  child: Center(
                    child: Text(
                      "View all",
                      style: openSansSemiBold(fontSize: 14.sp, textColor: color374151),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              _callButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String label, bool isPaid) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(color: isPaid ? colorDCFCE7 : colorFEE2E2, borderRadius: BorderRadius.circular(20.r)),
      child: Text(
        label,
        style: openSansSemiBold(fontSize: 11.sp, textColor: isPaid ? colorPrimary : colorAD0101),
      ),
    );
  }

  Widget _callButton() {
    return Container(
      width: 44.h,
      height: 44.h,
      decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: SvgPicture.asset(SVGImages.phone, height: 15.h, color: whiteColor),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onOrders;
  final VoidCallback onPrivacy;
  final VoidCallback onTerms;
  final VoidCallback onDeleteAccount;
  final VoidCallback onLogout;

  const _AppDrawer({
    Key? key,
    required this.onHome,
    required this.onOrders,
    required this.onPrivacy,
    required this.onTerms,
    required this.onDeleteAccount,
    required this.onLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Column(
        children: [
          // Header
          Stack(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  image: DecorationImage(image: AssetImage(PNGImages.homeBackground), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r)),
                ),
              ),
              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 12.h,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [BoxShadow(color: blackColor.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 6))],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.w,
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
                            Text('KALPAN KANERIYA', style: openSansBold(fontSize: 12.sp, textColor: color00394D)),
                            Text('tedbostay@gmail.com', style: openSansMedium(fontSize: 11.sp, textColor: color969696)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              children: [
                _drawerItem(icon: SVGImages.homeBb, label: 'Home', onTap: onHome,isSvg: true),
                _divider(),
                _drawerItem(icon: PNGImages.icDWMyorder, label: 'My orders', onTap: onOrders),
                _divider(),
                _drawerItem(icon: PNGImages.icDWPrivacy, label: 'Privacy Policy', onTap: onPrivacy),
                _divider(),
                _drawerItem(icon: PNGImages.icDWTerms, label: 'Terms & Conditions', onTap: onTerms),
                _divider(),
                _drawerItem(icon: PNGImages.icDWDelete, label: 'Delete Account', onTap: onDeleteAccount),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.w, 0, 0.w, 0.h),
            child: _drawerItem(icon: PNGImages.icDWLogout, label: 'Logout', onTap: onLogout),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        heightBox(5.h),
        const Divider(height: 1, thickness: 1,color: colorE1E1E1,),
        heightBox(5.h),
      ],
    ),
  );

  Widget _drawerItem({required String icon, required String label, required VoidCallback onTap, bool isSvg=false}) {
    return ListTile(
      leading: isSvg?SvgPicture.asset(icon):Image.asset(icon,height: 36.h ,width : 36.w,),
      title: Text(label, style: openSansMedium(fontSize: 13.sp, textColor: color00394D)),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      dense: true,
    );
  }


}

