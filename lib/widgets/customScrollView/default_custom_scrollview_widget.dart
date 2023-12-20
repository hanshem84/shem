import 'package:flutter/material.dart';

class DefaultCustomScrollView extends StatelessWidget {
  final Widget headerWidget;

  final Widget pinWidget;
  final double pinHeight;
  final Widget bodyWidget;

  const DefaultCustomScrollView({super.key, required this.headerWidget, required this.pinWidget, required this.pinHeight, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 400,
            color: Colors.grey,
          ),
        ),
        SliverPersistentHeader(pinned: true, delegate: CategoryBreadcrumbs(pinHeight, pinWidget)),
        bodyWidget
      ],
    );
  }
}

class CategoryBreadcrumbs extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget pinWidget;

  CategoryBreadcrumbs(this.height, this.pinWidget);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return pinWidget;
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
