import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

defaultDialog(
  bool wrap,
  bool barrierDismissible,
  double width,
  double height,
  double radius,
  Widget child,
) async {
  var result = await Get.dialog(
      DefaultDialog(
        wrap: wrap,
        width: width,
        height: height,
        radius: radius,
        child: child,
      ),
      barrierDismissible: barrierDismissible);
  return result;
}

class DefaultDialog extends StatelessWidget {
  final bool wrap;
  final double width;
  final double height;
  final double radius;
  final Widget child;

  const DefaultDialog({super.key, required this.wrap, required this.width, required this.height, required this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: wrap
          ? Material(
              borderRadius: BorderRadius.circular(radius.r),
              child: Wrap(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(radius.r),
                    child: Container(
                      width: width.w,
                      child: child,
                    ),
                  )
                ],
              ),
            )
          : Material(
              borderRadius: BorderRadius.circular(radius.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius.r),
                child: Container(
                  width: width.w,
                  height: height.h,
                  child: child,
                ),
              ),
            ),
    );
  }
}
