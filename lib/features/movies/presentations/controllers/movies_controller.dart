import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';
import 'package:movie_app/features/movies/presentations/utils/paged_scroll_controller.dart';
import 'package:movie_app/features/movies/presentations/widgets/alert_widget.dart';
import 'package:oktoast/oktoast.dart';

class MoviesController with ChangeNotifier {
  final MoviesUseCase _movieUseCase;
  late final PagedScrollController scrollController;

  MoviesController(this._movieUseCase) {
    _fetch();
    scrollController = PagedScrollController(onLoadMore: _fetch);
  }

  ValueNotifier<bool> loading = ValueNotifier(false);
  TheMovieDbEntity result = TheMovieDbEntity.empty();
  Set<MovieEntity> movies = {};

  int get _nextPage => result.page + 1;

  void _fetch() async {
    loading.value = true;
    var result = await _movieUseCase.getTrendingMovies(page: _nextPage);
    result.fold(_onError, _onSuccess);
    loading.value = false;
  }

  void _onSuccess(TheMovieDbEntity success) {
    result = success;
    movies.addAll(success.results);
    notifyListeners();
  }

  void _onError(BaseFailure error) {
    scrollController.setHasMore(error is! CacheDataFailure);
    loading.value = false;
    showToastWidget(AlertWidget(error: error));
  }
}
