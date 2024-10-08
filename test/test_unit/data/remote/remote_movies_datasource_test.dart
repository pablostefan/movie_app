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
        data: {
          "results": [
            {
              "backdrop_path": "/qwK9soQmmJ7kRdjLZVXblw3g7AQ.jpg",
              "id": 7451,
              "title": "Triplo X",
              "original_title": "xXx",
              "overview":
                  "O ex-atleta de esportes extremos Xander \"XXX\" Cage, famoso por suas acrobacias que desafiam a morte, é convencido de que pode ter sucesso em ações que espiões convencionais falharam. Xander é recrutado pelo agente Gibbons para se tornar um tipo diferente de agente secreto. Agora, em uma perigosa missão, ele precisa usar todas as suas habilidades para combater um inimigo mortal.",
              "poster_path": "/lpmyeqSR2Pc7ytfTp1ScD3ferX4.jpg",
              "media_type": "movie",
              "adult": false,
              "original_language": "en",
              "genre_ids": [28, 12, 53, 80],
              "popularity": 369.701,
              "release_date": "2002-08-09",
              "video": false,
              "vote_average": 5.934,
              "vote_count": 4211
            }
          ]
        },
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
