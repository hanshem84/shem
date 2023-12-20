import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shem/global/controller.dart';
import 'package:shem/pages/splash/controller/default_splash_controller.dart';
import 'package:shem/utils/val/color.dart';
import 'package:shem/widgets/system_overlay.dart';

class DefaultSplashPage extends StatelessWidget {
  final dynamic options;

  const DefaultSplashPage({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    sc = Get.put(SplashController(options['splashModel'], options), permanent: true);
    return Obx(() {
      return sc.isLoading.value
          ? SystemOverLayWidget(
              backgroundColor: black,
              statusDarkMode: true,
              safeAreaTop: false,
              safeAreaBottom: false,
              scaffoldColor: black,
              child: const Center(
                child: CircularProgressIndicator(),
              ))
          : options['splashPage'];
    });
  }
}
