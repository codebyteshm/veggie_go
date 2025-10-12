import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartnerOrderProgress extends StatelessWidget {
  final int currentStep; // 0: Start, 1: Processing, 2: Payment, 3: Completed
  final String? badgeLabel; // Optional right-side badge text (e.g., "On hold")

  const PartnerOrderProgress({super.key, required this.currentStep, this.badgeLabel});

  bool _isActiveStep(int index) => currentStep >= index;
  bool _isActiveConnector(int index) => currentStep >= index + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Order Progress', style: openSansSemiBold(fontSize: 12.sp, textColor: FigmaColors.textStrong)),
            const Spacer(),
            if (badgeLabel != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(color: FigmaColors.badgeBg, borderRadius: BorderRadius.circular(20.r)),
                child: Text(badgeLabel!, style: openSansSemiBold(fontSize: 10.sp, textColor: FigmaColors.badgeText)),
              ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _progressIcon('assets/svg_image/tick.svg', 'Start', active: _isActiveStep(0)),
            _connector(active: _isActiveConnector(0)),
            _progressIcon(SVGImages.op2, 'Processing', active: _isActiveStep(1)),
            _connector(active: _isActiveConnector(1)),
            _progressIcon(SVGImages.op3, 'Payment', active: _isActiveStep(2)),
            _connector(active: _isActiveConnector(2)),
            _progressIcon(SVGImages.op4, 'Completed', active: _isActiveStep(3)),
          ],
        ),
      ],
    );
  }

  Widget _progressIcon(String assetPath, String text, {bool active = false}) {
    return Column(
      children: [
        Container(
          height: 32.w,
          width: 32.w,
          decoration: BoxDecoration(
            color: active ? FigmaColors.primary : FigmaColors.card,
            shape: BoxShape.circle,
            border: Border.all(color: active ? FigmaColors.primary : FigmaColors.inactive),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(assetPath, height: 18.w, width: 18.w, color: active ? whiteColor : FigmaColors.inactive),
        ),
        SizedBox(height: 5.h),
        Text(text, textAlign: TextAlign.center, style: openSansMedium(fontSize: 11.sp, textColor: active ? FigmaColors.primary : FigmaColors.inactive)),
      ],
    );
  }

  Widget _connector({bool active = false}) {
    return Container(height: 2.h, width: 30.w, color: active ? FigmaColors.primary : FigmaColors.inactive);
  }
}