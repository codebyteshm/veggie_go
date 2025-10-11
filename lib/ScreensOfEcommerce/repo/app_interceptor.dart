import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:e_commerce46/utils/utills.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gets;

// import 'package:get/get.dart';

import 'dio_helper.dart';
import 'network_exception.dart';

/// Interceptor for the app
class AppInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("onRequest headers");
    if (options.extra.containsKey('header')) {
      options.headers.addAll({
        // 'vAuthorization': await getToken(),
        'Authorization': await getToken(),
      });
      options.headers["Cookie"] = await getRefreshToken();
      options.headers['Authorization'] = '${await getToken()}';
    }
    // options.headers['Authorization'] = '${await getToken()}';
    return handler.next(options);
  }

  getToken() async {
    String? accessToken =
        "Bearer ${(await getLoginDataFromSP())?.data?.token}";

    if (kDebugMode) {
      print("Authorization $accessToken");
    }
    return accessToken;
  }

  getRefreshToken() async {
    String? refreshToken = "refreshToken =${(await getLoginDataFromSP())?.data?.token}";

    if (kDebugMode) {
      print("Refresh Token $refreshToken");
    }
    return refreshToken;
  }

  //TODO
  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    // Check if error is of time out error
    if (error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.connectTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return ServerConnectionException(
          'Couldn\'t connect with server. Please try again.');
    }

    // Check if the error is regarding no internet connection.
    if (error.type == DioErrorType.other && error.error is SocketException) {
      return handler.next(NoInternetException());
    }
    LoginResponse? loginResponse;
    if (error.type == DioErrorType.response) {
      if (error.response?.statusMessage == 'Unauthorized' &&
          error.response?.data["status"] == 401) {
        DioHelper.postData(url: RestConstants.refreshToken, isHeader: true)
            .then((value) async {
          loginResponse = LoginResponse.fromJson(value.data);
          // await saveLoginDataToSP(loginResponse!);
          // gets.Get.lazyPut<HomeController>(() => HomeController());
          // gets.Get.lazyPut<CategoriesController>(() => CategoriesController());
          // gets.Get.lazyPut<MyCartController>(() => MyCartController());
          // gets.Get.lazyPut<MyOrderController>(() => MyOrderController());
          Future.delayed(Duration(microseconds: 800)).then((value) =>
              gets.Get.toNamed(RoutesConstants.mainScreen,
                  arguments: [true, 0, false]));
        }).catchError((error) {
          if (error is DioError) {
            Utils.showErrorSnackBar(
              error.response?.data['message'],
            );
          }
        });
        // AppUtils.instance.logout('UnAuthorization access.');
        return null;
      }
      // if ((error.type == DioErrorType.DEFAULT) && (error.message == 'TokenExpired')) {
      // if (error.response!.data.message == 'UnAuthorized access.')
    }
    if (error.type == DioErrorType.response) {
      if (error.response?.data["message"] == 'Unauthorized' &&
          error.response?.data["status"] == 402) {
        gets.Get.offAllNamed(RoutesConstants.loginView);
        Utils.showErrorSnackBar("Your account has been deleted");
        // AppUtils.instance.logout('UnAuthorization access.');
        return null;
      } else if (error.response?.data["status"] == 402) {
        gets.Get.offAllNamed(RoutesConstants.loginView);
        Utils.showErrorSnackBar("Invalid Token or Token is Expired");
        // AppUtils.instance.logout('UnAuthorization access.');
        return null;
      }
      // if ((error.type == DioErrorType.DEFAULT) && (error.message == 'TokenExpired')) {
      // if (error.response!.data.message == 'UnAuthorized access.')
    }

    if ((error.type == DioErrorType.other) &&
        (error.message == 'TokenExpired' ||
            error.message == 'Authorization error')) {
      // if ((error.type == DioErrorType.DEFAULT) && (error.message == 'TokenExpired')) {
      // AppUtils.instance.logout(error.message);
      return null;
    }

    // Check if server responded with non-success status code.
    // In this case, we will check if we got a specific error
    // from API to display to the user.
    if (error.type == DioErrorType.response && error.response != null) {
      // NetworkException networkException =
      //     _getErrorObject(error.response!, error.requestOptions) ?? NetworkException(error.requestOptions, 'Something went wrong, please try again!');
      return handler.next(error);
    }

    return handler.next(error);
  }

  /// Parses the response to get the error object if any
  /// from the API response based on status code.
  NetworkException? _getErrorObject(
      Response response, RequestOptions requestOptions) {
    final responseData = response.data;
    // if (response.statusCode == 403) SessionExpiryNotifier.notifySessionExpiry();
    // if (response.statusCode == 403)
    //   AppUtils.instance.logout(responseData?.toString() ?? '');

    if (responseData != null && responseData is Map) {
      if (responseData.containsKey('status')) {
        // final status = responseData['status'];
        // if (!status) {
        // final errorsMap = responseData['errors'];
        /*if (errorsMap != null && errorsMap is Map) {
            Map<String, dynamic> map = errorsMap as Map<String, dynamic>;
            if (map.isNotEmpty) {
              final key = map.keys.toList()[0];
              return NetworkException(
                requestOptions,
                map[key] ?? 'Something went wrong, please try again!',
                code: response.statusCode ?? 0,
              );
            }
          }*/
        return NetworkException(
          requestOptions,
          responseData['message'] ?? 'Something went wrong, please try again!',
          code: response.statusCode ?? 0,
        );
        // }
      }
    }

    return throw FetchDataException(
        'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }

/*@override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    response.data = _response(response);
    return super.onResponse(response, handler);
  }*/

/*dynamic _response(Response<dynamic> response) {
    var responseJson = Map<String, dynamic>.from(response.data);
    String message = responseJson["message"];

    if (responseJson["status"] ?? false) {
      return responseJson;
    }

    if (responseJson["error"] == false) {
      return responseJson;
    }

    if (responseJson["error"] == true) {
      if (responseJson["status"] == 500) {
        if ((responseJson['info'] != null) &&
            (responseJson["info"]['error'] != null)) {
          message = responseJson["info"]['error'];
        }
      }
    }

    throw ErrorResponseException(null, message);
  }

  void _logOutDevice(Response? response) {
    if (response!.statusCode == 401) {
      print("Its logout process");

    }
  }*/
}
