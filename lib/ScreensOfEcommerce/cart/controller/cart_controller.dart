import 'package:e_commerce46/Common/image.dart';
import 'package:get/get.dart';

class CartEntry {
  final String id;
  final String name;
  final String imagePath;
  final String unit;
  final double price;
  final RxInt quantity;

  CartEntry({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.unit,
    required this.price,
    int qty = 1,
  }) : quantity = qty.obs;
}

class CartController extends GetxController {
  // Demo data to match current UI preview
  final RxList<CartEntry> items = <CartEntry>[
    CartEntry(id: 'o1', name: 'Orange - Fresh & Juicy', imagePath: PNGImages.orange, unit: '1 kg', price: 120, qty: 2),
    CartEntry(id: 'b1', name: 'Banana - Premium', imagePath: PNGImages.dummy, unit: '500 gm', price: 60, qty: 1),
  ].obs;

  double get subtotal => items.fold(0.0, (sum, e) => sum + (e.price * e.quantity.value));
  double get totalPayable => subtotal; // Delivery & handling are free in design

  void increment(String id) {
    final idx = items.indexWhere((e) => e.id == id);
    if (idx >= 0) {
      items[idx].quantity.value++;
      items.refresh();
    }
  }

  void decrement(String id) {
    final idx = items.indexWhere((e) => e.id == id);
    if (idx >= 0 && items[idx].quantity.value > 1) {
      items[idx].quantity.value--;
      items.refresh();
    }
  }

  void addItem(CartEntry entry) {
    items.add(entry);
  }

  void removeItem(String id) {
    items.removeWhere((e) => e.id == id);
  }

  void clear() {
    items.clear();
  }
}