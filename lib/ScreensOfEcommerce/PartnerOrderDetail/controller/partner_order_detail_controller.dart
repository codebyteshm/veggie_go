import 'package:get/get.dart';

class PartnerOrderDetailController extends GetxController {
  // Order Information
  var orderId = 'ORD-2025-00001'.obs;
  var orderDate = 'Jan 15, 2025 • 2:30 PM'.obs;
  var paymentStatus = 'Paid'.obs;
  var orderStatus = 'Processing'.obs;
  
  // Customer Information
  var customerName = 'Rahul Sharma'.obs;
  var customerPhone = '+91 98765 43210'.obs;
  var deliveryAddress = 'Flat 302, Building A-1 Sector 62, Noida\nUttar Pradesh - 201301'.obs;
  
  // Order Items
  var orderItems = <OrderItem>[].obs;
  
  // Bill Summary
  var subTotal = 195.0.obs;
  var handlingCharge = 0.0.obs;
  var deliveryCharge = 0.0.obs;
  var grandTotal = 205.0.obs;
  
  // Order Progress
  var currentStep = 1.obs; // 0: Start, 1: Processing, 2: Payment, 3: Completed
  var isOnHold = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadOrderDetails();
  }
  
  void loadOrderDetails() {
    // Sample order items matching the image
    orderItems.value = [
      OrderItem(
        name: 'Fresh Tomatoes',
        quantity: '2 x ₹40',
        price: 80,
        image: 'assets/png_image/orange.png',
      ),
      OrderItem(
        name: 'Green Onions',
        quantity: '1 x ₹25',
        price: 25,
        image: 'assets/png_image/orange.png',
      ),
      OrderItem(
        name: 'Carrots',
        quantity: '3 x ₹30',
        price: 90,
        image: 'assets/png_image/orange.png',
      ),
    ];
  }
  
  void goToPayment() {
    // Navigate to payment screen
    print('Navigating to payment');
  }
  
  void cancelOrder() {
    // Cancel order logic
    print('Cancelling order');
  }
  
  void updateOrderStatus(String status) {
    orderStatus.value = status;
  }
  
  void moveToNextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }
  
  void toggleHoldStatus() {
    isOnHold.value = !isOnHold.value;
  }
}

class OrderItem {
  final String name;
  final String quantity;
  final double price;
  final String image;
  
  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });
}