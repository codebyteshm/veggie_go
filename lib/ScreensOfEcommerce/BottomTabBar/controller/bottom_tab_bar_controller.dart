import 'package:dio/dio.dart';
import 'package:e_commerce46/Common/string_extention.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/home_response_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:get/get.dart';

class BottomTabBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void onTabSelected(int index) {
    currentIndex.value = index;
  }

  HomeResponseModel homeResponseModel = HomeResponseModel();
  RxBool isLoading = false.obs;

  void homeApiCall(){
    isLoading.value = true;
    DioHelper.postData(
      url: RestConstants.homeUrl,
    ).then((value) async {
      isLoading.value = false;
      homeResponseModel = HomeResponseModel.fromJson(value.data);
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
          error.response?.data['message'].toString().toast();
      }
    });
  }
}


