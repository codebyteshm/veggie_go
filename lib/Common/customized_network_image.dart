
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';
import 'logger.dart';


enum SizeType {
  // ignore: constant_identifier_names
  W_D_H_D, //Width should calculate as flexible, height should calculate as flexible
  // ignore: constant_identifier_names
  W_S_H_D, //Width should calculate as fixed, height should calculate as flexible
  // ignore: constant_identifier_names
  W_D_H_S, //Width should calculate as flexible, height should calculate as fixed
  // ignore: constant_identifier_names
  W_S_H_S, //Width should calculate as fixed, height should calculate as fixed
}

class CustomizedNetworkImage {
  static getImage(
      {required String url,
      BoxShape shape = BoxShape.rectangle,
      double width = 300,
      BorderRadius? borderRadius,
      Color borderColor = Colors.transparent,
      BoxFit fit = BoxFit.cover,
      double borderWidth = 0,
      double height = 300,
        List<BoxShadow>? boxShadow,
      String? placeHolderImage  ,

      Color? placeholderColor,
      Color? placeholderBackgroundColor,
      double? placeholderWidth,
      double? placeholderHeight,
      Widget? loadingWidget,
      Widget? errorWidget,
      Function? onTap,
      SizeType sizeType = SizeType.W_D_H_D,
      Color? imageOverlay,
      bool showShimmer = true,
      bool showOriginal = false}) {
    return GestureDetector(
      onTap: onTap?.call(),
      child: (url.isEmpty)
          ? returnErrorWidget(
              errorWidget,
              width,
              height,
              shape,
              placeholderBackgroundColor,
              borderRadius,
              placeHolderImage,
              placeholderColor,
              sizeType)
          : CachedNetworkImage(
              key: ValueKey<String>(url),
              imageUrl:
                  getNewUrl('https://api.veggigo.com$url', calculateWidth(width, sizeType), showOriginal),
              color: colorDC4326,
              fadeInCurve: Curves.bounceInOut,
              memCacheHeight: calculateHeight(height, sizeType).ceil(),
              memCacheWidth: calculateWidth(width, sizeType).ceil(),
              width: calculateWidth(width, sizeType),
              height: calculateHeight(height, sizeType),
              imageBuilder: (context, imageProvider) => Container(
                width: calculateWidth(width, sizeType),
                height: calculateHeight(height, sizeType),
                decoration: BoxDecoration(
                  shape: shape,
                  borderRadius: borderRadius,
                  boxShadow:boxShadow,
                  border:
                      Border.all(color: borderColor, width: (borderWidth).w),
                  image: DecorationImage(
                    image: imageProvider,

                    // colorFilter: imageOverlay != null
                    //     ? ColorFilter.mode(imageOverlay, BlendMode.darken)
                    //     : ColorFilter.mode(
                    //         Colors.transparent, BlendMode.darken),
                    fit: fit,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  loadingWidget ??
                  Center(
                    child: Container(
                      width: calculateWidth(width, sizeType),
                      height: calculateHeight(height, sizeType),
                      child: Center(
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight: (30).h, maxWidth: (30).h),
                          height: (30).h,
                          width: (30).h,
                          child: Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme:
                                      ColorScheme.fromSwatch().copyWith(
                                secondary: Colors.red,
                              )),
                              child: const CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                strokeWidth: 2,
                              )),
                        ),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) {
                Logger.write("@96 we got error $url and $error");
                return returnErrorWidget(
                    errorWidget,
                    width,
                    height,
                    shape,
                    placeholderBackgroundColor,
                    borderRadius,
                    placeHolderImage,
                    placeholderColor,
                    sizeType);
              },
            ),
    );
  }

  static Widget returnErrorWidget(
      Widget? errorWidget,
      double width,
      double height,
      BoxShape shape,
      Color? placeholderBackgroundColor,
      BorderRadius? borderRadius,
      String? placeHolderImage,
      Color? placeholderColor,
      SizeType sizeType) {
    return errorWidget ??
        Container(
            width: (width).w,
            height: (height).h,
            decoration: BoxDecoration(
                shape: shape,
                color: placeholderBackgroundColor ?? colorDC4326,
                borderRadius: borderRadius),
           );
  }

  static double calculateWidth(double width, SizeType sizeType) {
    switch (sizeType) {
      case SizeType.W_D_H_D:
        return (width).w;
      case SizeType.W_S_H_D:
      case SizeType.W_S_H_S:
        return width;
      case SizeType.W_D_H_S:
        return (width).w;
      default:
        return (width).w;
    }
  }

  static double calculateHeight(double height, SizeType sizeType) {
    switch (sizeType) {
      case SizeType.W_D_H_D:
        return (height).h;
      case SizeType.W_S_H_D:
        return (height).h;
      case SizeType.W_D_H_S:
      case SizeType.W_S_H_S:
        return height;
      default:
        return (height).h;
    }
  }

  static String getNewUrl(
      String url, double calculateWidth, bool showOriginal) {
    return url;
  }
}
