import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/single_execution_utils.dart';

class PagedScrollController extends ScrollController {
  final Future<void> Function() onLoadMore;
  bool hasMore;

  PagedScrollController({
    required this.onLoadMore,
    this.hasMore = true,
  }) {
    addListener(_scrollListener);
  }

  @override
  void dispose() {
    removeListener(_scrollListener);
    super.dispose();
  }

  void setHasMore(bool value) {
    hasMore = value;
  }

  void _scrollListener() async {
    if (position.pixels >= position.maxScrollExtent && hasMore) {
      SingleExecution.runOnce(onLoadMore);
    }
  }
}
