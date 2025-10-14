import 'package:e_commerce46/routes/navigation_pages.dart';
import 'package:e_commerce46/routes/routes_strings.dart';
import 'package:e_commerce46/utils/key.dart';
import 'package:e_commerce46/utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Common/app_theme.dart';
import 'Common/strings.dart';
import 'ScreensOfEcommerce/repo/dio_helper.dart';

Object? versionError;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtil.getInstance();
  // await Firebase.initializeApp();
  // await initDynamicLink();
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  // await PushNotificationService().setupInteractedMessage();

  await DioHelper.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((value) => runApp(MyApp()));
}

bool isUserLogin = true;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // initToken();
    super.initState();
    // initializeLink();
  }

  Future<void> initializeLink() async {
    // await initDynamicLink();
  }

  bool isLogin2 = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: VeggigoApplicants,
            navigatorKey: rootNavigatorKey,
            theme: AppTheme.lightTheme, initialRoute: RoutesConstants.splashScreen, getPages: GetPages.getPages);
      },
    );
  }
}
