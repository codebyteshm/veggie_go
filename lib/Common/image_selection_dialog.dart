import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:e_commerce46/Common/string_extention.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'color.dart';
import 'custom_dialog.dart';

class ImageSelectDialog {
  static final ImagePicker _picker = ImagePicker();
  static bool isProgress = false;

  static Future<dynamic> onImageSelection({int? imageCount, required BuildContext mainContext}) async {
    isProgress = false;
    return showDialog(
      context: mainContext,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((9).r))),
          child: StatefulBuilder(
            builder: (context, StateSetter setStateNew) {
              return Container(
                height: (140).h,
                // width: (950).w,
                child: Center(
                  child: /*isProgress
                      ? const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.blue,
                        )
                      : */ Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _getDialogButtons(
                        Icons.photo_album_outlined,
                        "Gallery",
                        ImageSource.gallery,
                        (isPr) {
                          setStateNew(() {
                            isProgress = isPr;
                          });
                        },
                        imageCount,
                        context,
                      ),
                      SizedBox(width: (11).w),
                      Container(height: (70).h, width: (1).w, color: Colors.grey),
                      SizedBox(width: (11).w),
                      _getDialogButtons(
                        Icons.camera_alt,
                        "Camera",
                        ImageSource.camera,
                        (isPr) {
                          setStateNew(() {
                            isProgress = isPr;
                          });
                        },
                        imageCount,
                        context,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Widget _getDialogButtons(IconData icon, String title, ImageSource imageSource, OnShowProgress setState, int? imageQuantity, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Navigator.pop(context);
        PermissionStatus permissionStatus = PermissionStatus.denied;

        if (imageSource == ImageSource.gallery && Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;
          if (androidInfo.version.sdkInt <= 32) {
            await Permission.storage.request();
          } else {
            await Permission.photos.request();
          }
          if (Platform.isAndroid) {
            if (androidInfo.version.sdkInt <= 32) {
              permissionStatus = await Permission.storage.status;
            } else {
              permissionStatus = await Permission.photos.status;
            }
          }
          // SharedPreferenceUtil.putString(kGalleryPermission, "$permissionStatus");
          if (permissionStatus.isDenied) {
            if (androidInfo.version.sdkInt <= 32) {
              await Permission.storage.request();
            } else {
              await Permission.photos.request();
            }

            if (permissionStatus.isDenied) {
              showDialog(
                barrierDismissible: true,
                context: rootNavigatorKey.currentContext!,
                barrierColor: Colors.transparent, // space around dialog

                builder: (context) => WillPopScope(
                  onWillPop: () async => Future.value(true),
                  child: CustomDialog(
                    message: "Gallery disabled, Allow permission to access the storage in your device setting",
                    onTap: () async {
                      Navigator.pop(context);
                      openAppSettings();
                      PermissionStatus _permissionStatus = androidInfo.version.sdkInt <= 32 ? permissionStatus = await Permission.storage.status : permissionStatus = await Permission.photos.status;

                      /// use [Permissions.photos.status]

                      print(_permissionStatus);
                    },
                  ),
                ),
              );
            }
          } else if (permissionStatus.isPermanentlyDenied) {
            showDialog(
              barrierDismissible: true,
              context: rootNavigatorKey.currentContext!,
              barrierColor: Colors.transparent, // space around dialog

              builder: (context) => WillPopScope(
                onWillPop: () async => Future.value(true),
                child: CustomDialog(
                  message: "Gallery disabled, Allow permission to access the storage in your device setting",
                  onTap: () async {
                    Navigator.pop(context);
                    openAppSettings();
                    PermissionStatus _permissionStatus = androidInfo.version.sdkInt <= 32 ? permissionStatus = await Permission.storage.status : permissionStatus = await Permission.photos.status;
                    print(_permissionStatus);
                  },
                ),
              ),
            );
          } else {
            // pickImage(imageSource, setState, imageQuantity);
          }
          //////////////////////////////////////
          if (androidInfo.version.sdkInt <= 32) {
            await Permission.storage.request();
          } else {
            await Permission.photos.request();
          }
          if (await Permission.photos.request().isGranted || await Permission.storage.request().isGranted) {
            pickImage(imageSource, setState, imageQuantity, context);
          } else {
            // showDialog(
            //     barrierDismissible: true,
            //     context: rootNavigatorKey.currentContext!,
            //     barrierColor: Colors.transparent, // space around dialog
            //
            //     builder: (context) => WillPopScope(
            //           onWillPop: () async => Future.value(true),
            //           child: CustomDialog(
            //             content: "Gallery disabled, Allow permission to access the storage in your device setting",
            //             onTap: () async {
            //               Navigator.pop(context);
            //               openAppSettings();
            //               PermissionStatus _permissionStatus =
            //                   androidInfo.version.sdkInt <= 32 ? permissionStatus = await Permission.storage.status : permissionStatus = await Permission.photos.status;
            //               print(_permissionStatus);
            //             },
            //             showCloseIcon: false,
            //           ),
            //         ));
          }
        } else {
          pickImage(imageSource, setState, imageQuantity, context);
        }
        // else {
        //   if (await Permission.camera.request().isGranted || await Permission.storage.request().isGranted) {
        //     pickImage(imageSource, setState, imageQuantity, context);
        //   }
        //     else {
        //     showDialog(
        //         barrierDismissible: true,
        //         context: rootNavigatorKey.currentContext!,
        //         barrierColor: Colors.transparent, // space around dialog
        //
        //         builder: (context) => WillPopScope(
        //               onWillPop: () async => Future.value(true),
        //               child: CustomDialog(
        //                 content: "Gallery disabled, Allow permission to access the storage in your device setting",
        //                 onTap: () async {
        //                   Navigator.pop(context);
        //                   openAppSettings();
        //                   PermissionStatus _permissionStatus =
        //                       androidInfo.version.sdkInt <= 32 ? permissionStatus = await Permission.storage.status : permissionStatus = await Permission.photos.status;
        //                   print(_permissionStatus);
        //                 },
        //                 showCloseIcon: false,
        //               ),
        //             ));
        //   }
        //   // pickImage(imageSource, setState, imageQuantity, context);
        // }
      },
      // controller: null,
      child: SizedBox(
        width: (120).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10.h),
            Container(
              height: 70.w,
              width: 70.w,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color226DDF.withOpacity(0.10)),
              child: Padding(padding: const EdgeInsets.all(15), child: Icon(icon)),
            ),
            SizedBox(height: 15.h),
            Flexible(child: Text(title)),
          ],
        ),
      ),
    );
  }

  static pickImage(ImageSource imageSource, OnShowProgress setState1, int? imageQuantity, BuildContext context) async {
    try {
      setState1.call(true);
      if (imageSource == ImageSource.gallery && imageQuantity != null) {
        List<XFile>? image = await _picker.pickMultiImage(maxWidth: 800, maxHeight: 800, imageQuality: 60);

        if (image.isNotEmpty) {
          setState1.call(false);
          Navigator.pop(context);
        } else {
          setState1.call(false);
          Navigator.pop(context);
        }
      } else {
        XFile? image = await _picker.pickImage(source: imageSource, maxWidth: 800, maxHeight: 800, imageQuality: 60);

        if (image != null) {
          // XFile xFileCamera = XFile(image.path);
          // Navigator.pop(context,xFileCamera);
          _cropImage(image, setState1, imageQuantity, context);
        } else {
          setState1.call(false);
          Navigator.pop(context);
        }
      }
    } on PlatformException catch (e) {
      setState1.call(false);
      Navigator.pop(context);
      if (e.code == "camera_access_denied" && imageSource == ImageSource.camera) {
        PermissionStatus status = await Permission.camera.status;
        if (status == PermissionStatus.permanentlyDenied) {
          "Hitch customer app needs to access camera to record while you going live. Please allow camera permission.'".toast();
          openAppSettings();
        } else if (status == PermissionStatus.denied) {
          status = await Permission.camera.request();
          if (status == PermissionStatus.denied) {
            "Hitch customer app needs to access camera to record while you going live. Please allow camera permission.'".toast();
            //openAppSettings();
          } else if (status == PermissionStatus.permanentlyDenied || status == PermissionStatus.restricted) {
            "Hitch customer app needs to access camera to record while you going live. Please allow camera permission.".toast();
            openAppSettings();
          }
        }
      } else if (e.code == "photo_access_denied" && imageSource == ImageSource.gallery) {
        PermissionStatus status = await Permission.photos.status;
        if (status == PermissionStatus.permanentlyDenied) {
          'Hitch customer app needs to access your Gallery to choose the picture for Profile and create broadcast.'.toast();
          openAppSettings();
        } else if (status == PermissionStatus.denied) {
          'Hitch customer app needs to access your Gallery to choose the picture for Profile and create broadcast.'.toast();
          status = await Permission.photos.request();
          if (status == PermissionStatus.denied || status == PermissionStatus.permanentlyDenied || status == PermissionStatus.restricted) {
            'Hitch customer app needs to access your Gallery to choose the picture for Profile and create broadcast.'.toast();
            // openAppSettings();
            return;
          }
        }
      }
    }
  }

  static Future _cropImage(imageFile, OnShowProgress setState, imageQuantity, BuildContext context) async {
    if (imageFile != null) {
      // CroppedFile? cropped = await ImageCropper().cropImage(sourcePath: imageFile!.path, /*aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      //   CropAspectRatioPreset.ratio3x2,
      //   CropAspectRatioPreset.original,
      //   CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],*/ uiSettings: [
      //   AndroidUiSettings(toolbarTitle: 'Crop', cropGridColor: Colors.black, initAspectRatio: CropAspectRatioPreset.original, lockAspectRatio: false),
      //   IOSUiSettings(title: 'Crop')
      // ]);
      //
      // if (cropped != null) {
      imageFile = File(imageFile.path);
      setState.call(false);
      if (imageQuantity != null) {
        XFile xFileCamera = XFile(imageFile.path);

        Navigator.pop(context, xFileCamera);
        // Get.back(result: listCameraFile);
      } else {
        Navigator.pop(context, imageFile.path);
        // Get.back(result: imageF.ile.path);
      }
      print("imageFile path == ${imageFile.path}");
      // }
    }
  }
}

typedef OnShowProgress = void Function(bool showProgress);
