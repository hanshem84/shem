import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

defaultTextStyle(double fontSize, Color fontColor, FontWeight fontWeight, bool overflow) {
  return TextStyle(fontSize: fontSize.sp, color: fontColor, fontWeight: fontWeight, overflow: overflow ? TextOverflow.ellipsis : null);
}
