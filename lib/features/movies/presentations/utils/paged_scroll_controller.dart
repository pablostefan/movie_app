import 'package:flutter/material.dart';

class PagedScrollController extends ScrollController {
  final void Function() onLoadMore;

  PagedScrollController({required this.onLoadMore});

  @override
  attach(ScrollPosition position) {
    super.attach(position);
    position.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (position.pixels >= position.maxScrollExtent) {
      onLoadMore();
    }
  }
}
