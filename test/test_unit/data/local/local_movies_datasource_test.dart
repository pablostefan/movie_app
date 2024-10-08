import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/data/datasources/remote/movies_remote_datasource_imp.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

import '../remote/remote_movies_datasource_test.mocks.dart';

void main() {
  late MoviesRemoteDatasourceImp dataSource;
  late MockHttpService mockHttpService;

  setUp(() {
    mockHttpService = MockHttpService();
    dataSource = MoviesRemoteDatasourceImp(mockHttpService);
  });

  group('MoviesRemoteDatasourceImp', () {
    test('Must return TheMovieDbEntity when calling getTrendingMovies', () async {
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

    test('Must return TheMovieDbEntity when calling getSearchMovies', () async {
      final response = Response(
        requestOptions: RequestOptions(path: ''),
        data: {"results": []},
        statusCode: 200,
      );

      when(mockHttpService.get(API.searchMovies, queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => response);

      final result = await dataSource.getSearchMovies(page: 1, query: 'some_query');
      expect(result, isA<TheMovieDbEntity>());
      verify(mockHttpService.get(API.searchMovies, queryParameters: anyNamed('queryParameters'))).called(1);
    });

    test('Should throw NetworkFailure when getTrendingMovies encounters a Dio error', () async {
      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      expect(() => dataSource.getTrendingMovies(page: 1), throwsA(isA<NetworkFailure>()));
    });

    test('Should throw RemoteDataFailure when getTrendingMovies encounters an unexpected exception', () async {
      when(mockHttpService.get(API.trendingMovies, queryParameters: anyNamed('queryParameters')))
          .thenThrow(Exception());

      expect(() => dataSource.getTrendingMovies(page: 1), throwsA(isA<RemoteDataFailure>()));
    });

    test('Should throw NetworkFailure when getSearchMovies encounters a Dio error', () async {
      when(mockHttpService.get(API.searchMovies, queryParameters: anyNamed('queryParameters')))
          .thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      expect(() => dataSource.getSearchMovies(page: 1, query: 'some_query'), throwsA(isA<NetworkFailure>()));
    });

    test('Should throw RemoteDataFailure when getSearchMovies encounters an unexpected exception', () async {
      when(mockHttpService.get(API.searchMovies, queryParameters: anyNamed('queryParameters'))).thenThrow(Exception());

      expect(() => dataSource.getSearchMovies(page: 1, query: 'some_query'), throwsA(isA<RemoteDataFailure>()));
    });
  });
}
