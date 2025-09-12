// import 'dart:async';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import 'color.dart';
// import 'common_appbar.dart';
// import 'image.dart';
//
// class InAppWebViewScreen extends StatefulWidget {
//   final String? webUrl;
//   final String? title;
//   final String? content;
//   RxBool test = false.obs;
//   final PreferredSizeWidget? appBar;
//
//   InAppWebViewScreen({
//     Key? key,
//     this.webUrl,
//     this.title,
//     this.content,
//     this.appBar,
//     required this.test,
//   }) : super(key: key);
//
//   @override
//   InAppWebViewScreenState createState() => InAppWebViewScreenState();
// }
//
// class InAppWebViewScreenState extends State<InAppWebViewScreen> {
//   final GlobalKey webViewKey = GlobalKey();
//
//   InAppWebViewController? webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//           // useShouldOverrideUrlLoading: true,
//           javaScriptEnabled: true,
//           mediaPlaybackRequiresUserGesture: false,
//           supportZoom: true,
//           transparentBackground: true,
//           clearCache: true,
//           javaScriptCanOpenWindowsAutomatically: true
//           // disableHorizontalScroll: true,
//           // disableVerticalScroll: false,
//           // verticalScrollBarEnabled: false,
//           // horizontalScrollBarEnabled: false,
//           ),
//       android: AndroidInAppWebViewOptions(useHybridComposition: true),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));
//
//   late PullToRefreshController pullToRefreshController;
//   String url = "";
//   double progress = 0;
//   final urlController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     pullToRefreshController = PullToRefreshController(
//       options: PullToRefreshOptions(color: Colors.blue),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: widget.appBar ??
//           CommonAppBarWidget(
//               statusBarIconBrightness: Brightness.dark,
//               statusBarBrightness: Brightness.light,
//               elevation: 2,
//               toolbarHeight: 50.h,
//               paddingBack: EdgeInsets.only(top: 12.h, bottom: 15.h),
//               paddingText: EdgeInsets.only(top: 10.h, bottom: 15.h),
//               centerTitle: true,
//               title: widget.title,
//               backWidget: GestureDetector(
//                 onTap: () async {
//                   widget.test.value = false;
//                   Get.back();
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: 8.w, right: 8.w, top: 12.h, bottom: 15.h),
//                   child: SvgPicture.asset(
//                     SVGImages.appbarBack,
//                     color: blackColor,
//                   ),
//                 ),
//               )),
//       body: GestureDetector(
//           onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//           child: WillPopScope(
//             onWillPop: () async {
//               widget.test.value = false;
//               return true;
//             },
//             child: Obx(
//               () => widget.test.value
//                   ? Container(
//                       height: Get.height,
//                       color: whiteColor,
//                       width: Get.width,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(height: 10.h),
//                             progress < 1.0
//                                 ? Expanded(
//                                     child: Container(
//                                       height: Get.height,
//                                       width: Get.width,
//                                       color: whiteColor,
//                                       child: Center(
//                                         child: CircularProgressIndicator(
//                                             color: colorDC4326),
//                                       ),
//                                     ),
//                                   )
//                                 : Container(
//                                     color: whiteColor,
//                                   ),
//                             Expanded(
//                               child: InAppWebView(
//                                 key: webViewKey,
//                                 gestureRecognizers: Set()
//                                   ..add(Factory<VerticalDragGestureRecognizer>(
//                                       () => VerticalDragGestureRecognizer())),
//                                 initialData: InAppWebViewInitialData(
//                                     data: widget.content ?? ""),
//
//                                 // initialUrlRequest: URLRequest(
//                                 //     url: Uri.parse(
//                                 //         widget.webUrl ?? "https://www.google.com/")),
//                                 initialOptions: options,
//                                 onWebViewCreated: (controller) {
//                                   webViewController = controller;
//                                 },
//                                 onLoadStart: (controller, url) {
//                                   setState(() {
//                                     this.url = url.toString();
//                                     urlController.text = this.url;
//                                   });
//                                 },
//                                 androidOnPermissionRequest:
//                                     (controller, origin, resources) async {
//                                   return PermissionRequestResponse(
//                                       resources: resources,
//                                       action: PermissionRequestResponseAction
//                                           .GRANT);
//                                 },
//
//                                 onLoadStop: (controller, url) async {
//                                   pullToRefreshController.endRefreshing();
//                                   setState(() {
//                                     this.url = url.toString();
//                                     urlController.text = this.url;
//                                   });
//                                 },
//                                 onLoadError: (controller, url, code, message) {
//                                   pullToRefreshController.endRefreshing();
//                                 },
//                                 onProgressChanged: (controller, progress) {
//                                   if (progress == 100) {
//                                     pullToRefreshController.endRefreshing();
//                                   }
//                                   setState(() {
//                                     this.progress = progress / 100;
//                                     urlController.text = this.url;
//                                   });
//                                 },
//                                 onUpdateVisitedHistory:
//                                     (controller, url, androidIsReload) {
//                                   setState(() {
//                                     this.url = url.toString();
//                                     urlController.text = this.url;
//                                   });
//                                 },
//                                 onConsoleMessage: (controller, consoleMessage) {
//                                   debugPrint("$consoleMessage");
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ))
//                   : Offstage(),
//             ),
//           )),
//     );
//   }
//
//   @override
//   void dispose() {
//     urlController.dispose();
//     super.dispose();
//   }
// }
