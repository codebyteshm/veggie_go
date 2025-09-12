//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// // ignore: must_be_immutable
// class CustomDialog extends StatelessWidget {
//   final String message;
//   String? title;
//   final Function? onTap;
//   String? positiveText;
//   final String? negativeText;
//   final Function? onNegativeTap;
//   final TextAlign textAlign;
//   final bool shouldClose;
//
//   CustomDialog(
//       {this.message = "",
//       this.title,
//       this.onTap,
//       this.onNegativeTap,
//       this.textAlign = TextAlign.left,
//       this.positiveText,
//       this.negativeText,
//       this.shouldClose = true,
//       Key? key})
//       : super(key: key) {
//     title ??= "sorry";
//     positiveText ??= "okay";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => shouldClose,
//       child: AlertDialog(
//         scrollable: true,
//         title: Text(
//           title ?? "",
//           style: montserratMedium(fontSize: 20.sp,textColor: blackColor)
//         ),
//         content: Text(
//           message,
//           textAlign: textAlign,
//           style: montserratMedium(fontSize: 15.sp,textColor: blackColor)
//         ),
//         actions: <Widget>[
//           Container(
//             height: 40,
//             constraints: const BoxConstraints(maxHeight: 40),
//             child: ElevatedButton(
//               onPressed: () {
//                 _closeDialog(context);
//                 onTap?.call();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: color003374, // background
//                 foregroundColor: color003374, // foreground
//               ),
//               child: Text(
//                 positiveText?.toUpperCase() ?? " ",
//                 style: montserratSemiBold(fontSize: 15.sp,textColor: whiteColor)
//               ),
//             ),
//           ),
//           negativeText != null
//               ? Container(
//                   height: 40,
//                   constraints: const BoxConstraints(maxHeight: 40),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _closeDialog(context);
//                       onNegativeTap?.call();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: color003374, // background
//                       foregroundColor: color003374, // foreground
//                     ),
//                     child: Text(
//                       negativeText!.toUpperCase(),
//                       style: montserratSemiBold(fontSize: 15.sp,textColor: whiteColor)
//                     ),
//                   ),
//                 )
//               : const Offstage(),
//           // _getButton(agreeText, _appTheme, context, onTap: onTap?.call()),
//           // _getDismissButton(dismissText, _appTheme, context,
//           //     onTap: onNegativeTap?.call()),
//         ],
//       ),
//     );
//   }
//
//   _closeDialog(BuildContext context) {
//     Get.close(1);
//   }
// }
