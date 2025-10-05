import 'package:get/get.dart';

class TrackStatus {
  TrackStatus({required this.title, required this.subtitle, required this.state});
  final String title; // e.g. Order Placed
  final String subtitle; // e.g. Today, 2:15 PM or Pending
  final StatusState state;
}

enum StatusState { completed, active, pending }

class TrackOrderController extends GetxController {
  final RxList<TrackStatus> statuses = <TrackStatus>[
    TrackStatus(title: 'Order Placed', subtitle: 'Today, 2:15 PM', state: StatusState.completed),
    TrackStatus(title: 'Preparing Order', subtitle: 'In progress...', state: StatusState.active),
    TrackStatus(title: 'On The way', subtitle: 'Pending', state: StatusState.pending),
    TrackStatus(title: 'Out for Delivery', subtitle: 'Pending', state: StatusState.pending),
    TrackStatus(title: 'Delivered', subtitle: 'Pending', state: StatusState.pending),
  ].obs;

  final RxString orderId = '#123456'.obs;
  final RxString customerName = 'Rajesh Kumar'.obs;
  final RxString customerPhone = '+91 98765 43210'.obs;
  final RxString addressLine =
      'Apartment 4B, Green Valley Society, Sector 18, Gurgaon - 122001'.obs;
  final RxString expectedDelivery = '14 mins'.obs;

  final RxString deliveryExecutive = 'Rajesh Kumar'.obs;
}