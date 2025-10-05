import 'package:get/get.dart';

class DeliveryAddress {
  DeliveryAddress({
    required this.name,
    required this.label,
    required this.addressLine,
    required this.pinCode,
    this.isSelected = false,
  });

  String name;
  String label; // Home / Office / Shop
  String addressLine;
  String pinCode;
  bool isSelected;
}

class AddressController extends GetxController {
  final RxList<DeliveryAddress> addresses = <DeliveryAddress>[
    DeliveryAddress(
      name: 'Rajesh Kumar',
      label: 'Home',
      addressLine: 'Flat 301, Green Valley Apartments\nSector 18, Noida Uttar Pradesh - 201301',
      pinCode: '201301',
      isSelected: true,
    ),
    DeliveryAddress(
      name: 'Rajesh Kumar',
      label: 'Office',
      addressLine: 'Tower B, 5th Floor Cyber City, Gurgaon\nHaryana - 122002',
      pinCode: '122002',
      isSelected: false,
    ),
  ].obs;

  int get selectedIndex => addresses.indexWhere((a) => a.isSelected);

  void selectAddress(int index) {
    for (var i = 0; i < addresses.length; i++) {
      addresses[i].isSelected = i == index;
    }
    addresses.refresh();
  }

  void addAddress(DeliveryAddress address) {
    // Newly added address becomes selected
    for (final a in addresses) {
      a.isSelected = false;
    }
    addresses.add(address..isSelected = true);
    addresses.refresh();
  }

  void editAddress(int index, DeliveryAddress updated) {
    final wasSelected = addresses[index].isSelected;
    addresses[index] = updated..isSelected = wasSelected;
    addresses.refresh();
  }

  void removeAddress(int index) {
    final removingSelected = addresses[index].isSelected;
    addresses.removeAt(index);
    if (removingSelected && addresses.isNotEmpty) {
      addresses[0].isSelected = true;
    }
    addresses.refresh();
  }
}