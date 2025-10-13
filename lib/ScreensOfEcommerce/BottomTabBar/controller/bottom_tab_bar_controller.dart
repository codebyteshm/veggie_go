import 'package:dio/dio.dart';
import 'package:e_commerce46/Common/string_extention.dart';
import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/get_my_order_response_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/home_response_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/BottomTabBar/model/update_user_request_model.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/dio_helper.dart';
import 'package:e_commerce46/ScreensOfEcommerce/repo/rest_constants.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get/get_connect/http/src/multipart/form_data.dart' as dio;

class BottomTabBarController extends GetxController {
  final RxInt currentIndex = 0.obs;
  RxBool profileImageChanges = false.obs;
  final profileImage = "".obs;
  RxBool isLoading = false.obs;

  void onTabSelected(int index) {
    currentIndex.value = index;
  }

  Rx<HomeResponseModel> homeResponseModel = HomeResponseModel().obs;
  LoginResponse loginResponse = LoginResponse();
  ImageUploadResponse imageUploadResponse = ImageUploadResponse();
  GetMyOrderResponse getMyOrderResponse = GetMyOrderResponse();

  ///Home data get
  void homeApiCall(){
    isLoading.value = true;
    DioHelper.getData(
      url: RestConstants.homeUrl,
      isHeader: true
    ).then((value) async {
      isLoading.value = false;
      homeResponseModel.value = HomeResponseModel.fromJson(value.data);
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
          error.response?.data['message'].toString().toast();
      }
    });
  }

  void logoutCall(){
    DioHelper.postData(
      url: RestConstants.logout,
      isHeader: true
    ).then((value) async {
      await SharedPreferenceUtil.remove(isLoginKey);
      await SharedPreferenceUtil.clear();
      Get.offAllNamed(RoutesConstants.loginView);
    }).catchError((error) {
      if (error is DioError) {
          error.response?.data['message'].toString().toast();
      }
    });
  }

  void updateProfile({required UpdateUserRequestModel updateUserRequestModel})async{
    isLoading.value = true;

    FormData formData = FormData();
    if (profileImage.value != null && profileImage.isNotEmpty && !profileImage.value.startsWith("http")) {
      formData.files.add(MapEntry("image", await MultipartFile.fromFile(profileImage.value)));

      DioHelper.postData(
        url: RestConstants.uploadImageUrl,
        isHeader: true,
        formData: formData,
      ).then((value) async {
        imageUploadResponse = ImageUploadResponse.fromJson(value.data);
        updateUserCall(updateUserRequestModel: UpdateUserRequestModel(
          profileImage: imageUploadResponse.data?.url,
          firstName: updateUserRequestModel.firstName,
          lastName: updateUserRequestModel.lastName,
          email: updateUserRequestModel.email,
          phone: updateUserRequestModel.phone
        ));
      }).catchError((error) {
        isLoading.value = false;
        if (error is DioError) {
          error.response?.data['message'].toString().toast();
        }
      });
    }else{
      updateUserCall(updateUserRequestModel: updateUserRequestModel);
    }
  }

  void updateUserCall({required UpdateUserRequestModel updateUserRequestModel}){
    DioHelper.postData(
      url: '${RestConstants.updateUser}${updateUserRequestModel.id}',
      isHeader: true,
      data: updateUserRequestModel.toJson()
    ).then((value) async {
      isLoading.value = false;
      loginResponse = LoginResponse.fromJson(value.data);
      await saveLoginDataToSP(loginResponse);
      Get.offAllNamed(RoutesConstants.mainScreen);
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
          error.response?.data['message'].toString().toast();
      }
    });
  }

  ///My order list get
  void getMyOrderCall(){
    isLoading.value = true;
    DioHelper.getData(
      url: RestConstants.getMyOrderUrl,
      isHeader: true
    ).then((value) async {
      isLoading.value = false;
      getMyOrderResponse = GetMyOrderResponse.fromJson(value.data);
    }).catchError((error) {
      isLoading.value = false;
      if (error is DioError) {
          error.response?.data['message'].toString().toast();
      }
    });
  }
}


