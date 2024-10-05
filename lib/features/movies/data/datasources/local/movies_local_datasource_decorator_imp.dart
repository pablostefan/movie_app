import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  MoviesLocalDataSourceDecoratorImp(super.moviesDataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page}) async {
    final result = await super.getTrendingMovies(page: page);
    return result.fold((error) async => _handleError(), (movies) => _handleSuccess(movies));
  }

  Future<Either<Exception, List<MovieEntity>>> _handleError() async {
    final cachedList = await _getListInCache();
    return Right(cachedList);
  }

  Either<Exception, List<MovieEntity>> _handleSuccess(List<MovieEntity> movies) {
    _saveInListCache(movies);
    return Right(movies);
  }

  void _saveInCache(MovieEntity movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }

  void _saveInListCache(List<MovieEntity> movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.map((movie) => movie.toJson()).toList());
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<MovieEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = MovieDto.fromJson(json);

    return movies;
  }

  Future<List<MovieEntity>> _getListInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache');

    if (moviesJsonString != null) {
      var jsonList = jsonDecode(moviesJsonString) as List;
      var movies = jsonList.map((json) => MovieDto.fromJson(json)).toList();

      return movies;
    }
    return [];
  }
}
