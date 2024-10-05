import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class SearchMoviesController with ChangeNotifier {
  final MoviesUseCase _movieUseCase;

  SearchMoviesController(this._movieUseCase);

  final ValueNotifier<bool> loading = ValueNotifier(false);
  final TextEditingController searchController = TextEditingController();
  int page = 1;
  List<MovieEntity> movies = [];

  void _fetch() async {
    loading.value = true;
    var result = await _movieUseCase.getSearchMovies(page: page, query: searchController.text);
    result.fold(_onError, _onSuccess);
    loading.value = false;
  }

  void _onSuccess(TheMovieDbEntity movies) {
    notifyListeners();
  }

  void _onError(Exception error) {
    loading.value = false;
  }
}
