import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shem/pages/splash/splash_page.dart';
import 'package:shem/widgets/loading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

final routeObserver = RouteObserver();

class ShemApp extends StatelessWidget {
  final dynamic options;

  const ShemApp({super.key, this.options});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => Loading(
              child: GetMaterialApp(
                navigatorObservers: [
                  routeObserver,
                  // FirebaseAnalyticsObserver(analytics: analytics),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ko', ''),
                ],
                popGesture: true,
                opaqueRoute: true,
                defaultTransition: Transition.fadeIn,
                transitionDuration: Get.defaultTransitionDuration,
                enableLog: true,
                themeMode: ThemeMode.system,
                theme: ThemeData(
                  platform: TargetPlatform.iOS,
                  fontFamily: "Inter",
                ),
                // modal bottom sheet 사용 할 경우
                onGenerateRoute: (settings) => MaterialWithModalsPageRoute(
                    builder: (context) => Provider<RouteObserver>(
                          create: (_) => routeObserver,
                          child: DefaultSplashPage(
                            options: options,
                          ),
                        )),
                // builder: EasyLoading.init(),
                builder: (c, widget) {
                  widget = botToastBuilder(context, widget);

                  return CupertinoTheme(
                    data: CupertinoThemeData(
                      brightness: Theme.of(context).brightness,
                      scaffoldBackgroundColor: CupertinoColors.systemBackground,
                    ),
                    // child: widget,
                    child: MediaQuery(
                      data: MediaQuery.of(c).copyWith(textScaleFactor: 1.0),
                      child: widget,
                    ),
                  );
                },
                debugShowCheckedModeBanner: false,
                // modal bottom sheet 사용 안할 경우
                // initialRoute: "/",
                // getPages: AppRoutes.routes,
                // home: Provider<RouteObserver>(
                //   create: (_) => routeObserver,
                //   child: SplashPage(),
                // ),
              ),
            ));
  }
}
