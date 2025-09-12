import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'app_interceptor.dart';

class RestClient {
  static final _instance = RestClient._internal();

  late Dio _dio;

  RestClient._internal() {
    _dio = Dio(BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
      baseUrl: RestConstants.baseUrl,
    ));

    // _dio.options.contentType = Headers.formUrlEncodedContentType;

    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
      AppInterceptor(),
    ]);
  }

  factory RestClient() {
    return _instance;
  }

  Dio dio() => _dio;
}
