// import 'dart:convert';
//
// import 'package:bigtrader/ScreensOfEcommerce/Categories/categories/controller/categories_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/Address/controller/address_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/chat_details/controller/chat_detail_request_model.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/chat_details/controller/chat_details_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/chat_support/controller/chat_support_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/my_request/controller/my_request_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/Drawer/submit_quote/controller/submit_quote_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/home/home/controller/home_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/home/notification/controller/notification_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/my_cart/controller/my_cart_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/my_order/controller/my_order_controller.dart';
// import 'package:bigtrader/ScreensOfEcommerce/my_order_details/controller/my_order_details_controller.dart';
// import 'package:bigtrader/model/push_seller_response.dart';
// import 'package:bigtrader/routes/routes_strings.dart';
// import 'package:bigtrader/utils/key.dart';
// import 'package:bigtrader/utils/shared_preference_util.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// import '../ScreensOfEcommerce/bottom_tabBar/controller/bottom_tabBar_controller.dart';
//
// ///background notification handler..
// Future<dynamic> firebaseMessagingBackgroundHandler(
//     RemoteMessage message) async {
//   await Firebase.initializeApp();
//
//   if (kDebugMode) {
//     print('Message: ${message.data}');
//   }
//   if (message.notification != null) {}
//   return;
// }
//
// PushSellerDetailsResponse? pushSellerDetailsResponse;
//
// /// Handle the clicked notification.
// Future<void> handleNotification(Map<String, dynamic> data,
//     {bool delay = false}) async {
//   // threadId = int.parse(data['object_id']);
//
//   print("handle push");
//   // print(data);
//   // AppUtils.instance.push(
//   //     enterPage: VehicleDetailPage(
//   //       isFromNotification: true,
//   //       objectId: int.parse(data['object_id']),
//   //     ));
// }
//
// class PushNotificationService {
//   dynamic message;
//
//   // It is assumed that all messages contain a data field with the key 'type'
//   Future<void> setupInteractedMessage() async {
//     await Firebase.initializeApp();
//
//     // This function is called when the app is in the background and user clicks on the notification
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       this.message = message.data;
//       print("successfully handle");
//       handleNotification(message.data);
//     });
//
//     /*SchedulerBinding.instance.addPostFrameCallback(
//       (_) async {
//         await FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//           // this.message = message?.data;
//           if (message?.data.isNotEmpty ?? false) {
//             // Future.delayed(const Duration(seconds: 1)).then((value) => Get.to(() => SplashPage(remoteMessage: message)));
//             Future.delayed(const Duration(milliseconds: 900)).then((value) => handleNotification(message!.data));
//           }
//         });
//         */ /* // message ??= await FirebaseMessaging.instance.getInitialMessage();
//         debugPrint('PushNotification: addPostFrameCallback');
//         // handleNotification(message!.data);
//         Future.delayed(const Duration(seconds: 1)).then((value) => Get.to(const SignUpPage()));*/ /*
//       },
//     );*/
//
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message?.data.isNotEmpty ?? false) {
//         Future.delayed(const Duration(seconds: 1))
//             .then((value) => handleNotification(message!.data));
//       }
//     });
//
//     FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: false,
//       sound: true,
//     );
//     await registerNotificationListeners();
//   }
//
//   registerNotificationListeners() async {
//     AndroidNotificationChannel channel = androidNotificationChannel();
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//     var androidSettings =
//         const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOSSettings = const IOSInitializationSettings(
//       requestSoundPermission: false,
//       requestAlertPermission: false,
//     );
//     var initSettings =
//         InitializationSettings(android: androidSettings, iOS: iOSSettings);
//     flutterLocalNotificationsPlugin.initialize(initSettings,
//         onSelectNotification: onSelectNotification);
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
//       RemoteNotification? notification = message!.notification;
//       AndroidNotification? android = message.notification?.android;
//       print(notification?.title);
//       print(notification?.body);
//       if (message.data.isNotEmpty) {
//         pushSellerDetailsResponse = PushSellerDetailsResponse.fromJson(
//             jsonDecode(message.data['extra']));
//         print(pushSellerDetailsResponse?.firstName);
//         this.message = message.data;
//         if (Get.currentRoute == '/AddressView') {
//           AddressController controller = Get.find<AddressController>();
//           controller.getAddressAPI();
//         } else if (Get.currentRoute == '/ChatDetailsView') {
//           ChatDetailsController controller = Get.find<ChatDetailsController>();
//           if (controller.data[2] == message.data['object_id']) {
//             controller.chatDetailApi(
//                 chatDetailRequestModel: ChatDetailRequestModel(
//                     slug: message.data['object_type'],
//                     chatId: int.parse(message.data['object_id'])));
//           }
//         } else if (Get.currentRoute == '/ChatSupportView') {
//           ChatSupportController controller = Get.find<ChatSupportController>();
//           controller.rfqChatListApi();
//           controller.enquiryChatListApi();
//         } else if (Get.currentRoute == '/notificationView') {
//           NotificationController controller =
//               Get.find<NotificationController>();
//           controller.getNotificationList();
//         } else if (Get.currentRoute == '/MyRequestView') {
//           MyRequestController controller = Get.find<MyRequestController>();
//           controller.enquiryListApi();
//           controller.rfqListApi();
//         }
//         /*var dataJson = message.data;
//         if (isAdminChatScreenOpen) {
//           if (dataJson['push_type'] == '1') {
//             FBroadcast.instance()
//                 .broadcast("message_received", value: message.data);
//             return;
//           }
//         }*/
//
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification?.title,
//             notification?.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channelDescription: channel.description,
//                 icon: android?.smallIcon,
//                 playSound: true,
//               ),
//             ),
//             payload: jsonEncode(message.data));
//       }
//     });
//   }
//
//   androidNotificationChannel() => const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description: 'This channel is used for important notifications.',
//         // description
//         importance: Importance.max,
//       );
//
//   Future onSelectNotification(String? data) async {
//     if (message != null) {
//       // Map<String, dynamic> data = jsonDecode(payload.toString());
//       handleNotification(message);
//     }
//   }
//
//   /// Handle the clicked notification.
//   Future<void> handleNotification(Map<String, dynamic> data,
//       {bool delay = false}) async {
//     message = data;
//     switch (message['push_type']) {
//       case '1': // address verify
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<AddressController>();
//           Get.lazyPut<AddressController>(() => AddressController());
//           Get.toNamed(RoutesConstants.addressView,
//               arguments: ["Ecommerce", true, true, false]);
//         } else {
//           SharedPreferenceUtil.putBool(nAddress, true);
//         }
//
//         break;
//       case '2': // enquiry verify
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<MyRequestController>();
//           Get.lazyPut<MyRequestController>(() => MyRequestController());
//           Get.toNamed(RoutesConstants.myRequestView,
//               arguments: [true, 0, 1, false, false]);
//         } else {
//           SharedPreferenceUtil.putBool(nEnquiry, true);
//         }
//
//         break;
//       case '3': //enquiry reject
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<MyRequestController>();
//           Get.lazyPut<MyRequestController>(() => MyRequestController());
//           Get.toNamed(RoutesConstants.myRequestView,
//               arguments: [true, 0, 1, false, false]);
//         } else {
//           SharedPreferenceUtil.putBool(nEnquiry, true);
//         }
//
//         break;
//       case '4': //RFQ verify
//         SharedPreferenceUtil.putString(
//             nRfqObjectId, message['object_id'].toString());
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<SubmitQuoteController>();
//           Get.lazyPut<SubmitQuoteController>(() => SubmitQuoteController());
//           Get.toNamed(
//             RoutesConstants.submitQuoteView,
//             arguments: [message['object_id'].toString() ?? "", 1],
//           );
//         } else {
//           SharedPreferenceUtil.putBool(nRfq, true);
//         }
//
//         break;
//       case '5': //RFQ reject
//         SharedPreferenceUtil.putString(
//             nRfqObjectId, message['object_id'].toString());
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<SubmitQuoteController>();
//           Get.lazyPut<SubmitQuoteController>(() => SubmitQuoteController());
//           Get.toNamed(
//             RoutesConstants.submitQuoteView,
//             arguments: [message['object_id'].toString() ?? "", 1],
//           );
//         } else {
//           SharedPreferenceUtil.putBool(nRfq, true);
//         }
//
//         break;
//       // case '6': // order place
//       //   SharedPreferenceUtil.putString(
//       //       nOrderObjectId, message['object_id'].toString());
//       //
//       //   if (SharedPreferenceUtil.getBool(nCommonClick)) {
//       //     Get.delete<OrderDetailsController>();
//       //     Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
//       //     Get.offAllNamed(
//       //       RoutesConstants.orderDetailsView,
//       //       arguments: [
//       //         SharedPreferenceUtil.getString(nOrderObjectId).toString(),
//       //         1
//       //       ],
//       //     );
//       //   } else {
//       //     SharedPreferenceUtil.putBool(nOrder, true);
//       //   }
//       //
//       //   break;
//       case '7': //address reject
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<AddressController>();
//           Get.lazyPut<AddressController>(() => AddressController());
//           Get.toNamed(RoutesConstants.addressView,
//               arguments: ["Ecommerce", true, true, false]);
//         } else {
//           SharedPreferenceUtil.putBool(nAddress, true);
//         }
//
//         break;
//       case '8': // order status
//         SharedPreferenceUtil.putString(
//             nOrderObjectId, message['object_id'].toString());
//
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           Get.delete<OrderDetailsController>();
//           Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
//           Get.offAllNamed(
//             RoutesConstants.orderDetailsView,
//             arguments: [
//               SharedPreferenceUtil.getString(nOrderObjectId).toString(),
//               1
//             ],
//           );
//         } else {
//           SharedPreferenceUtil.putBool(nOrder, true);
//         }
//
//         break;
//       case '9': // RFQ message
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           if (Get.currentRoute == '/ChatDetailsView') {
//             ChatDetailsController controller =
//                 Get.find<ChatDetailsController>();
//             controller.profile.value =
//                 pushSellerDetailsResponse?.file?.slug ?? '';
//             controller.fullName.value =
//                 "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}";
//             controller.chatDetailApi(
//                 chatDetailRequestModel: ChatDetailRequestModel(
//                     slug: message['object_type'],
//                     chatId: int.parse(message['object_id'])));
//           } else {
//             pushSellerDetailsResponse = PushSellerDetailsResponse.fromJson(
//                 jsonDecode(message['extra']));
//             Get.delete<ChatDetailsController>();
//             Get.lazyPut<ChatDetailsController>(() => ChatDetailsController());
//             Get.toNamed(RoutesConstants.chatDetailsView, arguments: [
//               pushSellerDetailsResponse?.file?.slug ?? '',
//               "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}",
//               int.parse(message['object_id']),
//               pushSellerDetailsResponse?.id,
//               "RFQ_request",
//               false
//             ]);
//           }
//         } else {
//           print("App not Open");
//           pushSellerDetailsResponse = PushSellerDetailsResponse.fromJson(
//               jsonDecode(message['extra']));
//           SharedPreferenceUtil.putBool(nChat, true);
//           SharedPreferenceUtil.putString(
//             nChatProfile,
//             pushSellerDetailsResponse?.file?.slug ?? '',
//           );
//           SharedPreferenceUtil.putString(
//             nChatName,
//             "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}",
//           );
//           SharedPreferenceUtil.putInt(
//             nChatId,
//             int.parse(message['object_id']),
//           );
//           SharedPreferenceUtil.putInt(
//             nChatUserId,
//             pushSellerDetailsResponse?.id ?? 0,
//           );
//           SharedPreferenceUtil.putString(nChatType, message['object_type']);
//         }
//
//         break;
//       case '101': // Enquiry message
//         if (SharedPreferenceUtil.getBool(nCommonClick)) {
//           if (Get.currentRoute == '/ChatDetailsView') {
//             ChatDetailsController controller =
//                 Get.find<ChatDetailsController>();
//             controller.profile.value =
//                 pushSellerDetailsResponse?.file?.slug ?? '';
//             controller.fullName.value =
//                 "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}";
//             controller.chatDetailApi(
//                 chatDetailRequestModel: ChatDetailRequestModel(
//                     slug: message['object_type'],
//                     chatId: int.parse(message['object_id'])));
//           } else {
//             pushSellerDetailsResponse = PushSellerDetailsResponse.fromJson(
//                 jsonDecode(message['extra']));
//             Get.delete<ChatDetailsController>();
//             Get.lazyPut<ChatDetailsController>(() => ChatDetailsController());
//             Get.toNamed(RoutesConstants.chatDetailsView, arguments: [
//               pushSellerDetailsResponse?.file?.slug ?? '',
//               "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}",
//               int.parse(message['object_id']),
//               pushSellerDetailsResponse?.id,
//               "enquiry",
//               false
//             ]);
//           }
//         }
//         else {
//           print("App not Open");
//           pushSellerDetailsResponse = PushSellerDetailsResponse.fromJson(
//               jsonDecode(message['extra']));
//           SharedPreferenceUtil.putBool(nChat, true);
//           SharedPreferenceUtil.putString(
//             nChatProfile,
//             pushSellerDetailsResponse?.file?.slug ?? '',
//           );
//           SharedPreferenceUtil.putString(
//             nChatName,
//             "${pushSellerDetailsResponse?.firstName}${pushSellerDetailsResponse?.lastName}",
//           );
//           SharedPreferenceUtil.putInt(
//             nChatId,
//             int.parse(message['object_id']),
//           );
//           SharedPreferenceUtil.putInt(
//             nChatUserId,
//             pushSellerDetailsResponse?.id ?? 0,
//           );
//           SharedPreferenceUtil.putString(nChatType, message['object_type']);
//         }
//
//         break;
//       default:
//     }
//     // SlideLeftRoute(page: VehicleDetailPage());
//     print("handle");
//   }
// }
