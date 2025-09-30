import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  // Wallet balance
  final balance = 1245.50.obs;
  
  // Monthly change percentage
  final monthlyChange = 12.5.obs;
  
  // Weekly spending
  final weeklySpending = 245.50.obs;
  
  // Transaction count
  final transactionCount = 24.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize controller
    fetchWalletData();
  }
  
  // Fetch wallet data from API or local storage
  void fetchWalletData() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Update data
    // balance.value = ...
    // monthlyChange.value = ...
    // weeklySpending.value = ...
    // transactionCount.value = ...
  }
  
  // Add money to wallet
  Future<bool> addMoney(double amount) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Update balance
      balance.value += amount;
      return true;
    } catch (e) {
      return false;
    }
  }
  
  // Get recent transactions
  List<Map<String, dynamic>> getRecentTransactions() {
    // In a real app, this would come from an API or database
    return [
      {
        'title': 'Grocery Store',
        'date': 'Today, 10:30 AM',
        'amount': -45.99,
        'isCredit': false,
        'icon': Icons.shopping_bag_outlined,
      },
      {
        'title': 'Wallet Top-up',
        'date': 'Yesterday, 3:15 PM',
        'amount': 100.00,
        'isCredit': true,
        'icon': Icons.account_balance_wallet_outlined,
      },
      {
        'title': 'Restaurant',
        'date': 'Yesterday, 1:45 PM',
        'amount': -28.50,
        'isCredit': false,
        'icon': Icons.restaurant_outlined,
      },
    ];
  }
}
