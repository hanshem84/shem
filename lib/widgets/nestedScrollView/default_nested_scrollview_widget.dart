import 'package:flutter/material.dart';

class DefaultNestedScrollView extends StatelessWidget {
  final List<Widget> headerWidgets;
  final Widget pinWidget;
  final double pinWidgetHeight;
  final List<Widget> bodyWidgets;

  const DefaultNestedScrollView({super.key, required this.headerWidgets, required this.pinWidget, required this.pinWidgetHeight, required this.bodyWidgets});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // SliverPersistentHeader(
            //   delegate: TabBarDelegate(pinWidgetHeight, pinWidget),
            //   pinned: false,
            //   floating: true,
            // ),
            SliverToBoxAdapter(
              child: Column(children: headerWidgets),
            ),
            SliverPersistentHeader(
              delegate: TabBarDelegate(pinWidgetHeight, pinWidget),
              pinned: true,
            ),
          ];
        },
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(children: bodyWidgets),
        ));
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget widget;

  TabBarDelegate(this.height, this.widget);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
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
