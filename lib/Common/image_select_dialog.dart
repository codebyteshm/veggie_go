// import 'package:e_commerce46/utils/utills.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'color.dart';
// import 'logger.dart';
//
// class ImageSelectDialog {
//   static final ImagePicker _picker = ImagePicker();
//   static bool isProgress = false;
//
//   static Future<dynamic> onImageSelection() async {
//     isProgress = false;
//     return await Get.dialog(
//       Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(
//               (9).r,
//             ),
//           ),
//         ),
//         child: StatefulBuilder(builder: (context, StateSetter setState) {
//           return Container(
//             height: (120).h,
//             // width: (950).w,
//             child: Center(
//               child: isProgress
//                   ? const CircularProgressIndicator()
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         _getDialogButtons(
//                           Icons.photo_library,
//                           "Gallery",
//                           ImageSource.gallery,
//                           (isPr) {
//                             setState(() {
//                               isProgress = isPr;
//                             });
//                           },
//                         ),
//                         SizedBox(width: (11).w),
//                         Container(
//                           height: (80).h,
//                           width: (1).w,
//                           color: blackColor,
//                         ),
//                         SizedBox(width: (11).w),
//                         _getDialogButtons(
//                           Icons.camera_enhance,
//                           "Camera",
//                           ImageSource.camera,
//                           (isPr) {
//                             setState(() {
//                               isProgress = isPr;
//                             });
//                           },
//                         )
//                       ],
//                     ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   static Widget _getDialogButtons(
//     IconData icon,
//     String title,
//     ImageSource imageSource,
//     OnShowProgress setState,
//   ) {
//     return GestureDetector(
//       onTap: () async {
//         try {
//           setState.call(true);
//           XFile? image = await _picker.pickImage(
//             source: imageSource,
//             maxWidth: 800,
//             maxHeight: 800,
//             imageQuality: 80,
//           );
//           if (image != null) {
//             setState.call(false);
//             Get.back(result: image.path);
//           } else {
//             setState.call(false);
//             Get.back();
//           }
//         } on PlatformException catch (e) {
//           setState.call(false);
//           Get.back();
//           Logger.write('@70 e is: ${e.message} and ${e.code}');
//           if (e.code == "camera_access_denied" &&
//               imageSource == ImageSource.camera) {
//             PermissionStatus status = await Permission.camera.status;
//             Logger.write("==> $status");
//             if (status == PermissionStatus.permanentlyDenied) {
//               Utils.showSnackBar(
//                   "Veggie go app needs to access camera to record while you going live. Please allow camera permission.'");
//               openAppSettings();
//             } else if (status == PermissionStatus.denied) {
//               status = await Permission.camera.request();
//               Logger.write("==> denied $status");
//               if (status == PermissionStatus.denied) {
//                 Utils.showCommonDialog(
//                     message:
//                         'Veggie go app needs to access camera to record while you going live. Please allow camera permission.',
//                     positiveText: "okay",
//                     negativeText: "cancel",
//                     onTap: () {
//                       if (status.isPermanentlyDenied) {
//                         openAppSettings();
//                       } else {
//                         Permission.camera.request();
//                         Logger.write("@117 ===> working");
//                       }
//                     });
//               } else if (status == PermissionStatus.permanentlyDenied ||
//                   status == PermissionStatus.restricted) {
//                 Utils.showSnackBar(
//                     "Veggie go app needs to access camera to record while you going live. Please allow camera permission.");
//                 openAppSettings();
//               }
//               // if (status == PermissionStatus.denied ||
//               //     status == PermissionStatus.permanentlyDenied ||
//               //     status == PermissionStatus.restricted) {
//               //   Utils.displaySnackBar(
//               //       LocaleKeys.appName.tr, (LocaleKeys.cameraRationale.tr));
//               //   openAppSettings();
//               //   return;
//               // }
//             }
//           } else if (e.code == "photo_access_denied" &&
//               imageSource == ImageSource.gallery) {
//             PermissionStatus status = await Permission.photos.status;
//             if (status == PermissionStatus.permanentlyDenied) {
//               Utils.showSnackBar(
//                 'Veggie go app needs to access your Gallery to choose the picture for Profile and create broadcast.',
//               );
//               openAppSettings();
//             } else if (status == PermissionStatus.denied) {
//               Utils.showSnackBar(
//                 'Veggie go app needs to access your Gallery to choose the picture for Profile and create broadcast.',
//               );
//               status = await Permission.photos.request();
//               if (status == PermissionStatus.denied ||
//                   status == PermissionStatus.permanentlyDenied ||
//                   status == PermissionStatus.restricted) {
//                 Utils.showSnackBar(
//                   'Veggie go app needs to access your Gallery to choose the picture for Profile and create broadcast.',
//                 );
//                 // openAppSettings();
//                 return;
//               }
//             }
//           }
//         }
//       },
//       // controller: null,
//       child: SizedBox(
//         width: (120).w,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Icon(
//               icon,
//               size: (50.w),
//               color: Colors.red,
//             ),
//             SizedBox(height: (10).h),
//             Flexible(
//               child: Text(title,
//                   style: TextStyle(fontSize: (20).sp, color: blackColor)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// typedef OnShowProgress = void Function(bool showProgress);
