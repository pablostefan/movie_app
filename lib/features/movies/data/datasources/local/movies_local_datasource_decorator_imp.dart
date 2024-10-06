import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/infra/local_storage/local_storage_service.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  final LocalStorageService _localStorageService;

  MoviesLocalDataSourceDecoratorImp(super.moviesDataSource, this._localStorageService);

  @override
  Future<TheMovieDbEntity> getTrendingMovies({required int page}) async {
    try {
      final movieDbEntity = await super.getTrendingMovies(page: page);
      await _localStorageService.put("trending_movies_$page", movieDbEntity.toJson());
      return movieDbEntity;
    } on NetworkFailure {
      return await _getInCache("trending_movies_$page");
    } catch (e, s) {
      throw CacheDataFailure(stackTrace: s);
    }
  }

  @override
  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query}) async {
    try {
      final movieDbEntity = await super.getSearchMovies(page: page, query: query);
      await _localStorageService.put("search_movies_$page", movieDbEntity.toJson());
      return movieDbEntity;
    } on NetworkFailure {
      return await _getInCache("search_movies_$page");
    } catch (e, s) {
      throw CacheDataFailure(stackTrace: s);
    }
  }

  Future<TheMovieDbEntity> _getInCache(String key) async {
    try {
      Map<String, dynamic>? data = await _localStorageService.get(key);
      return TheMovieDbDto.fromJson(data!);
    } catch (e, s) {
      throw CacheDataFailure(stackTrace: s);
    }
  }
}
