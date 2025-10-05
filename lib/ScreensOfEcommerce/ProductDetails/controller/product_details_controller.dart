import 'package:e_commerce46/Common/image.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final RxInt quantity = 0.obs;
  final RxInt selectedVariantIndex = 2.obs; // Default to 1 kg
  final List<String> variants = const ['100 gm', '500 gm', '1 kg', '3 kg', '4 kg', '5 kg', '6 kg'];
  final RxInt currentImageIndex = 0.obs;
  final List<String> productImages = [
    PNGImages.orange,
    PNGImages.orange,
    PNGImages.orange,
    PNGImages.orange,
  ];

  void selectVariant(int index) {
    selectedVariantIndex.value = index;
  }

  void addToCart() {
    quantity.value = 1;
  }

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  void onImageChanged(int index) {
    currentImageIndex.value = index;
  }
}