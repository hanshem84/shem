import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

defaultDecoration(
  Color backgroundColor,
  double radiusTopLeft,
  double radiusTopRight,
  double bottomLeft,
  double bottomRight,
  bool isUseBorder,
  double borderWidth,
  Color borderColor,
  bool isUseShadow,
  Color shadowColor,
  double spreadRadius,
  double blurRadius,
  double offsetDx,
  double offsetDy,
) {
  return BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radiusTopLeft.r),
      topRight: Radius.circular(radiusTopRight.r),
      bottomLeft: Radius.circular(bottomLeft.r),
      bottomRight: Radius.circular(bottomRight.r),
    ),
    border: isUseBorder
        ? Border.all(
            width: borderWidth.w,
            style: BorderStyle.solid,
            color: borderColor,
          )
        : null,
    boxShadow: isUseShadow
        ? [
            BoxShadow(
              color: shadowColor,
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: Offset(offsetDx, offsetDy), // changes position of shadow
            ),
          ]
        : null,
  );
}
