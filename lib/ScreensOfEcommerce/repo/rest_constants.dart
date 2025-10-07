class RestConstants {
  static const String baseUrl = 'https://api.veggigo.com/api';

  static const String loginUrl = '/users/authenticate';
  static const String versionCheckerUrl = 'seller/version_checker';
  static const String mobileNUmberCheck = 'seller/check_phone_nub';
  static const String docUpload = 'document/upload';
  static const String docUploadS3 = 'document/upload2Tos3';
  static const String generalDropdown = 'seller/general_dropdown';
  static const String registerBuyerUser = '/users/registerUser';
  static const String registerSellerUser = 'seller/sellerRegister';
  static const String verifyOtp = '/users/verifyOtp';
  static const String forGot = '/users/forgot-password';
  static const String searchProductLstApi = 'product/product_list?';
  static const String productDetailsByID =
      'product/product_details?product_id=';
  static const String orderDetailsByID =
      'order/order-details?id=';
  static const String getAllBanners = 'banners/getAllBanners';
  static const String homeApi = 'product/home_api?';
  static const String faq = 'faq/getFaq';
  static const String getAddress = 'address/get_address';
  static const String deleteAddress = 'address/delete_address';
  static const String addAddress = 'address/add_address';
  static const String updateAddress = 'address/update_address';
  static const String getSubCategory = 'category/get-sub-category-byId?';
  static const String getChildCategory = 'category/get-child-category-byId?';
  static const String logout = 'seller/logout';
  static const String deleteUserAccount = 'seller/delete';
  static const String review = 'review/get-reviews?';
  static const String similarProduct = 'product/similar_product_list?';
  static const String reviewWrite = 'review/product-review';
  static const String getCart = 'order/get-cart';
  static const String addToCart = 'order/Add-to-cart';
  static const String removeCart = 'order/remove-to-cart';
  static const String addDeliveryInstructions =
      'order/add-delivery-instruction';
  static const String confirmOrder = 'order/confirm-order';
  static const String getOrder = 'order/get-order';
  static const String rfProductDetails =
      'rfq_request/rfq-detail-with-quote?rfq_id=';
  static const String rfqQuoteDetails = 'rfq_request/quote-detail?quote_id=';
  static const String rfqMarketPlaceDetails =
      'rfq_request/get_rfq_product_detail?rfq_id=';
  static const String rfqDetails = 'rfq_request/rfq-detail?rfq_id=';
  static const String notificationList =
      'notifications/getNotifications?user_id=';
  static const String refreshToken = 'users/refresh-token';
  static const String resetPassword = '/users/reset-password';
  static const String changePassword = 'seller/change-password';
  static const String uploadProfile = 'document/upload_profile';

  ///Chat api url
  static const String sendMessage = 'chat/send_message';
  static const String chatDetailUrl = 'chat/chat_detail?';

  static const String helpAndSupport = 'users/help-support';
  static const String negotiateWithSeller = 'enquiry/negotiate-with-seller';
  static const String onPressNegotiateUrl = 'enquiry/negotiate';
  static const String onPressNegotiateUrlRfq = 'rfq_request/negotiate-with-seller';
  static const String terms = 'contents/getContents?';
  static const String myEnquiryList = 'enquiry/my_enquiry_list';
  static const String myRFQList = 'rfq_request/get_my_rfq_list';
  static const String chatList = 'chat/chat_list?slug=';
  static const String contractList = 'rfq_request/contract_list';
  static const String destinationCountry = 'rfq_request/destination_country';
  static const String countryPort = 'rfq_request/country_to_get_port?';
  static const String createRequest = 'rfq_request/add_rfq_request';
  static const String myProfile = 'seller/myProfile';
  static const String rfqMarketList = 'rfq_request/get_rfq_list?';
  static const String notificationSettings = 'seller/notificationSettings';
  static const String sellerProductMinMax = 'product/seller_product_min_max?';

  ///Commodity API's
  static const String commodityCategory = 'commodity_category/getCategory';
  static const String commoditySubCategory = 'commodity_product/getProduct?';
  static const String commodityAddToCart =
      'commodity_product_cart/add_to_commodity_card';
  static const String commodityMyCart = 'commodity_product_cart/getMycart';
  static const String commodityRemoveMyCart =
      'commodity_product_cart/removeFromCommodityCart';
}
