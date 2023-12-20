import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shem/utils/api/api.dart';
import 'package:shem/utils/debug_print.dart';

class InfiniteScrollController extends GetxController {
  final String api;
  final int limit;
  var isLoading = false.obs;

  final PagingController pagingController = PagingController(firstPageKey: 1);
  ScrollController scrollController = ScrollController();

  InfiniteScrollController({required this.api, required this.limit});

  @override
  void onInit() {
    pagingController.addListener(() {});
    pagingController.addPageRequestListener((pageKey) {
      getData(pageKey);
    });

    super.onInit();
  }

  getData(int pageKey) async {
    isLoading(true);

    List<dynamic> newItems;

    try {
      var apiURL = api.replaceAll("[PAGE]", pageKey.toString()).replaceAll("[LIMIT]", limit.toString());
      var result = await apiGet(apiURL, null);
      dPrint(jsonEncode(result.data));

      var resultData = result.data;

      newItems = resultData;
      final isLastPage = newItems.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
