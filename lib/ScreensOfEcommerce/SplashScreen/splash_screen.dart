import 'dart:async';

import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/main.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  // Rx<ProductDetailsPayload> payload = ProductDetailsPayload().obs;

  @override
  void initState() {
      Timer(const Duration(seconds: 3), () {
        if(SharedPreferenceUtil.getBool(isLoginKey)){
          // Get.offAllNamed(RoutesConstants.partnerBottomTabBarScreen);
          Get.offAllNamed(RoutesConstants.mainScreen);
        }else {
          Get.offAllNamed(RoutesConstants.loginView);
        }
      });
    // initPackageInfo();
    // SharedPreferenceUtil.putBool(nCommonClick, false);'

    // if (isShowDialog.value) {
    //   Timer(const Duration(seconds: 5), () {
    //     if (SharedPreferenceUtil.getBool(isLoginKey)) {
    //       if (SharedPreferenceUtil.getBool(nAddress)) {
    //         // Get.lazyPut<BottomTabBarController>(
    //         //         () => BottomTabBarController());
    //         Get.toNamed(RoutesConstants.addressView,
    //             arguments: ["Ecommerce", false, true, true]);
    //       } else if (SharedPreferenceUtil.getBool(nEnquiry)) {
    //         Get.toNamed(RoutesConstants.myRequestView,
    //             arguments: [true, 0, 1, true, false]);
    //       } else if (SharedPreferenceUtil.getBool(nRfq)) {
    //         Get.toNamed(
    //           RoutesConstants.submitQuoteView,
    //           arguments: [
    //             SharedPreferenceUtil.getString(nRfqObjectId).toString(),
    //             0
    //           ],
    //         );
    //       } else if (SharedPreferenceUtil.getBool(nOrder)) {
    //         Get.toNamed(
    //           RoutesConstants.orderDetailsView,
    //           arguments: [
    //             SharedPreferenceUtil.getString(nOrderObjectId).toString(),
    //             0
    //           ],
    //         );
    //       } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
    //         userDetails();
    //         // Get.delete<ProductDetailsController>();
    //         // Get.lazyPut<ProductDetailsController>(
    //         //     () => ProductDetailsController());
    //         // Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [
    //         //   SharedPreferenceUtil.getInt(userIdKey).toString() == "0"
    //         //       ? false
    //         //       : true,
    //         //   false,
    //         //   payload.value
    //         // ]);
    //       }
    //       // else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
    //       //   // productDetailsResponse = ProductDetailsResponse.fromJson(SharedPreferenceUtil.getDynamic(dynamicLinkClickResponse));
    //       //   // productDetailsResponse = ProductDetailsResponse.fromJson(jsonDecode(
    //       //   //     SharedPreferenceUtil.getString(dynamicLinkClickResponse)));
    //       //   Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [true, false, SharedPreferenceUtil.getObject(dynamicLinkClickResponse)]);
    //       // }
    //       else {
    //         SharedPreferenceUtil.putBool(nCommonClick, true);
    //         Get.offAllNamed(RoutesConstants.getStartView);
    //       }
    //     } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
    //       userDetails();
    //     } else {
    //       SharedPreferenceUtil.putBool(nCommonClick, true);
    //       Get.offAllNamed(RoutesConstants.loginView);
    //     }
    //   });
    // }

    super.initState();
  }

  //
  // // @override
  // // void didChangeAppLifecycleState(AppLifecycleState state) {
  // //   // TODO: implement didChangeAppLifecycleState
  // //   super.didChangeAppLifecycleState(state);
  // // }
  //
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);
  //   appState = state;
  //   if (appState == AppLifecycleState.inactive) {
  //     // appOpen.value = true;
  //     print('app inactive in lock screen!');
  //   } else if (appState == AppLifecycleState.resumed) {
  //     print('app resumed');
  //   } else if (appState == AppLifecycleState.paused) {
  //     appOpen.value = true;
  //     print('app paused---------------');
  //   }
  // }

  // userDetails() async {
  //   payload.value = (await getProductDetailsDataFromSP())?.payload ??
  //       ProductDetailsPayload();
  //   print("Payload is:- ${payload.value.productImages?[0]}");
  //   Get.delete<ProductDetailsController>();
  //   Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  //   Get.toNamed(RoutesConstants.productDetailsView, arguments: [
  //     SharedPreferenceUtil.getInt(userIdKey).toString() == "0" ? false : true,
  //     false,
  //     payload.value,
  //     true
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: colorPrimary,
      body: Image.asset(PNGImages.splash, fit: BoxFit.cover, height: Get.height, width: Get.width),
    );
  }

  // Future<void> initPackageInfo() async {
  //   final info = await PackageInfo.fromPlatform();
  //
  //   // SharedPreferenceUtil.putString(appVersion, info.version);
  //
  //   Map<String, String> map;
  //   map = {'type': Utils.getDeviceTypeID(), 'version': info.version};
  //
  //   await DioHelper.postData(url: RestConstants.versionCheckerUrl, data: map)
  //       .then((value) {
  //         if (value.statusCode == 200) {
  //           Timer(const Duration(seconds: 5), () {
  //             if (SharedPreferenceUtil.getBool(isLoginKey)) {
  //               if (SharedPreferenceUtil.getBool(nAddress)) {
  //                 // Get.lazyPut<BottomTabBarController>(
  //                 //         () => BottomTabBarController());
  //                 Get.toNamed(RoutesConstants.addressView, arguments: ["Ecommerce", false, true, true]);
  //               } else if (SharedPreferenceUtil.getBool(nEnquiry)) {
  //                 Get.toNamed(RoutesConstants.myRequestView, arguments: [true, 0, 1, true, false]);
  //               } else if (SharedPreferenceUtil.getBool(nRfq)) {
  //                 Get.toNamed(RoutesConstants.submitQuoteView, arguments: [SharedPreferenceUtil.getString(nRfqObjectId).toString(), 0]);
  //               } else if (SharedPreferenceUtil.getBool(nOrder)) {
  //                 Get.toNamed(RoutesConstants.orderDetailsView, arguments: [SharedPreferenceUtil.getString(nOrderObjectId).toString(), 0]);
  //               } else if (SharedPreferenceUtil.getBool(nChat)) {
  //                 // Get.delete<ChatDetailsController>();
  //                 // Get.lazyPut<ChatDetailsController>(() => ChatDetailsController());
  //                 Get.toNamed(
  //                   RoutesConstants.chatDetailsView,
  //                   arguments: [
  //                     SharedPreferenceUtil.getString(nChatProfile),
  //                     SharedPreferenceUtil.getString(nChatName),
  //                     SharedPreferenceUtil.getInt(nChatId),
  //                     SharedPreferenceUtil.getInt(nChatUserId),
  //                     SharedPreferenceUtil.getString(nChatType),
  //                     true,
  //                   ],
  //                 );
  //               } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
  //                 // userDetailils();
  //                 // Get.delete<ProductDetailsController>();
  //                 // Get.lazyPut<ProductDetailsController>(
  //                 //     () => ProductDetailsController());
  //                 // Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [
  //                 //   SharedPreferenceUtil.getInt(userIdKey).toString() == "0"
  //                 //       ? false
  //                 //       : true,
  //                 //   false,
  //                 //   payload.value
  //                 // ]);
  //               }
  //               // else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
  //               //   // productDetailsResponse = ProductDetailsResponse.fromJson(SharedPreferenceUtil.getDynamic(dynamicLinkClickResponse));
  //               //   // productDetailsResponse = ProductDetailsResponse.fromJson(jsonDecode(
  //               //   //     SharedPreferenceUtil.getString(dynamicLinkClickResponse)));
  //               //   Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [true, false, SharedPreferenceUtil.getObject(dynamicLinkClickResponse)]);
  //               // }
  //               else {
  //                 SharedPreferenceUtil.putBool(nCommonClick, true);
  //                 Get.offAllNamed(RoutesConstants.getStartView);
  //               }
  //             } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
  //               // userDetails();
  //             } else {
  //               SharedPreferenceUtil.putBool(nCommonClick, true);
  //               Get.offAllNamed(RoutesConstants.loginView);
  //             }
  //           });
  //           // isShowDialog.value = true;
  //           // setState(() {});
  //         }
  //       })
  //       .catchError((error) {
  //         if (error is DioError) {
  //           if (error.response != null) {
  //             return openDialog("A New Version is Available, Please Update the App.", error.response?.data['payload']['is_force_update'], context);
  //           }
  //           // showDialogVersionChecker();
  //           // versionError = error;
  //         }
  //       });
  // }

  // showDialogVersionChecker() {
  //   final res = (versionError as DioError).response;
  //   var data = res?.data;
  //   if (data != null) {
  //     return openDialog(data['message'].toString(), data['data']['is_force_update'], context);
  //   } else {
  //     return Container(
  //       color: Colors.white,
  //       child: const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 20),
  //         child: Text(
  //           'Something went wrong!.',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(color: Colors.black, fontSize: 14),
  //         ),
  //       ),
  //     );
  //   }
  // }

  openDialog(String msg, String isForce, BuildContext context) {
    Future.delayed(Duration.zero).then((value) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContex) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Update',
                      style: TextStyle(
                        // fontFamily: Constants.app_font_semi_bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      msg,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // fontFamily: Constants.app_font,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    isForce == '1'
                        ? CommonButton(
                            text: 'Update',
                            onTap: () {
                              Get.back();
                              // StoreRedirect.redirect(
                              //     androidAppId: "com.sideline_savings",
                              //     iOSAppId: "1625851945");
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonButton(
                                buttonMargin: EdgeInsets.zero,
                                width: 100.w,
                                text: 'Cancel',
                                onTap: () {
                                  Get.back();
                                  Timer(const Duration(seconds: 1), () {
                                    if (SharedPreferenceUtil.getBool(isLoginKey)) {
                                      if (SharedPreferenceUtil.getBool(nAddress)) {
                                        // Get.lazyPut<BottomTabBarController>(
                                        //         () => BottomTabBarController());
                                        Get.toNamed(RoutesConstants.addressView, arguments: ["Ecommerce", false, true, true]);
                                      } else if (SharedPreferenceUtil.getBool(nEnquiry)) {
                                        Get.toNamed(RoutesConstants.myRequestView, arguments: [true, 0, 1, true, false]);
                                      } else if (SharedPreferenceUtil.getBool(nRfq)) {
                                        Get.toNamed(RoutesConstants.submitQuoteView, arguments: [SharedPreferenceUtil.getString(nRfqObjectId).toString(), 0]);
                                      } else if (SharedPreferenceUtil.getBool(nOrder)) {
                                        Get.toNamed(RoutesConstants.orderDetailsView, arguments: [SharedPreferenceUtil.getString(nOrderObjectId).toString(), 0]);
                                      } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
                                        // userDetailstails();
                                        // Get.delete<ProductDetailsController>();
                                        // Get.lazyPut<ProductDetailsController>(
                                        //     () => ProductDetailsController());
                                        // Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [
                                        //   SharedPreferenceUtil.getInt(userIdKey).toString() == "0"
                                        //       ? false
                                        //       : true,
                                        //   false,
                                        //   payload.value
                                        // ]);
                                      }
                                      // else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
                                      //   // productDetailsResponse = ProductDetailsResponse.fromJson(SharedPreferenceUtil.getDynamic(dynamicLinkClickResponse));
                                      //   // productDetailsResponse = ProductDetailsResponse.fromJson(jsonDecode(
                                      //   //     SharedPreferenceUtil.getString(dynamicLinkClickResponse)));
                                      //   Get.offAllNamed(RoutesConstants.productDetailsView, arguments: [true, false, SharedPreferenceUtil.getObject(dynamicLinkClickResponse)]);
                                      // }
                                      else {
                                        SharedPreferenceUtil.putBool(nCommonClick, true);
                                        Get.offAllNamed(RoutesConstants.getStartView);
                                      }
                                    } else if (SharedPreferenceUtil.getBool(dynamicLinkClick)) {
                                      // userDetails();
                                    } else {
                                      SharedPreferenceUtil.putBool(nCommonClick, true);
                                      Get.offAllNamed(RoutesConstants.loginView);
                                    }
                                  });
                                  // isShowDialog.value = true;
                                  // setState(() {});
                                },
                              ),
                              SizedBox(width: 10.w),
                              CommonButton(
                                buttonMargin: EdgeInsets.zero,
                                width: 100.w,
                                text: 'Update',
                                onTap: () {
                                  // StoreRedirect.redirect(
                                  //     androidAppId: "com.sideline_savings",
                                  //     iOSAppId: "1625851945");
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
