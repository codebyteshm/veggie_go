import 'package:e_commerce46/Common/color.dart';
import 'package:e_commerce46/Common/image.dart';
import 'package:e_commerce46/Common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductVariant {
  final String label;
  final double price;
  final double mrp;
  final bool soldOut;
  final RxInt qty = 0.obs;

  ProductVariant({required this.label, required this.price, required this.mrp, this.soldOut = false});
}

class ProductItem {
  final String title;
  final String unit;
  final String price;
  final String imagePath;
  final String category;

  const ProductItem({required this.title, required this.unit, required this.price, required this.imagePath, required this.category});
}

class ProductTabController extends GetxController {
  final RxString selectedCategory = ''.obs; // '' means all
  final RxString searchQuery = ''.obs;

  final List<String> categories = const ['Fruits', 'Vegetables'];

  final List<ProductItem> allProducts = [
    ProductItem(title: 'Orange', unit: '1 kg', price: '₹45', imagePath: PNGImages.orange, category: 'Fruits'),
    ProductItem(title: 'Apple', unit: '500 gm', price: '₹65', imagePath: PNGImages.orange, category: 'Fruits'),
    ProductItem(title: 'Capsicum', unit: '1 kg', price: '₹40', imagePath: PNGImages.orange, category: 'Vegetables'),
    ProductItem(title: 'Tomato', unit: '1 kg', price: '₹30', imagePath: PNGImages.orange, category: 'Vegetables'),
  ];

  List<ProductItem> get filteredProducts {
    final q = searchQuery.value.trim().toLowerCase();
    return allProducts.where((p) {
      final catOk = selectedCategory.value.isEmpty || p.category == selectedCategory.value;
      final qOk = q.isEmpty || p.title.toLowerCase().contains(q);
      return catOk && qOk;
    }).toList();
  }

  void openCategorySheet() {
    String temp = selectedCategory.value;
    Get.bottomSheet(
      _categorySheet(temp, (v) => temp = v),
      backgroundColor: whiteColor,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
    ).whenComplete(() {
      if (temp != selectedCategory.value) {
        selectedCategory.value = temp;
        update();
      }
    });
  }

  Widget _categorySheet(String tempSelected, void Function(String) onSelect) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Categories',
                    style: openSansBold(fontSize: 14.sp, textColor: color00394D),
                  ),
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Icon(Icons.close, size: 18.sp, color: color969696),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...categories.map(
            (c) => RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              value: c,
              groupValue: tempSelected,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              activeColor: colorPrimary,
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v) {
                if (v != null) {
                  onSelect(v);
                  Get.back();
                }
              },
              title: Text(
                c,
                style: openSansMedium(fontSize: 13.sp, textColor: color00394D),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openProductSheet(ProductItem product) {
    final variants = <ProductVariant>[
      ProductVariant(label: '1 kg • (Approx. 6 - 8 pcs)', price: 55.20, mrp: 69.0),
      ProductVariant(label: '500 g • (Approx. 3 - 4 pcs)', price: 27.60, mrp: 34.50),
      ProductVariant(label: '2 kg • (Approx. 12 - 16 pcs)', price: 110.40, mrp: 138.0, soldOut: true),
    ];
    Get.bottomSheet(
      _productSheet(product, variants),
      backgroundColor: whiteColor,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
    );
  }

  Widget _productSheet(ProductItem product, List<ProductVariant> variants) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: openSansBold(fontSize: 16.sp, textColor: color00394D),
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: Icon(Icons.close, size: 18.sp, color: color969696),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ...variants.map(
            (v) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _variantTile(v),
            ),
          ),
          Center(
            child: Text(
              '+2 More Combos',
              style: openSansBold(fontSize: 12.sp, textColor: colorPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _variantTile(ProductVariant v) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorDFDFDF),
        boxShadow: [BoxShadow(color: blackColor.withOpacity(0.06), blurRadius: 10)],
      ),
      padding: EdgeInsets.all(10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(PNGImages.orange, height: 50.w, width: 50.w, fit: BoxFit.cover),
              ),
              if (v.soldOut)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.35), borderRadius: BorderRadius.circular(8.r)),
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(color: colorDFDFDF, borderRadius: BorderRadius.circular(6.r)),
                      child: Text(
                        'Sold Out',
                        style: openSansBold(fontSize: 9.sp, textColor: color00394D),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  v.label,
                  style: openSansBold(fontSize: 13.sp, textColor: color00394D),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      '₹55.2/kg',
                      style: openSansMedium(fontSize: 11.sp, textColor: color969696),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(6.r)),
                      child: Text(
                        '20% OFF',
                        style: openSansBold(fontSize: 10.sp, textColor: whiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹${v.mrp.toStringAsFixed(0)}',
                    style: openSansMedium(fontSize: 12.sp, textColor: color969696).copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '₹${v.price.toStringAsFixed(2)}',
                    style: openSansBold(fontSize: 13.sp, textColor: color00394D),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              v.soldOut ? SizedBox() : Offstage(),
              v.qty.value == 0
                  ? SizedBox(
                      height: 32.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                        ),
                        onPressed: () => v.qty.value = 1,
                        child: Text(
                          'ADD',
                          style: openSansBold(fontSize: 12.sp, textColor: whiteColor),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _squareBtn(icon: Icons.remove, onTap: () => v.qty.value = (v.qty.value - 1).clamp(0, 999)),
                        Container(
                          width: 32.w,
                          height: 32.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colorPrimary.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: colorPrimary),
                          ),
                          child: Text(
                            '${v.qty.value}',
                            style: openSansBold(fontSize: 12.sp, textColor: color00394D),
                          ),
                        ),
                        _squareBtn(icon: Icons.add, onTap: () => v.qty.value += 1),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _squareBtn({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: colorPrimary),
        ),
        child: Icon(icon, size: 16.sp, color: color00394D),
      ),
    );
  }
}
