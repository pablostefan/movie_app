import 'package:flutter/material.dart';

class PagedScrollController extends ScrollController {
  final void Function() onLoadMore;
  bool hasMore;

  PagedScrollController({required this.onLoadMore, this.hasMore = true});

  @override
  void dispose() {
    removeListener(_scrollListener);
    super.dispose();
  }

  @override
  attach(ScrollPosition position) {
    super.attach(position);
    position.addListener(_scrollListener);
  }

  void setHasMore(bool value) {
    hasMore = value;
  }

  void _scrollListener() {
    if (position.pixels >= position.maxScrollExtent && hasMore) {
      onLoadMore();
      print("----------------------------------------");
      print('Chamouuuuuuuuuuuu');
      print("----------------------------------------");
    }
    print("----------------------------------------");
    print('Load more: $hasMore');
    print("----------------------------------------");
  }
}
