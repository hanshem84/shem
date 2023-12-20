import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color backgroundColor;
  final Widget child;

  const DefaultButton({super.key, required this.width, required this.height, required this.radius, required this.backgroundColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: Container(
        width: width.w,
        height: height.h,
        color: backgroundColor,
        child: child,
      ),
    );
  }
}
