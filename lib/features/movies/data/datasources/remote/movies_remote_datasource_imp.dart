import 'package:either_dart/either.dart';
import 'package:movie_app/core/infra/http/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesRemoteDatasourceImp extends MoviesDataSource {
  final HttpService _httpService;

  MoviesRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, List<MovieEntity>>> getSearchMovies({required int page, required String query}) async {
    try {
      var queryParameters = {'language': 'pt-BR', 'query': query};
      var result = await _httpService.get(API.searchMovies, queryParameters: queryParameters);
      List<MovieEntity> movies = (result.data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
      return Right(movies);
    } catch (e) {
      return Left(Exception('Falha no remote datasource'));
    }
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page}) async {
    try {
      var queryParameters = {'language': 'pt-BR'};
      var result = await _httpService.get(API.trendingMovies, queryParameters: queryParameters);
      List<MovieEntity> movies = (result.data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
      return Right(movies);
    } catch (e) {
      return Left(Exception('Falha no remote datasource'));
    }
  }
}
