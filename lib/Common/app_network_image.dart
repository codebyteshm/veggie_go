import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final Color? color;
  final Color? imageColor;
  final double? borderRadius;
  final BoxShape shape;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool matchTextDirection;

  final bool isProfile;
  final String placeholderString;

  final BlendMode? backgroundBlendMode;
  final bool showPreview;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.color = Colors.white,
    this.imageColor,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.fit,
    this.matchTextDirection = false,
    this.isProfile = false,
    this.placeholderString = "",
    this.backgroundBlendMode,
    this.showPreview = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(url)?.isAbsolute == true && url != "";

    return InkWell(
      highlightColor: null,
      splashColor: null,
      onTap: (){},
      // isValidUrl && showPreview
      //     ? () => Utils.instance.openImagePreview(imageList: [url])
      //     : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          backgroundBlendMode: backgroundBlendMode,
          color: color,
          shape: shape,
          // border: Border.all(color: AppColors.fieldBorderColor.withOpacity(0.2), width: 2),
          borderRadius:
          shape != BoxShape.circle
              ? BorderRadius.circular(borderRadius ?? 0)
              : null,
          boxShadow:
          isProfile
              ? [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0.0, 0.0),
              blurRadius: 8,
            ),
          ]
              : [],
        ),
        child: Skeleton.replace(
          replacement: Bone(
            height: height ?? 24,
            width: width ?? 24,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          child:
          isValidUrl
              ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            child:
            url.endsWith(".svg")
                ? SvgPicture.network(
              url,
              fit: fit ?? BoxFit.contain,
              height: height,
              matchTextDirection: matchTextDirection,
              width: width,
              colorFilter:
              imageColor != null
                  ? ColorFilter.mode(
                imageColor!,
                BlendMode.srcIn,
              )
                  : null,
            )
                : CachedNetworkImage(
              imageUrl: url,
              fit: fit,
              height: height,
              matchTextDirection: matchTextDirection,
              width: width,
              color: imageColor,
              progressIndicatorBuilder: (
                  context,
                  url,
                  downloadProgress,
                  ) {
                /*return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedOpacity(
                                  opacity: downloadProgress.progress ?? 0.5,
                                  duration: Duration(milliseconds: 500),
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor: Platform.isAndroid ? AppColors.primary : null,
                                    value: downloadProgress.progress,
                                  ),
                                ),
                              ),
                            );*/
                return Skeletonizer.zone(
                  child: Bone(
                    height: height,
                    width: width,
                    borderRadius: BorderRadius.circular(
                      borderRadius ?? 0,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return _buildPlaceHolderImage(
                  borderRadius,
                  height,
                  width,
                  fit,
                );
              },
            ),
          )
              : _buildPlaceHolderImage(borderRadius, height, width, fit),
        ),
      ),
    );
  }

  Widget _buildPlaceHolderImage(
      double? borderRadius,
      double? height,
      double? width,
      BoxFit? fit,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Center(
        child: SvgPicture.asset(
          SVGImages.profile,
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          fit: fit ?? BoxFit.contain,
        ),
      ),
    );
  }
}
