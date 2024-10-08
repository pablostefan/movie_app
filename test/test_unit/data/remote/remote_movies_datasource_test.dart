import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/data/datasources/remote/movies_remote_datasource_imp.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

import 'remote_movies_datasource_test.mocks.dart';

void main() {
  late MoviesRemoteDatasourceImp dataSource;
  late MockHttpService mockHttpService;

  setUp(() {
    mockHttpService = MockHttpService();
    dataSource = MoviesRemoteDatasourceImp(mockHttpService);
  });

  group('MoviesRemoteDatasourceImp', () {
    test('Must return TheMovieDb Entity when calling get Trending Movies', () async {
      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: {"results": []},
        statusCode: 200,
      );

      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => response);

      final result = await dataSource.getTrendingMovies(page: 1);
      expect(result, isA<TheMovieDbEntity>());
      verify(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters'))).called(1);
    });

    test('Must return TheMovieDb Entity when calling get search Movies', () async {
      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: {"results": []},
        statusCode: 200,
      );

      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => response);

      final result = await dataSource.getTrendingMovies(page: 1);
      expect(result, isA<TheMovieDbEntity>());
      verify(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters'))).called(1);
    });

    test('Should throw NetworkFailure when getting Dio error', () async {
      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      expect(() => dataSource.getTrendingMovies(page: 1), throwsA(isA<NetworkFailure>()));
    });

    test('Should throw RemoteDataFailure when an unexpected exception occurs', () async {
      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenThrow(Exception());

      expect(() => dataSource.getTrendingMovies(page: 1), throwsA(isA<RemoteDataFailure>()));
    });
  });
}
