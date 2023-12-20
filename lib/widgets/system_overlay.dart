import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shem/utils/defaultFunc/hide_keyboard.dart';

class SystemOverLayWidget extends StatelessWidget {
  final Color backgroundColor;
  final bool statusDarkMode;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final Color scaffoldColor;
  final Widget child;

  const SystemOverLayWidget(
      {super.key, required this.backgroundColor, required this.statusDarkMode, required this.safeAreaTop, required this.safeAreaBottom, required this.scaffoldColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              // for Android
              statusBarIconBrightness: statusDarkMode ? Brightness.light : Brightness.dark,
              // for iOS
              statusBarBrightness: statusDarkMode ? Brightness.dark : Brightness.light),
          child: SafeArea(
            top: safeAreaTop,
            bottom: safeAreaBottom,
            child: Scaffold(
              backgroundColor: scaffoldColor,
              body: GestureDetector(
                  onTap: () {
                    hideKeyboard(context);
                  },
                  child: child),
            ),
          )),
    );
  }
}
