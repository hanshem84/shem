import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultListView extends StatelessWidget {
  final int length;
  final bool shrinkWrap;
  final bool scrollVertical;
  final double paddingHorizontal;
  final double paddingVertical;
  final Widget Function(BuildContext, int) itemBuilder;

  const DefaultListView(
      {super.key, required this.length, required this.shrinkWrap, required this.scrollVertical, required this.paddingHorizontal, required this.paddingVertical, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      // controller: _scrollViewController,
      shrinkWrap: shrinkWrap,
      scrollDirection: scrollVertical ? Axis.vertical : Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
      itemCount: length,

      itemBuilder: itemBuilder,
    );
  }
}
