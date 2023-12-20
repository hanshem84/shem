import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shem/utils/camera/camera_init.dart';

bool crashlyticsCheck = false;
late String udid;

class Injector {
  static Future<void> inject(List<Function> functionList) async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    cameras = await availableCameras();
    await GetStorage.init();

    for (var func in functionList) {
      func();
    }

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
}
