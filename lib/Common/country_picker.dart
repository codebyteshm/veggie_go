// import 'package:e_commerce46/Common/strings.dart';
// import 'package:e_commerce46/Common/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'color.dart';
// import 'common_textField.dart';
// import 'image.dart';
//
// class CountryPicker extends StatefulWidget {
//   CountryPicker(
//       {Key? key,
//       this.controller,
//       this.focusNode,
//       this.margin,
//       required this.listOfFocusNode,
//       required this.index,
//       this.onTap,
//       this.textInputAction,
//       this.onFieldSubmitted,
//       required this.onValuePicked,
//       required this.selectedDialogCountry})
//       : super(key: key);
//   TextEditingController? controller;
//   FocusNode? focusNode;
//   final ValueChanged<Country> onValuePicked;
//   Country selectedDialogCountry;
//   final EdgeInsetsGeometry? margin;
//   final GestureTapCallback? onTap;
//   final ValueChanged<String>? onFieldSubmitted;
//   final List<FocusNode> listOfFocusNode;
//   final int index;
//   final TextInputAction? textInputAction;
//
//   @override
//   State<CountryPicker> createState() => _CountryPickerState();
// }
//
// class _CountryPickerState extends State<CountryPicker> {
//   @override
//   Widget build(BuildContext context) {
//     return CommonTextFormField(
//       focusNode: widget.focusNode,
//       onTap: widget.onTap,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       controller: widget.controller,
//       textInputAction: widget.textInputAction ?? TextInputAction.next,
//       hint: mobileNumber,
//       textInputType: TextInputType.number,
//       // maxLength: 12,
//       prefixIconName: SVGImages.phone,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp("[0-9]")),
//         LengthLimitingTextInputFormatter(13),
//       ],
//       mobile: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(right: 10.w),
//             child: GestureDetector(
//               onTap: _openCountryPickerDialog,
//               child: _buildDialogShow(widget.selectedDialogCountry),
//             ),
//           ),
//         ],
//       ),
//       listOfFocusNode: widget.listOfFocusNode,
//       index: widget.index,
//     );
//   }
//
//   void _openCountryPickerDialog() => showDialog(
//         context: context,
//         builder: (context) => CountryPickerDialog(
//           titlePadding: EdgeInsets.all(8.0.h),
//           searchInputDecoration:
//               const InputDecoration(hintText: '${search}...'),
//           isSearchable: true,
//           title: Text(selectYourPhoneCode),
//           onValuePicked: widget.onValuePicked,
//           itemBuilder: _buildDialogItem,
//           // itemFilter: (c) => [
//           //   'Austria',
//           //   'Germany',
//           //   'Hungary',
//           //   'Liechtenstein',
//           //   'Luxembourg',
//           //   'Switzerland'
//           // ].contains(c.name),
//           // priorityList: [
//           //   CountryPickerUtils.getCountryByIsoCode('TR'),
//           //   CountryPickerUtils.getCountryByIsoCode('US'),
//           // ],
//         ),
//       );
//
//   Widget _buildDialogItem(Country country) => Row(
//         children: <Widget>[
//           CountryPickerUtils.getDefaultFlagImage(country),
//           SizedBox(width: 8.h),
//           Text("+${country.phoneCode}"),
//           SizedBox(width: 8.h),
//           Flexible(child: Text(country.name))
//         ],
//       );
//
//   Widget _buildDialogShow(Country country) => IntrinsicHeight(
//         child: Row(
//           children: <Widget>[
//             Text(
//               "+${country.phoneCode}",
//               style: openSansBold(fontSize: 16, textColor: color00394D),
//             ),
//             Padding(
//                 padding: EdgeInsets.only(left: 10.w),
//                 child: SvgPicture.asset(SVGImages.mobileDropDown)),
//           ],
//         ),
//       );
// }
