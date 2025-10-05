import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/binding/login_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/view/login_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/create_account_step1/binding/create_account_step1_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/create_account_step1/view/create_account_step1_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/binding/bottom_tab_bar_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/view/bottom_tab_bar_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/otpVerification/binding/otpVerification_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/otpVerification/view/otpVerification_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/OrderSuccess/binding/order_success_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/OrderSuccess/view/order_success_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Profile/binding/profile_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Profile/view/profile_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/SplashScreen/splash_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/ProductDetails/binding/product_details_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/ProductDetails/view/product_details_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/cart/cart_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/cart/binding/cart_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/address/address_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/address/binding/address_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/payment/payment_method_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/payment/binding/payment_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/TrackOrder/track_order_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/TrackOrder/binding/track_order_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/CancelOrder/cancel_confirm_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/CancelOrder/cancel_reason_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/CancelOrder/binding/cancel_order_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/view/add_money_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/view/referral_coins_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/view/invite_friend_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/view/transactions_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/binding/add_money_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Wallet/binding/referral_coins_binding.dart';
import 'package:e_commerce46/routes/routes_strings.dart' show RoutesConstants;
import 'package:get/get_navigation/src/routes/get_route.dart';

class GetPages {
  static List<GetPage> getPages = [
    GetPage(name: RoutesConstants.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RoutesConstants.loginView, page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: RoutesConstants.createAccountStep1View, page: () => CreateAccountStep1View(), binding: CreateAccountStep1Binding()),
    GetPage(name: RoutesConstants.mainScreen, page: () => const BottomTabBarScreen(), binding: BottomTabBarBinding()),

    // Profile & Account
    GetPage(name: RoutesConstants.profile, page: () => const ProfileScreen(), binding: ProfileBinding()),

    GetPage(name: RoutesConstants.otpVerificationView, page: () => OtpVerificationView(), binding: OtpVerificationBinding()),
    // Product Details
    GetPage(name: RoutesConstants.productDetailsView, page: () => const ProductDetailsScreen(), binding: ProductDetailsBinding()),
    // Cart
    GetPage(name: RoutesConstants.cartView, page: () => const CartScreen(), binding: CartBinding()),
    // Address
    GetPage(name: RoutesConstants.addressView, page: () => const DeliveryAddressScreen(), binding: AddressBinding()),
    // Payment
    GetPage(name: RoutesConstants.paymentMethodView, page: () => const PaymentMethodScreen(), binding: PaymentBinding()),
    // Track Order
    GetPage(name: RoutesConstants.trackOrderView, page: () => const TrackOrderScreen(), binding: TrackOrderBinding()),
    // Cancel Order Flow
    GetPage(name: RoutesConstants.cancelConfirmView, page: () => const CancelConfirmScreen(), binding: CancelOrderBinding()),
    GetPage(name: RoutesConstants.cancelReasonView, page: () => const CancelReasonScreen(), binding: CancelOrderBinding()),
    // Wallet
    GetPage(name: RoutesConstants.addMoneyView, page: () => const AddMoneyScreen(), binding: AddMoneyBinding()),
    GetPage(name: RoutesConstants.referralCoinsView, page: () => const ReferralCoinsScreen(), binding: ReferralCoinsBinding()),
    GetPage(name: RoutesConstants.inviteFriendView, page: () => const InviteFriendScreen()),
    GetPage(name: RoutesConstants.transactionsView, page: () => const TransactionsScreen()),
    // Order Success
    GetPage(name: RoutesConstants.orderSuccessView, page: () => const OrderSuccessScreen(), binding: OrderSuccessBinding()),
  ];
}
