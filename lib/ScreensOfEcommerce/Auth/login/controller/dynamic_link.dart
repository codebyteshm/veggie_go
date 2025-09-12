// import 'dart:convert';
//
// import 'package:bigtrader/model/productDetailsResponse.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../../repo/dio_helper.dart';
// import '../../../../repo/rest_constants.dart';
// import '../../../../routes/routes_strings.dart';
// import '../../../../utils/key.dart';
// import '../../../../utils/shared_preference_util.dart';
// import '../../../../utils/utills.dart';
// import '../../../home/productDetails/controller/productDetails_controller.dart';
// import '../../../home/searchProduct/controller/searchProduct_response.dart';
//
// var productID = "";
//
// Future<void> initDynamicLink() async {
//   FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
//     var deepLink = dynamicLinkData.link;
//     print('DynamicLinks onLink $deepLink');
//     productID = dynamicLinkData.link.queryParameters['productID'] ?? "";
//     getProductDetails(productID);
//     // SharedPreferenceUtil.getBool(isLoginKey)
//     //     ? getProductDetails(productID)
//     //     : Get.offAllNamed(RoutesConstants.loginView);
//     // getProductDetails(productID);
//   }).onError((error) {
//     print('onLink error');
//     print(error.message);
//     // Utils.showSnackBar("onLink error");
//   });
//
//   final PendingDynamicLinkData? data =
//       await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri? deepLink = data?.link;
//   final queryParams = deepLink?.queryParameters;
//   if (deepLink != null) {
//     Future.delayed(const Duration(milliseconds: 800)).then((value) async {
//       print(deepLink);
//       print("deepLink");
//       print(queryParams);
//       print("queryParams");
//       if (queryParams!.isNotEmpty) {
//         productID = queryParams['productID']!;
//         print(productID);
//         print(
//             "${RestConstants.productDetailsByID}$productID&loggedInUserId=${SharedPreferenceUtil.getInt(userIdKey)}");
//         getProductDetails(productID);
//         // SharedPreferenceUtil.getBool(isLoginKey)
//         //     ? getProductDetails(productID)
//         //     : Get.offAllNamed(RoutesConstants.loginView);
//       }
//     });
//   }
// }
//
// RxBool isLoading = true.obs;
//
// ProductDetailsResponse? productDetailsResponse;
// Rx<ProductDetailsPayload> payload = ProductDetailsPayload().obs;
//
// getProductDetails(String productID) {
//   DioHelper.getData(
//     url:
//         "${RestConstants.productDetailsByID}$productID&loggedInUserId=${SharedPreferenceUtil.getInt(userIdKey).toString() == "0" ? "" : SharedPreferenceUtil.getInt(userIdKey).toString()}",
//   ).then((value) async {
//     if (value.statusCode == 200) {
//       isLoading.value = false;
//       productDetailsResponse = ProductDetailsResponse.fromJson(value.data);
//       payload.value =
//           productDetailsResponse?.payload ?? ProductDetailsPayload();
//       print("Start");
//       if (SharedPreferenceUtil.getBool(nCommonClick)) {
//         print('app resumed---------------');
//         Get.delete<ProductDetailsController>();
//         Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
//         Get.toNamed(RoutesConstants.productDetailsView, arguments: [
//           SharedPreferenceUtil.getInt(userIdKey).toString() == "0"
//               ? false
//               : true,
//           false,
//           productDetailsResponse?.payload,false
//         ]);
//       } else {
//         SharedPreferenceUtil.putBool(dynamicLinkClick, true);
//         await saveProductDetailsDataToSP(productDetailsResponse!);
//       }
//
//       print("End");
//     } else {
//       isLoading.value = false;
//       Utils.showErrorSnackBar(value.statusMessage);
//     }
//   }).catchError((error) {
//     if (error is DioError) {
//       isLoading.value = false;
//       Utils.showErrorSnackBar(
//         error.response?.data['message'],
//       );
//     }
//   });
// }
//
