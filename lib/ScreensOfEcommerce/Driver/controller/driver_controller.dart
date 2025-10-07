import 'package:get/get.dart';

class DriverController extends GetxController {
  var activatedOrders = 3.obs;
  var pendingOrders = 1.obs;
  var completedOrders = 12.obs;
  
  var assignedOrders = <OrderAssignment>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadAssignedOrders();
  }
  
  void loadAssignedOrders() {
    assignedOrders.value = [
      OrderAssignment(
        customerName: 'Sarah Johnson',
        address: '123 Oak Street, Apt 4B\nDowntown, City Center',
        orderId: '#DL2024001',
        phone: '+1 234-567-8900',
        amount: '₹250',
        isPaid: true,
      ),
      OrderAssignment(
        customerName: 'Sarah Johnson',
        address: '123 Oak Street, Apt 4B\nDowntown, City Center',
        orderId: '#DL2024001',
        phone: '+1 234-567-8900',
        amount: '₹250',
        isPaid: false,
      ),
    ];
  }
  
  void startDelivery(OrderAssignment order) {
    Get.snackbar(
      'Delivery Started',
      'Navigation started for ${order.customerName}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void callCustomer(String phone) {
    Get.snackbar(
      'Calling Customer',
      'Calling $phone',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
  
  void viewAllOrders() {
    Get.snackbar(
      'View All',
      'Opening all orders view',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class OrderAssignment {
  final String customerName;
  final String address;
  final String orderId;
  final String phone;
  final String amount;
  final bool isPaid;
  
  OrderAssignment({
    required this.customerName,
    required this.address,
    required this.orderId,
    required this.phone,
    required this.amount,
    required this.isPaid,
  });
}