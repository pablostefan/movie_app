import 'package:flutter/cupertino.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class MoviesController with ChangeNotifier {
  final MoviesUseCase _movieUseCase;

  MoviesController(this._movieUseCase) {
    _fetch();
  }

  ValueNotifier<bool> loading = ValueNotifier(false);

  List<MovieEntity> movies = [];

  int page = 1;

  void _fetch() async {
    loading.value = true;
    var result = await _movieUseCase.getTrendingMovies(page: page);
    result.fold(_onError, _onSuccess);
    loading.value = false;
  }

  void _onSuccess(List<MovieEntity> movies) {
    this.movies = movies;
    notifyListeners();
  }

  void _onError(Exception error) {
    loading.value = false;
  }
}
