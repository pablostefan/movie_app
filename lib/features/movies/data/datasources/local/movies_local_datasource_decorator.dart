import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMoviesLocalDataSourceDecoratorImp extends GetMoviesDataSourceDecorator {
  GetMoviesLocalDataSourceDecoratorImp(super.getMoviesDataSource);

  @override
  Future<Either<BaseFailure, MovieEntity>> getMovieEntity() async {
    return (await super.getMovieEntity()).fold(
      (error) async => Right(await _getInCache()),
      (result) {
        _saveInCache(result);
        return Right(result);
      },
    );
  }

  @override
  Future<Either<BaseFailure, List<MovieEntity>>> getMoviesListEntity() async {
    return (await super.getMoviesListEntity()).fold(
      (error) async => Right(await _getInCache()),
      (result) {
        _saveInCache(result);
        return Right(result);
      },
    );
  }

  void _saveInCache(MovieEntity movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('salvou no cache ');
  }

  Future<MovieEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = MovieDto.fromJson(json);
    print('recuperou do cache os filmes ' + movies.toString());
    return movies;
  }
}
