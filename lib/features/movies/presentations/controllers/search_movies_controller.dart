import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/network/network_info.dart';
import 'package:movie_app/core/utils/debounce_utils.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';
import 'package:movie_app/features/movies/presentations/controllers/paged_scroll_controller.dart';
import 'package:movie_app/features/movies/presentations/widgets/alert_widget.dart';
import 'package:oktoast/oktoast.dart';

class SearchMoviesController with ChangeNotifier {
  final MoviesUseCase _movieUseCase;
  final NetworkInfo _networkInfo;

  late final PagedScrollController scrollController;
  late final StreamSubscription<bool> _connectivitySubscription;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  TheMovieDbEntity movieData = TheMovieDbEntity.empty();
  Set<MovieEntity> movies = {};
  TextEditingController searchController = TextEditingController();

  SearchMoviesController(this._movieUseCase, this._networkInfo) {
    scrollController = PagedScrollController(onLoadMore: _loadMoreMovies);
    _connectivitySubscription = _networkInfo.onConnectivityChanged.listen(_onNetworkChange);
    searchController.addListener(_searchMovies);
  }

  @override
  void dispose() {
    scrollController.dispose();
    _connectivitySubscription.cancel();
    searchController.dispose();
    super.dispose();
  }

  int get _nextPage => movieData.page + 1;

  Future<void> _initializeMovies() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await _loadMoreMovies();
    isLoading.value = false;
  }

  Future<void> _searchMoviesRequest() async {
    var result = await _movieUseCase.getSearchMovies(page: 1, query: searchController.text);
    result.fold(_handleError, _handleSearchSuccess);
  }

  Future<void> _loadMoreMovies() async {
    var result = await _movieUseCase.getSearchMovies(page: _nextPage, query: searchController.text);
    result.fold(_handleError, _handleSuccess);
  }

  Future<void> _searchMovies() async => Debounce.call(_searchMoviesRequest);

  void _handleSearchSuccess(TheMovieDbEntity success) {
    movieData = success;
    movies = success.results.toSet();
    notifyListeners();
  }

  void _handleSuccess(TheMovieDbEntity success) {
    movieData = success;
    movies.addAll(success.results);
    notifyListeners();
  }

  void _handleError(BaseFailure error) {
    scrollController.setHasMore(error is! CacheDataFailure);
    isLoading.value = false;
    _showAlert(error.message);
  }

  void _onNetworkChange(bool isConnected) {
    _showConnectionStatus(isConnected);
    if (isConnected) _attemptDataLoad();
  }

  void _showConnectionStatus(bool isConnected) {
    final message = isConnected ? 'Conectado' : 'Desconectado';
    final type = isConnected ? AlertType.success : AlertType.error;
    _showAlert(message, type: type);
  }

  void _showAlert(String message, {AlertType type = AlertType.error}) {
    showToastWidget(AlertWidget(message: message, type: type));
  }

  void _attemptDataLoad() {
    if (!isLoading.value) _initializeMovies();
  }
}
