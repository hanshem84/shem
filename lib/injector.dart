import 'package:camera/camera.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:shem/utils/camera/camera_init.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:wepay_payapp/Users/controller/user_controller.dart';
// import 'package:wepay_payapp/Users/global/user.dart';
// import 'camera/camera_init.dart';
// import 'firebase_options.dart';
// import 'ko_custom_message.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

bool crashlyticsCheck = false;
late String udid;

class Injector {
  // Injector._();

  static Future<void> inject(List<Function> functionList) async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // timeago.setLocaleMessages("en", KoCustomMessage());
    // configLoading();

    // initOnesignal();

    // KakaoSdk.init(nativeAppKey: 'be629df1b92d3ac97a187c36dddcf4fd', javaScriptAppKey: "d759b942d2583adbc7f79777c9a6d20b", loggingEnabled: true);
    cameras = await availableCameras();
    await GetStorage.init();

    for (var func in functionList) {
      func();
    }

    // udid = await FlutterUdid.udid;

    // userController = await Get.put(UserController());

    // await Firebase.initializeApp();
    // await adsInit();
    // MobileAds.instance.initialize();

    // 인앱
    // if (defaultTargetPlatform == TargetPlatform.android) {
    //   InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
    // }

    // await kakaoInit();
    // await Hive.initFlutter();
    // await Hive.openBox("block_list");

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // if (crashlyticsCheck) FirebaseCrashlytics.instance.crash();

    // Get.put<ApiAuthController>(ApiAuthController());

    // await Get.putAsync<SharedPreferences>(() async => await SharedPreferences.getInstance(), permanent: true);
  }
}

// configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.light
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = MyColors.primary
//     ..backgroundColor = MyColors.primary
//     ..indicatorColor = MyColors.primary
//     ..textColor = MyColors.primary
//     ..maskColor = MyColors.primary.withOpacity(0.5)
//     ..userInteractions = true
//     ..indicatorWidget = Container(
//       width: 170,
//       height: 170,
//       child: Stack(
//         children: [
//           Positioned(
//               bottom: 10,
//               left: 0,
//               right: 0,
//               child: Lottie.asset(
//                 "assets/images/loading.json",
//                 width: 160,
//                 frameRate: FrameRate.composition,
//               )),
//           // Container(
//           //   height: 50,
//           //   width: 50,
//           //   child: CircularProgressIndicator(
//           //     backgroundColor: Colors.white,
//           //     color: MyColors.color_card_point,
//           //     strokeWidth: 6,
//           //   ),
//           // ),
//           // Container(
//           //   margin: EdgeInsets.only(top: 15, left: 5),
//           //   child: Image.asset(
//           //     "assets/images/ic_logo.png",
//           //     height: 20,
//           //   ),
//           // )
//           Positioned(
//             bottom: 40,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 "잠시만 기다려주세요",
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: HexColor.fromHex("#666666")),
//               ),
//             ),
//           )
//         ],
//       ),
//     )
//     ..dismissOnTap = true;
// }

// initOnesignal() {
//   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
//   OneSignal.shared.setAppId(Configuration.onesignalAPI_KEY);

// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {});
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

//   OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//     // Get.find<DashboardController>().selectedDashboard.value = 1;
//     // Get.find<NotificationsController>().getNotification();
//     // api.isFromNotif = true;
//   });
// }
