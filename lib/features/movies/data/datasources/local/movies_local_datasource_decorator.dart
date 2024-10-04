import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  MoviesLocalDataSourceDecoratorImp(super.getMoviesDataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity() async {
    return (await super.getMoviesListEntity()).fold(
      (error) async => Right(await _getListInCache()),
      (result) {
        _saveInListCache(result);
        return Right(result);
      },
    );
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
