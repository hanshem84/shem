import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultGridView extends StatelessWidget {
  final int length;
  final bool shrinkWrap;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double paddingVertical;
  final double paddingHorizontal;

  final Widget Function(BuildContext, int) itemBuilder;

  const DefaultGridView(
      {super.key,
      required this.length,
      required this.shrinkWrap,
      required this.crossAxisCount,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.childAspectRatio,
      required this.paddingVertical,
      required this.paddingHorizontal,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: paddingVertical.h, horizontal: paddingHorizontal.w),
        shrinkWrap: shrinkWrap ? true : false,
        physics: shrinkWrap ? NeverScrollableScrollPhysics() : ClampingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, mainAxisSpacing: mainAxisSpacing, crossAxisSpacing: crossAxisSpacing, childAspectRatio: childAspectRatio),
        itemCount: length,
        itemBuilder: itemBuilder);
  }
}
