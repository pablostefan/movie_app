import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  MoviesLocalDataSourceDecoratorImp(super.moviesDataSource);

  @override
  Future<TheMovieDbEntity> getTrendingMovies({required int page}) async {
    try {
      return await super.getTrendingMovies(page: page);
    } on DioException {
      return await _getInCache();
    } catch (e) {
      throw Exception('Falha no local datasource');
    }
  }

  @override
  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query}) async {
    try {
      return await super.getSearchMovies(page: page, query: query);
    } on DioException {
      return await _getInCache();
    } catch (e) {
      throw Exception('Falha no local datasource');
    }
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
