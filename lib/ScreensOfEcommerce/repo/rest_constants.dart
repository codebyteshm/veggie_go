class RestConstants {
  static const String baseUrl = 'https://api.veggigo.com/api';

  ///Auth & profile flow
  static const String loginUrl = '/users/send-otp';
  static const String logout = '/users/logout';
  static const String uploadImageUrl = '/upload/image';
  static const String verifyOtp = '/users/verify-otp';
  static const String refreshToken = 'users/refresh-token';

  ///Home
  static const String homeUrl = '/home';

  ///Order
  static const String getMyOrderUrl = '/orders/my-orders';
}
