import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfiniteScrollWidget extends StatelessWidget {
  final ScrollController scrollController;
  final PagingController pagingController;
  final double paddingHorizontal;
  final double paddingVertical;
  final Widget Function(BuildContext, dynamic, int) itemBuilder;
  final Widget placeHolderWidget;

  const InfiniteScrollWidget(
      {super.key,
      required this.scrollController,
      required this.pagingController,
      required this.paddingHorizontal,
      required this.paddingVertical,
      required this.itemBuilder,
      required this.placeHolderWidget});

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      scrollController: scrollController,
      pagingController: pagingController,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
      physics: const ClampingScrollPhysics(),
      cacheExtent: 100,
      builderDelegate: PagedChildBuilderDelegate<dynamic>(
        animateTransitions: true,
        noItemsFoundIndicatorBuilder: (context) {
          return placeHolderWidget == null
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "데이터가 존재하지 않습니다",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )
                  ],
                )
              : placeHolderWidget;
        },
        itemBuilder: itemBuilder,
      ),
    );
  }
}
