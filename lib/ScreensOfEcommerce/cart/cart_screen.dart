import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      id: 'o1',
      name: 'Orange - Fresh & Juicy',
      imagePath: 'assets/orange.png',
      unit: '1 kg',
      price: 120,
      quantity: 2,
    ),
    CartItem(
      id: 'b1',
      name: 'Banana - Premium',
      imagePath: 'assets/banana.png',
      unit: '500 gm',
      price: 60,
      quantity: 1,
    ),
  ];

  double get _subtotal {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get _totalPayable {
    return _subtotal;
  }

  void _incrementQuantity(String productId) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.id == productId);
      if (index >= 0) {
        _cartItems[index].quantity++;
      }
    });
  }

  void _decrementQuantity(String productId) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.id == productId);
      if (index >= 0 && _cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      ..._cartItems.map((item) => _CartItemCard(
                        item: item,
                        onIncrement: () => _incrementQuantity(item.id),
                        onDecrement: () => _decrementQuantity(item.id),
                      )).toList(),
                      const SizedBox(height: 16),
                      _buildPriceDetails(context, _subtotal),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
              _buildCheckoutButton(context, _totalPayable),
            ],
    ));
  }

  Widget _buildPriceDetails(BuildContext context, double subtotal) {
    const deliveryCharges = 0.0;
    const handlingCharges = 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _buildPriceRow('Subtotal', '₹${subtotal.toStringAsFixed(2)}', isTotal: false),
          _buildPriceRow('Delivery Charges', '₹${deliveryCharges == 0 ? 'Free' : deliveryCharges.toStringAsFixed(2)}', isFree: deliveryCharges == 0),
          _buildPriceRow('Handling Charges', '₹${handlingCharges == 0 ? 'Free' : handlingCharges.toStringAsFixed(2)}', isFree: handlingCharges == 0),
          const Divider(height: 20, thickness: 1),
          _buildPriceRow('Total Payable', '₹${subtotal.toStringAsFixed(2)}', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false, bool isFree = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isFree ? Colors.green[700] : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context, double total) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7C9C4E),
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Proceed to Address Selection',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemCard({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200], // Placeholder for image
                // image: DecorationImage(
                //   image: AssetImage(item.imagePath),
                //   fit: BoxFit.cover,
                // ),
              ),
              // Replace with actual image widget if assets are available
              child: const Center(child: Icon(Icons.shopping_bag_outlined, color: Colors.grey)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(item.unit, style: const TextStyle(color: Colors.grey)),
                  Text(
                    '₹${item.price.toStringAsFixed(0)} x ${item.quantity} = ₹${(item.price * item.quantity).toStringAsFixed(0)}',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            _buildQuantitySelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, size: 20, color: Colors.grey),
            onPressed: onDecrement,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '${item.quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, size: 20),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String id;
  final String name;
  final String imagePath;
  final String unit;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.unit,
    required this.price,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      imagePath: imagePath,
      unit: unit,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}