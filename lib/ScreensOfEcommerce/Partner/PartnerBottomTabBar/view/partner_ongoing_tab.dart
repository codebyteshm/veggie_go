import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/common_widget.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Partner/PartnerBottomTabBar/view/partner_payment_collection.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:e_commerce46/routes/routes_strings.dart';

class PartnerOngoingTab extends StatefulWidget {
  const PartnerOngoingTab({super.key});

  @override
  State<PartnerOngoingTab> createState() => _PartnerOngoingTabState();
}

class _PartnerOngoingTabState extends State<PartnerOngoingTab> {
  bool _showOrderProgress = false;

  void _showConfirmStartDelivery() {
    // Order ID shown in the dialog (replace with actual value if available)
    final String orderId = 'ORD-2025-0012';
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top circular icon matching Figma
                Container(
                  height: 64.h,
                  width: 64.h,
                  decoration:  BoxDecoration(
                    color: colorPrimary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      SVGImages.bOngoing,
                      height: 24.h,
                      color: colorPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Confirm Delivery Start',
                  style: openSansBold(fontSize: 20.sp, textColor: color0D1833),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Are you sure you want to start this delivery?',
                  textAlign: TextAlign.center,
                  style: openSansMedium(fontSize: 16.sp, textColor: color757575),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: colorF3F4F6,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Order ID: ',
                        style: openSansSemiBold(fontSize: 12.sp, textColor: color4B5563),
                      ),
                      Text(
                        '#$orderId',
                        style: openSansSemiBold(fontSize: 12.sp, textColor: color0D1833),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CommonButton(
                  height: 44.h,
                  text: 'Yes, Start Delivery',
                  backgroundColor: colorPrimary,
                  textColor: whiteColor,
                  buttonMargin: EdgeInsets.zero,
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _showOrderProgress = true;
                    });
                  },
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 44.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: colorD1D5DB),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Cancel',
                      style: openSansSemiBold(fontSize: 12.sp, textColor: color374151),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Ongoing Order', showBackButton: true, isShowBackArrow: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _orderInfoCard(),
                  SizedBox(height: 12.h),
                  _customerInfoCard(),
                  SizedBox(height: 12.h),
                  _itemsOrderedCard(),
                  SizedBox(height: 12.h),
                  _billSummaryCard(),
                  if (_showOrderProgress) ...[SizedBox(height: 12.h), _orderProgressCard()],
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: _showOrderProgress
                ? Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          height: 44.h,
                          text: 'Go To Payment',
                          backgroundColor: colorPrimary,
                          textColor: whiteColor,
                          buttonMargin: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            Get.to(() => const PartnerPaymentCollectionScreen());
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CommonButton(
                          height: 44.h,
                          text: 'Cancel',
                          backgroundColor: colorPrimary,
                          textColor: whiteColor,
                          buttonMargin: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(8.r),
                          onTap: () {
                            Get.toNamed(RoutesConstants.cancelReasonView);
                          },
                        ),
                      ),
                    ],
                  )
                : CommonButton(
                    height: 44.h,
                    text: 'Start Delivery',
                    backgroundColor: colorPrimary,
                    textColor: whiteColor,
                    buttonMargin: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: _showConfirmStartDelivery,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _cardWrapper({required Widget child}) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorE1E1E1),
      ),
      padding: EdgeInsets.all(12.w),
      child: child,
    );
  }

  Widget _orderInfoCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ORD-2025-00001',
                style: openSansSemiBold(fontSize: 14.sp, textColor: color00394D),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(color: colorDCFCE7, borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'Completed',
                  style: openSansSemiBold(fontSize: 10.sp, textColor: color166534),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                'Order Date',
                style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
              ),
              Spacer(),
              Text(
                'Jan 15, 2025 • 2:30 PM',
                style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                'Payment Status',
                style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(color: colorDCFCE7, borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'Paid',
                  style: openSansSemiBold(fontSize: 10.sp, textColor: colorPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customerInfoCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Information',
            style: openSansBold(fontSize: 14.sp, textColor: color00394D),
          ),
          SizedBox(height: 8.h),
          Text(
            'Rahul Sharma',
            style: openSansSemiBold(fontSize: 14.sp, textColor: color00394D),
          ),
          SizedBox(height: 4.h),
          Text(
            '+91 98765 43210',
            style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
          ),
          SizedBox(height: 8.h),
          Text(
            'DELIVERY ADDRESS',
            style: openSansSemiBold(fontSize: 10.sp, textColor: color969696),
          ),
          SizedBox(height: 4.h),
          Text(
            'Flat 302, Building A-1 Sector 62, Noida\nUttar Pradesh - 201301',
            style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
          ),
        ],
      ),
    );
  }

  Widget _itemsOrderedCard() {
    final items = [
      {'image': PNGImages.orange, 'title': 'Fresh Tomatoes (200gm)', 'subtitle': '2 × 60', 'price': '₹80'},
      {'image': PNGImages.orange, 'title': 'Green Onions (200gm)', 'subtitle': '1 × 25', 'price': '₹25'},
      {'image': PNGImages.orange, 'title': 'Carrots (1kg)', 'subtitle': '3 × 30', 'price': '₹90'},
    ];

    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Items Ordered',
            style: openSansBold(fontSize: 14.sp, textColor: color00394D),
          ),
          SizedBox(height: 8.h),
          ...List.generate(items.length, (index) {
            final e = items[index];
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(e['image']!, height: 44.h, width: 44.h, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['title']!,
                              style: openSansSemiBold(fontSize: 13.sp, textColor: color00394D),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              e['subtitle']!,
                              style: openSansRegular(fontSize: 11.sp, textColor: color6B7280),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        e['price']!,
                        style: openSansSemiBold(fontSize: 13.sp, textColor: color00394D),
                      ),
                    ],
                  ),
                ),
                if (index != items.length - 1) Divider(color: colorE1E1E1),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _billRow(String label, String value, {bool isFree = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: openSansRegular(fontSize: 12.sp, textColor: color4B5563),
            ),
          ),
          Text(
            value,
            style: openSansSemiBold(fontSize: 12.sp, textColor: isFree ? colorPrimary : color00394D),
          ),
        ],
      ),
    );
  }

  Widget _billSummaryCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bill Summary',
            style: openSansBold(fontSize: 14.sp, textColor: color00394D),
          ),
          SizedBox(height: 8.h),
          _billRow('Sub Total', '₹195'),
          _billRow('Handling Charge', 'Free', isFree: true),
          _billRow('Delivery Charge', 'Free', isFree: true),
          Divider(color: colorE1E1E1),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Grand Total',
                  style: openSansBold(fontSize: 14.sp, textColor: color00394D),
                ),
              ),
              Text(
                '₹205',
                style: openSansBold(fontSize: 14.sp, textColor: colorPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String label, {bool active = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: active ? FigmaColors.softGreen : whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: active ? FigmaColors.primary : FigmaColors.inactive),
      ),
      child: Text(
        label,
        style: openSansSemiBold(fontSize: 10.sp, textColor: active ? FigmaColors.primary : color4B5563),
      ),
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
        heightBox(5.h),
        Text(
          text,
          textAlign: TextAlign.center,
          style: openSansMedium(fontSize: 11.sp, textColor: active ? FigmaColors.primary : FigmaColors.inactive),
        ),
      ],
    );
  }

  Widget _connector({bool active = false}) {
    return Container(height: 2.h, width: 30.w, color: active ? FigmaColors.primary : FigmaColors.inactive);
  }

  Widget _orderProgressCard() {
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Order Progress',
                style: openSansSemiBold(fontSize: 12.sp, textColor: FigmaColors.textStrong),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(color: FigmaColors.badgeBg, borderRadius: BorderRadius.circular(20.r)),
                child: Text(
                  'On hold',
                  style: openSansSemiBold(fontSize: 10.sp, textColor: FigmaColors.badgeText),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _progressIcon('assets/svg_image/tick.svg', 'Start', active: true),
              _connector(active: true),
              _progressIcon(SVGImages.op2, 'Processing', active: true),
              _connector(active: false),
              _progressIcon(SVGImages.op3, 'Payment', active: false),
              _connector(active: false),
              _progressIcon(SVGImages.op4, 'Completed', active: false),
            ],
          ),
        ],
      ),
    );
  }
}
