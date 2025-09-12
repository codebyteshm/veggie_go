
import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'app_interceptor.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: RestConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
      AppInterceptor(),
    ]);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    bool isHeader = false,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(
        extra: {
          'header': isHeader,
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<dynamic, dynamic>? data,
    FormData? formData,
    bool isHeader = false,
  }) async {
    return await dio.post(
      url,
      data: formData ?? data,
      options: Options(
        extra: {
          'header': isHeader,
        },
      ),
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
