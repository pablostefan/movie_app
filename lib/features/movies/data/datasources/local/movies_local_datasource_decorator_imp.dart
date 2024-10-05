import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  MoviesLocalDataSourceDecoratorImp(super.moviesDataSource);

  @override
  Future<Either<Exception, TheMovieDbEntity>> getTrendingMovies({required int page}) async {
    final result = await super.getTrendingMovies(page: page);
    return result.fold((error) async => _handleError(), (movies) => _handleSuccess(movies));
  }

  Future<Either<Exception, TheMovieDbEntity>> _handleError() async {
    final cachedList = await _getInCache();
    return Right(cachedList);
  }

  Either<Exception, TheMovieDbEntity> _handleSuccess(TheMovieDbEntity movies) {
    _saveInCache(movies);
    return Right(movies);
  }

  void _saveInCache(TheMovieDbEntity movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
  }

  Future<TheMovieDbEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = TheMovieDbDto.fromJson(json);

    return movies;
  }
}
