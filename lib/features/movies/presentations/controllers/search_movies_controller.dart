import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/infra/network/network_info.dart';
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
  ValueNotifier<bool> isConnected = ValueNotifier(true);

  SearchMoviesController(this._movieUseCase, this._networkInfo) {
    scrollController = PagedScrollController(onLoadMore: _loadMoreSearchMovies);
    _connectivitySubscription = _networkInfo.onConnectivityChanged.listen(_onNetworkChange);
    searchController.addListener(_searchMovies);
    _initializeSearchMovies();
    _validateNetWork();
  }

  int get _nextPage => movieData.page + 1;

  @override
  void dispose() {
    scrollController.dispose();
    _connectivitySubscription.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _validateNetWork() async {
    _setConnection(await _networkInfo.hasConnectivity);
  }

  Future<void> _initializeSearchMovies() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await _searchMoviesRequest();
    isLoading.value = false;
  }

  Future<void> _searchMovies() async => Debounce.call(_searchMoviesRequest);

  Future<void> _searchMoviesRequest() async {
    var result = await _movieUseCase.getSearchMovies(page: 1, query: searchController.text);
    result.fold(_handleError, _handleSearchSuccess);
  }

  Future<void> _loadMoreSearchMovies() async {
    var result = await _movieUseCase.getSearchMovies(page: _nextPage, query: searchController.text);
    result.fold(_handleError, _handleLoadMoreSuccess);
  }

  void _handleSearchSuccess(TheMovieDbEntity success) {
    movieData = success;
    movies = success.results.toSet();
    notifyListeners();
  }

  void _handleLoadMoreSuccess(TheMovieDbEntity success) {
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
    _setConnection(isConnected);
    _showConnectionStatus();
    _attemptDataLoad(isConnected);
  }

  void _showConnectionStatus() {
    final message = isConnected.value ? 'Conectado' : 'Desconectado';
    final type = isConnected.value ? AlertType.success : AlertType.error;
    _showAlert(message, type: type);
  }

  void _setConnection(bool isConnected) {
    this.isConnected.value = isConnected;
  }

  void _showAlert(String message, {AlertType type = AlertType.error}) {
    showToastWidget(AlertWidget(message: message, type: type));
  }

  void _attemptDataLoad(bool isConnected) {
    if (!isLoading.value && isConnected) _initializeSearchMovies();
  }
}
