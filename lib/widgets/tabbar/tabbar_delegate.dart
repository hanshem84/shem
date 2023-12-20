import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Color backgroundColor;
  final double indicatorWeight;
  final double horizontalPadding;
  final Color unselectedLabelColor;
  final Color labelColor;
  final double labelSize;
  final Color indicatorColor;
  final bool indicatorTabType;
  final List<Widget> tabWidgets;

  TabBarDelegate(this.height, this.backgroundColor, this.indicatorWeight, this.horizontalPadding, this.unselectedLabelColor, this.labelColor, this.labelSize, this.indicatorColor,
      this.indicatorTabType, this.tabWidgets);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: TabBar(
        tabs: tabWidgets,
        indicatorWeight: indicatorWeight,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        unselectedLabelColor: unselectedLabelColor,
        labelColor: labelColor,
        labelStyle: TextStyle(fontSize: labelSize),
        indicatorColor: indicatorColor,
        indicatorSize: indicatorTabType ? TabBarIndicatorSize.tab : TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
