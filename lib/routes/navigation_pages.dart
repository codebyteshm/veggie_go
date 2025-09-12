import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/binding/login_binding.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/view/login_screen.dart';
import 'package:e_commerce46/ScreensOfEcommerce/SplashScreen/splash_screen.dart';
import 'package:e_commerce46/routes/routes_strings.dart' show RoutesConstants;
import 'package:get/get_navigation/src/routes/get_route.dart';

class GetPages {
  static List<GetPage> getPages = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesConstants.loginView,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
//     GetPage(
//       name: RoutesConstants.createAccountStep1View,
//       page: () => CreateAccountStep1View(),
//       binding: CreateAccountStep1Binding(),
//     ),
//     GetPage(
//       name: RoutesConstants.createAccountStep2View,
//       page: () => CreateAccountStep2View(),
//       binding: CreateAccountStep2Binding(),
//     ),
//     GetPage(
//       name: RoutesConstants.getStartView,
//       page: () => GetStartView(),
//       binding: GetStartBinding(),
//     ),
//     // GetPage(
//     //   name: RoutesConstants.homeView ,
//     //   page: () =>  HomeView(),
//     //   binding: HomeBinding(),
//     // ),
//     GetPage(
//       name: RoutesConstants.searchProductView,
//       page: () => SearchProductView(),
//       binding: SearchProductBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.otpVerificationView,
//       page: () => OtpVerificationView(),
//       binding: OtpVerificationBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.mainScreen,
//       page: () => MainScreen(),
//       binding: BottomTabBarBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.forgotPasswordView,
//       page: () => ForgotPasswordView(),
//       binding: ForgotPasswordBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.productDetailsView,
//       page: () => ProductDetailsView(),
//       binding: ProductDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.viewAllProductView,
//       page: () => ViewAllProductView(),
//       binding: ViewAllProductBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.popularBrandAllView,
//       page: () => PopularBrandAllView(),
//       binding: PopularBrandAllBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.imagePreview,
//       page: () => ImagePreviewScreen(),
//       binding: ChatDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.sellerDetailView,
//       page: () => SellerDetailView(),
//       binding: SellerDetailBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.notificationView,
//       page: () => NotificationView(),
//       binding: NotificationBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.viewAllCategoriesView,
//       page: () => ViewAllCategoriesView(),
//       binding: ViewAllCategoriesBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.subCategoriesView,
//       page: () => SubCategoriesView(),
//       binding: SubCategoriesBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.viewAllProductByCountryView,
//       page: () => ViewAllProductByCountryView(),
//       binding: ViewAllProductByCountryBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.viewCountryProductListView,
//       page: () => ViewCountryProductListView(),
//       binding: ViewCountryProductListBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.orderDetailsView,
//       page: () => OrderDetailsView(),
//       binding: OrderDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.myProfileView,
//       page: () => MyProfileView(),
//       binding: MyProfileBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.rFQMarketPlaceView,
//       page: () => RFQMarketPlaceView(),
//       binding: RFQMarketPlaceBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.rFQProductDetailsView,
//       page: () => RFQProductDetailsView(),
//       binding: RFQProductDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.myRequestView,
//       page: () => MyRequestView(),
//       binding: MyRequestBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.createRequestView,
//       page: () => CreateRequestView(),
//       binding: CreateRequestBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.submitQuoteView,
//       page: () => SubmitQuoteView(),
//       binding: SubmitQuoteBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.quoteProductDetailsView,
//       page: () => QuoteProductDetailsView(),
//       binding: QuoteProductDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.quoteRequestView,
//       page: () => QuoteRequestView(),
//       binding: QuoteRequestBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.settingView,
//       page: () => SettingView(),
//       binding: SettingBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.chatDetailsView,
//       page: () => ChatDetailsView(),
//       binding: ChatDetailsBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.chatSupportView,
//       page: () => ChatSupportView(),
//       binding: ChatSupportBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.addressView,
//       page: () => AddressView(),
//       binding: AddressBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.changePasswordView,
//       page: () => ChangePasswordView(),
//       binding: ChangePasswordBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.privacyPolicyView,
//       page: () => PrivacyPolicyView(),
//       binding: PrivacyPolicyBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.faqView,
//       page: () => FaqView(),
//       binding: FaqBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.helpAndSupportView,
//       page: () => HelpAndSupportView(),
//       binding: HelpAndSupportBinding(),
//     ),
//     GetPage(
//       name: RoutesConstants.resetPasswordView,
//       page: () => ResetPasswordView(),
//       binding: ResetPasswordBinding(),
//     ),
  ];
}
