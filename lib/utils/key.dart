import 'package:e_commerce46/ScreensOfEcommerce/Auth/login/controller/login_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String isLoginKey = "isLoginKey";
const liveLat = "liveLat";
const liveLang = "liveLang";
const userIdKey = "userId";

const forgotId = "forgotId";

const String fcmTokenKey = "fcmTokenKey ";
User currentUser = User();

RxList addCountry = [].obs;
RxList addSellers = [].obs;
RxList addBrands = [].obs;
RxString bCategoryId = "".obs;
RxString bSubCategoryId = "".obs;
RxList bChildCategoryId = [].obs;
RxString minPrice = "".obs;
RxString maxPrice = "".obs;

RxBool isClear = false.obs;
RxBool changeTab = false.obs;

RxBool appOpen = false.obs;

RxBool isShowDialog = false.obs;

AppLifecycleState? appState;

//Notification key

const String nCommonClick = "nCommonClick";

const String nAddress = "nAddress"; //push type 1,7
const String nEnquiry = "nEnquiry"; //push type 2,3
const String nRfq = "nRfq"; //push type 4,5
const String nRfqObjectId = "nRfqObjectId"; //push type 4,5 ObjectId
const String nOrder = "nOrder"; //push type 6,8
const String nOrderObjectId = "nOrderObjectId"; //push type 6,8 ObjectId

const String nChat = "nChat"; //push type 9,101 ObjectId
const String nChatProfile = "nChatProfile"; //push type 9,101 ObjectId
const String nChatName = "nChatName"; //push type 9,101 ObjectId
const String nChatId = "nChatId"; //push type 9,101 ObjectId
const String nChatUserId = "nChatUserId"; //push type 9,101 ObjectId
const String nChatType = "nChatType"; //push type 9,101 ObjectId

//Dynamic Link key

const String dynamicLinkClick = "dynamicLinkClick";
const String dynamicLinkClickResponse = "dynamicLinkClickResponse";