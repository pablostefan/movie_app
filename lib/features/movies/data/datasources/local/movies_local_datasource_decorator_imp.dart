import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/infra/local_storage/local_storage_service.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_datasource_decorator.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

class MoviesLocalDataSourceDecoratorImp extends MoviesDataSourceDecorator {
  final LocalStorageService _localStorageService;

  MoviesLocalDataSourceDecoratorImp(super.moviesDataSource, this._localStorageService);

  static const String trendingMoviesCacheKey = "trending_movies";
  static const String searchMoviesCacheKey = "search_movies";
  static const String queryCacheKey = "search_query";

  @override
  Future<TheMovieDbEntity> getTrendingMovies({required int page}) async {
    final String cacheKey = "${trendingMoviesCacheKey}_$page";
    try {
      final movieDbEntity = await super.getTrendingMovies(page: page);
      await _localStorageService.putData(cacheKey, movieDbEntity.toJson());
      return movieDbEntity;
    } on NetworkFailure {
      return await _getInCache(cacheKey);
    } catch (e, s) {
      throw CacheDataFailure(message: "Não foi possível buscar os dados", stackTrace: s);
    }
  }

  @override
  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query}) async {
    try {
      final movieDbEntity = await super.getSearchMovies(page: page, query: query);

      Future.wait([
        _localStorageService.putString(queryCacheKey, query),
        _localStorageService.putData("${searchMoviesCacheKey}_${page}_$query", movieDbEntity.toJson()),
      ]);

      return movieDbEntity;
    } on NetworkFailure {
      final cachedQuery = await _localStorageService.getString(queryCacheKey);
      return await _getInCache("${searchMoviesCacheKey}_${page}_$cachedQuery");
    } catch (e, s) {
      throw CacheDataFailure(message: "Não foi possível buscar os dados", stackTrace: s);
    }
  }

  Future<TheMovieDbEntity> _getInCache(String key) async {
    try {
      Map<String, dynamic>? data = await _localStorageService.getData(key);
      return TheMovieDbDto.fromJson(data!);
    } catch (e, s) {
      throw CacheDataFailure(message: "Nenhum dado disponível.", stackTrace: s);
    }
  }
}
