import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

defaultBottomSheetWidget(
  bool wrap,
  bool isDismissible,
  double height,
  double radius,
  Widget child,
) async {
  var result = await Get.bottomSheet(
      DefaultBottomSheet(
        child: child,
        wrap: wrap,
        height: height,
        radius: radius,
      ),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: isDismissible);
  return result;
}

class DefaultBottomSheet extends StatelessWidget {
  final bool wrap;
  final double height;
  final double radius;
  final Widget child;

  const DefaultBottomSheet({super.key, required this.wrap, required this.height, required this.radius, required this.child});

  @override
  Widget build(BuildContext context) {
    return wrap
        ? Material(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius.r), topRight: Radius.circular(radius.r)),
            child: Wrap(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(radius.r), topRight: Radius.circular(radius.r)),
                  child: Container(
                    width: double.infinity,
                    child: child,
                  ),
                )
              ],
            ),
          )
        : Material(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius.r), topRight: Radius.circular(radius.r)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(radius.r), topRight: Radius.circular(radius.r)),
              child: Container(
                width: double.infinity,
                height: height.h,
                child: child,
              ),
            ),
          );
  }
}
