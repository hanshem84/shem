import 'package:flutter/material.dart';

import '../tabbar/tabbar_delegate.dart';

class DefaultTabbarNestedScrollView extends StatelessWidget {
  final double tabBarHeight;
  final Color tabBarBackgroundColor;
  final double tabBarIndicatorWeight;
  final double tabBarHorizontalPadding;
  final Color tabBarUnselectedLabelColor;
  final Color tabBarLabelColor;
  final double tabBarLabelSize;
  final Color tabBarIndicatorColor;
  final bool tabBarIndicatorTabType;
  final Widget headerWidget;
  final List<Widget> tabWidgets;
  final List<Widget> tabbarViewWidgets;

  const DefaultTabbarNestedScrollView(
      {super.key,
      required this.tabBarHeight,
      required this.tabBarBackgroundColor,
      required this.tabBarIndicatorWeight,
      required this.tabBarHorizontalPadding,
      required this.tabBarUnselectedLabelColor,
      required this.tabBarLabelColor,
      required this.tabBarLabelSize,
      required this.tabBarIndicatorColor,
      required this.tabBarIndicatorTabType,
      required this.headerWidget,
      required this.tabWidgets,
      required this.tabbarViewWidgets});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabWidgets.length,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: headerWidget,
                ),
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                      pinned: true,
                      delegate: TabBarDelegate(
                        tabBarHeight,
                        tabBarBackgroundColor,
                        tabBarIndicatorWeight,
                        tabBarHorizontalPadding,
                        tabBarUnselectedLabelColor,
                        tabBarLabelColor,
                        tabBarLabelSize,
                        tabBarIndicatorColor,
                        tabBarIndicatorTabType,
                        tabWidgets,
                      )),
                ),
              ];
            },
            body: Column(
              children: [
                SizedBox(height: tabBarHeight),
                Expanded(
                  child: TabBarView(
                    children: tabbarViewWidgets,
                  ),
                ),
              ],
            )));
  }
}
