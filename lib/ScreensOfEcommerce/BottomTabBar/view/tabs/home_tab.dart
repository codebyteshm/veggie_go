import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/customized_network_image.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:e_commerce46/Common/home_cards.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/controller/bottom_tab_bar_controller.dart';
import 'package:e_commerce46/routes/routes_strings.dart' show RoutesConstants;
import 'package:e_commerce46/ScreensOfEcommerce/Settings/privacy_policy_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Settings/terms_conditions_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Settings/delete_account_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BottomTabBarController bottomTabBarController = Get.find<BottomTabBarController>();

  @override
  void initState() {
    getUserData();
    super.initState();
    bottomTabBarController.homeApiCall();
  }

  getUserData()async{
    var userData = await getLoginDataFromSP()?..data;
    print(userData?.data?.user?.firstName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whiteColor,
      drawer: _AppDrawer(
        onHome: () {
          final btc = Get.isRegistered<BottomTabBarController>() ? Get.find<BottomTabBarController>() : null;
          btc?.onTabSelected(0);
          Get.back();
        },
        onOrders: () {
          final btc = Get.isRegistered<BottomTabBarController>() ? Get.find<BottomTabBarController>() : null;
          btc?.onTabSelected(3);
          Get.back();
        },
        onProfile: () {
          Get.back();
          Get.toNamed(RoutesConstants.profile);
        },
        onWallet: () {
          final btc = Get.isRegistered<BottomTabBarController>() ? Get.find<BottomTabBarController>() : null;
          btc?.onTabSelected(2);
          Get.back();
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
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 205.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  image: DecorationImage(image: AssetImage(PNGImages.homeBackground), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        GestureDetector(
                          onTap: () => _scaffoldKey.currentState?.openDrawer(),
                          child: SvgPicture.asset(SVGImages.sideManu),
                        ),
                        Spacer(),
                        SvgPicture.asset(SVGImages.filter)
                      ]),
                      heightBox(10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        child: Image.asset(PNGImages.appLogo),
                      ),
                      heightBox(10.h),
                      Text(
                        'Hy, James',
                        style: openSansMedium(fontSize: 14.sp, textColor: whiteColor),
                      ),
                      Row(
                        children: [
                          Text(
                            'Are You Looking ',
                            style: openSansBold(fontSize: 18.sp, textColor: whiteColor),
                          ),
                          Text(
                            'Shopping',
                            style: openSansBold(fontSize: 18.sp, textColor: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: SingleChildScrollView(
                    child: Obx(
                      ()=> Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _banner(),
                          SizedBox(height: 14.h),
                          Text(
                            'Categories',
                            style: openSansBold(fontSize: 14.sp, textColor: color00394D),
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 120.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, i) =>
                                  HomeCategoryCard(imagePath: bottomTabBarController.homeResponseModel.value.data?.categories?[i].imageUrl ?? '', title: bottomTabBarController.homeResponseModel.value.data?.categories?[i].name ?? ''),
                              separatorBuilder: (_, __) => SizedBox(width: 12.w),
                              itemCount: bottomTabBarController.homeResponseModel.value.data?.categories?.length ?? 0,
                            ),
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Best Selling Products',
                                style: openSansBold(fontSize: 14.sp, textColor: color00394D),
                              ),
                              Text(
                                'View all',
                                style: openSansMedium(fontSize: 12.sp, textColor: colorPrimary),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          SizedBox(
                            height: 228.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, i) => HomeProductCard(
                                imagePath: bottomTabBarController.homeResponseModel.value.data?.bestSellingProducts?[i].imageUrl ?? '',
                                title: bottomTabBarController.homeResponseModel.value.data?.bestSellingProducts?[i].name ?? '',
                                price: '₹45',
                                unit: i % 2 == 0 ? '1kg' : '500 gm',
                                onTapAdd: () {},
                              ),
                              separatorBuilder: (_, __) => SizedBox(width: 12.w),
                              itemCount: bottomTabBarController.homeResponseModel.value.data?.bestSellingProducts?.length ?? 0,
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }

  Widget _banner() {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (data, i) => Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CustomizedNetworkImage.getImage(url: bottomTabBarController.homeResponseModel.value.data?.bannerImage?[i] ?? ''),
              ),
            ),
            itemCount: bottomTabBarController.homeResponseModel.value.data?.bannerImage?.length ?? 0,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bottomTabBarController.homeResponseModel.value.data?.bannerImage?.length ?? 0,
            (i) => Container(
              width: 6.w,
              height: 6.w,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(color: i == _currentPage ? colorDC4326 : colorDFDFDF, shape: BoxShape.circle),
            ),
          ),
        ),
      ],
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onOrders;
  final VoidCallback onProfile;
  final VoidCallback onWallet;
  final VoidCallback onPrivacy;
  final VoidCallback onTerms;
  final VoidCallback onDeleteAccount;
  final VoidCallback onLogout;

  const _AppDrawer({
    Key? key,
    required this.onHome,
    required this.onOrders,
    required this.onProfile,
    required this.onWallet,
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
                _drawerItem(icon: PNGImages.icDWHome, label: 'Home', onTap: onHome),
                _divider(),
                _drawerItem(icon: PNGImages.icDWMyorder, label: 'My orders', onTap: onOrders),
                _divider(),
                _drawerItem(icon: PNGImages.icDWProfile, label: 'My Profile', onTap: onProfile),
                _divider(),
                _drawerItem(icon: PNGImages.icDWWallet, label: 'Wallet', onTap: onWallet),
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

  Widget _drawerItem({required String icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: Image.asset(icon,height: 36.h ,width : 36.w,),
      title: Text(label, style: openSansMedium(fontSize: 13.sp, textColor: color00394D)),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
      dense: true,
    );
  }
}
