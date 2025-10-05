import 'package:get/get.dart';

class ReferralCoinsController extends GetxController {
  final RxInt coins = 500.obs;

  List<Map<String, dynamic>> get history => [
        {'title': 'Referral Bonus', 'date': 'Dec 13, 2024', 'coins': 100},
        {'title': 'Referral Bonus', 'date': 'Dec 10, 2024', 'coins': 100},
        {'title': 'Referral Bonus', 'date': 'Dec 8, 2024', 'coins': -100},
        {'title': 'Referral Bonus', 'date': 'Dec 5, 2024', 'coins': 100},
      ];
}