import 'package:get/get.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:shem/shem.dart';

import 'package:shem/utils/api/api.dart';
import 'package:shem/utils/val/color.dart';
import 'package:shem/utils/debug_print.dart';

class SplashController<T> extends GetxController {
  final dynamic options;
  var isLoading = true.obs;
  var canUpdate = false.obs;
  var currentVersion = "".obs;
  var newVersion = "".obs;
  var appURL = "".obs;

  late Rx<T> splashData;

  late Rx<T> _value;

  SplashController(T initialValue, this.options) {
    _value = initialValue.obs;
  }

  Rx<T> get fromData => _value;

  @override
  void onInit() {
    splashData = fromData().obs;

    getCheckAppVersion();
    super.onInit();
  }

  getCheckAppVersion() async {
    final checker = InStoreAppVersionChecker();
    checker.checkUpdate().then((value) {
      canUpdate(value.canUpdate);
      currentVersion(value.currentVersion);
      newVersion(value.newVersion);
      if (GetPlatform.isAndroid) {
        try {
          appURL(value.appURL!.replaceAll("https://play.google.com/store/apps/details?id=", "market://details?id="));
        } catch (e) {
          dPrint(e);
        }
      } else {
        try {
          appURL(value.appURL);
        } catch (e) {
          dPrint(e);
        }
      }

      getSplashData();
    });
  }

  getSplashData() async {
    if (!canUpdate.value) {
      isLoading(true);
      var result = await apiGet(splashApiUrl, null);

      if (result.statusCode == 500) {
        Get.snackbar("알림", "Server ERROR!!", backgroundColor: mainColor, colorText: white);
      } else {
        splashData(result.data);
        nextPage();
      }
      isLoading(false);
    } else {
      // defaultDialog(false, false, 335, 282, 10, UpdateVersionDialog());
    }
  }

  nextPage() async {
    dPrint("nextPage");

    await int.parse(options['delayTime'].toString()).delay();

    options['nextPageRoute']();
  }
}
