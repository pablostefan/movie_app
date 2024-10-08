import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_local_datasource_decorator_imp.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

import 'local_movies_datasource_test.mocks.dart';

void main() {
  late MoviesLocalDataSourceDecoratorImp dataSourceDecorator;
  late MockLocalStorageService mockLocalStorageService;
  late MockMoviesDataSource mockMoviesDataSource;

  setUp(() {
    mockLocalStorageService = MockLocalStorageService();
    mockMoviesDataSource = MockMoviesDataSource();
    dataSourceDecorator = MoviesLocalDataSourceDecoratorImp(mockMoviesDataSource, mockLocalStorageService);
  });

  group('MoviesLocalDataSourceDecoratorImp', () {
    test('Should return TheMovieDbEntity when calling getTrendingMovies and store it in cache', () async {
      final movieDbEntity = TheMovieDbEntity(page: 1, totalPages: 1, totalResults: 1, results: []);
      const cacheKey = 'trending_movies_1';

      when(mockMoviesDataSource.getTrendingMovies(page: 1)).thenAnswer((_) async => movieDbEntity);
      when(mockLocalStorageService.putData(cacheKey, movieDbEntity.toJson())).thenAnswer((_) async => true);

      final result = await dataSourceDecorator.getTrendingMovies(page: 1);

      expect(result, isA<TheMovieDbEntity>());
      verify(mockMoviesDataSource.getTrendingMovies(page: 1)).called(1);
      verify(mockLocalStorageService.putData(cacheKey, movieDbEntity.toJson())).called(1);
    });

    test('Should return TheMovieDbEntity when calling getSearchMovies and store it in cache', () async {
      final movieDbEntity = TheMovieDbEntity(page: 1, totalPages: 1, totalResults: 1, results: []);
      const cacheKey = 'search_movies_1_some_query';

      when(mockMoviesDataSource.getSearchMovies(page: 1, query: 'some_query')).thenAnswer((_) async => movieDbEntity);
      when(mockLocalStorageService.putData(cacheKey, movieDbEntity.toJson())).thenAnswer((_) async => true);
      when(mockLocalStorageService.putString(any, any)).thenAnswer((_) async => true);

      final result = await dataSourceDecorator.getSearchMovies(page: 1, query: 'some_query');

      expect(result, isA<TheMovieDbEntity>());
      verify(mockMoviesDataSource.getSearchMovies(page: 1, query: 'some_query')).called(1);
      verify(mockLocalStorageService.putData(cacheKey, movieDbEntity.toJson())).called(1);
      verify(mockLocalStorageService.putString(any, any)).called(1);
    });

    test('Should return data from cache in case of NetworkFailure', () async {
      const cacheKey = 'trending_movies_1';
      final cachedData = TheMovieDbEntity(page: 1, totalPages: 1, totalResults: 1, results: []).toJson();

      when(mockMoviesDataSource.getTrendingMovies(page: 1)).thenThrow(NetworkFailure(message: ''));
      when(mockLocalStorageService.getData(cacheKey)).thenAnswer((_) async => cachedData);

      final result = await dataSourceDecorator.getTrendingMovies(page: 1);

      expect(result, isA<TheMovieDbEntity>());
      verify(mockMoviesDataSource.getTrendingMovies(page: 1)).called(1);
      verify(mockLocalStorageService.getData(cacheKey)).called(1);
    });

    test('Should throw CacheDataFailure when there is no data in cache and network fails', () async {
      const cacheKey = 'trending_movies_1';

      when(mockMoviesDataSource.getTrendingMovies(page: 1)).thenThrow(NetworkFailure(message: ''));
      when(mockLocalStorageService.getData(cacheKey)).thenAnswer((_) async => null);

      expect(() => dataSourceDecorator.getTrendingMovies(page: 1), throwsA(isA<CacheDataFailure>()));
    });
  });
}
