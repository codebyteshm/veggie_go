import 'package:e_commerce46/Common/common_appbar.dart';
import 'package:e_commerce46/Common/common_button.dart';
import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_commerce46/routes/routes_strings.dart';

import 'controller/address_controller.dart';

class DeliveryAddressScreen extends GetView<AddressController> {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CommonAppBarWidget(title: 'Delivery Address', showBackButton: true),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Obx(() {
                return ListView.separated(
                  itemCount: controller.addresses.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final addr = controller.addresses[index];
                    final selected = addr.isSelected;
                    return _AddressCard(
                      name: addr.name,
                      label: addr.label,
                      addressLine: addr.addressLine,
                      selected: selected,
                      onTap: () => controller.selectAddress(index),
                      onEdit: () async {
                        final updated = await _showAddOrEditSheet(context,
                            title: 'Edit Address', initial: addr);
                        if (updated != null) controller.editAddress(index, updated);
                      },
                      onDelete: () => controller.removeAddress(index),
                    );
                  },
                );
              }),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GestureDetector(
              onTap: () async {
                final created = await _showAddOrEditSheet(context, title: 'Add New Address');
                if (created != null) controller.addAddress(created);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: colorPrimary),
                  color: whiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: colorPrimary, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text('Add New Address', style: openSansSemiBold(textColor: color1C1C1C, fontSize: 14.sp)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, -4))],
            ),
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 30.h),
            child: CommonButton(
              width: double.infinity,
              height: 48.h,
              text: 'Proceed to Payment',
              backgroundColor: colorPrimary,
              buttonMargin: EdgeInsets.zero,
              textColor: whiteColor,
              onTap: () {
                Get.toNamed(RoutesConstants.paymentMethodView);
              },
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard({
    Key? key,
    required this.name,
    required this.label,
    required this.addressLine,
    required this.selected,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final String name;
  final String label;
  final String addressLine;
  final bool selected;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: selected ? colorPrimary : colorDFDFDF, width: 1),
        ),
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? colorPrimary : color969696),
                color: selected ? colorPrimary : Colors.transparent,
              ),
              child: selected
                  ? Icon(Icons.check, color: whiteColor, size: 16.sp)
                  : null,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(name, style: openSansSemiBold(textColor: color1C1C1C, fontSize: 14.sp)),
                      ),
                      GestureDetector(onTap: onEdit, child: Icon(Icons.edit, color: color1C1C1C, size: 18.sp)),
                      SizedBox(width: 5.w),
                      // GestureDetector(onTap: onDelete, child: Icon(Icons.delete_outline, color: color1C1C1C, size: 18.sp)),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(label, style: openSansSemiBold(textColor: color969696, fontSize: 12.sp)),
                  SizedBox(height: 6.h),
                  Text(addressLine, style: openSansRegular(textColor: color1C1C1C, fontSize: 12.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<DeliveryAddress?> _showAddOrEditSheet(BuildContext context,
    {required String title, DeliveryAddress? initial}) async {
  final nameController = TextEditingController(text: initial?.name ?? '');
  final houseController =
      TextEditingController(text: initial?.addressLine ?? '');
  final pinController = TextEditingController(text: initial?.pinCode ?? '');

  final nameFocus = FocusNode();
  final labelFocus = FocusNode();
  final houseFocus = FocusNode();
  final pinFocus = FocusNode();

  String? selectedLabel = initial?.label;

  return await showModalBottomSheet<DeliveryAddress?>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      final bottomInset = MediaQuery.of(ctx).viewInsets.bottom;
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title,
                        style: openSansSemiBold(
                            textColor: color1C1C1C, fontSize: 16.sp)),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(ctx).pop(null),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(height: 6.h),

  // Name
  Text('Name *',
      style: openSansSemiBold(
          textColor: color1C1C1C, fontSize: 12.sp)),
  SizedBox(height: 6.h),
  _OutlinedInput(
    hint: 'Enter your name',
    controller: nameController,
    focusNode: nameFocus,
    textInputAction: TextInputAction.next,
  ),
              SizedBox(height: 12.h),

              // Label
  Text('What do you want to call this address? *',
      style: openSansSemiBold(
          textColor: color969696, fontSize: 12.sp)),
  SizedBox(height: 6.h),
  _OutlinedDropdown(
    focusNode: labelFocus,
    hint: 'Home / Office / Shop',
    selectedValue: selectedLabel,
    items: const ['Home', 'Office', 'Shop'],
    onChanged: (val) {
      selectedLabel = val;
    },
  ),
              SizedBox(height: 12.h),

              // House
  Text('House No. *',
      style: openSansSemiBold(
          textColor: color1C1C1C, fontSize: 12.sp)),
  SizedBox(height: 6.h),
  _OutlinedInput(
    hint: 'House/Flat/Building No.',
    controller: houseController,
    textInputAction: TextInputAction.next,
    focusNode: houseFocus,
  ),
              SizedBox(height: 12.h),

              // Pin Code
  Text('Pin Code*',
      style: openSansSemiBold(
          textColor: color1C1C1C, fontSize: 12.sp)),
  SizedBox(height: 6.h),
  _OutlinedInput(
    hint: '123 456',
    controller: pinController,
    textInputAction: TextInputAction.done,
    focusNode: pinFocus,
    keyboardType: TextInputType.number,
  ),

              SizedBox(height: 16.h),
              CommonButton(
                width: double.infinity,
                height: 44.h,
                text: 'Save Address',
                backgroundColor: colorPrimary,
                textColor: whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  if (nameController.text.trim().isEmpty ||
                      (selectedLabel ?? '').isEmpty ||
                      pinController.text.trim().isEmpty) {
                    Get.snackbar('Missing Details',
                        'Please fill required fields');
                    return;
                  }
                  final address = DeliveryAddress(
                    name: nameController.text.trim(),
                    label: selectedLabel!.trim(),
                    addressLine: houseController.text.trim(),
                    pinCode: pinController.text.trim(),
                  );
                  Navigator.of(ctx).pop(address);
                },
              ),
              SizedBox(height: 8.h),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(ctx).pop(null),
                  child: Text('Cancel',
                      style: openSansSemiBold(
                          textColor: color1C1C1C, fontSize: 14.sp)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _OutlinedInput extends StatelessWidget {
  const _OutlinedInput({
    Key? key,
    required this.hint,
    required this.controller,
    required this.focusNode,
    required this.textInputAction,
    this.keyboardType,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      style: openSansSemiBold(textColor: color1C1C1C, fontSize: 16.sp),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: openSansMedium(textColor: color969696, fontSize: 16.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        filled: true,
        fillColor: whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorDFDFDF, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorPrimary, width: 1),
        ),
      ),
    );
  }
}

class _OutlinedDropdown extends StatelessWidget {
  const _OutlinedDropdown({
    Key? key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.selectedValue,
    required this.focusNode,
  }) : super(key: key);

  final String hint;
  final List<String> items;
  final void Function(String?) onChanged;
  final String? selectedValue;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedValue?.isNotEmpty == true ? selectedValue : null,
      focusNode: focusNode,
      style: openSansSemiBold(textColor: color1C1C1C, fontSize: 16.sp),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: openSansMedium(textColor: color969696, fontSize: 16.sp),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        filled: true,
        fillColor: whiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorDFDFDF, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: colorPrimary, width: 1),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down, color: color969696),
      items: items
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}