import 'package:either_dart/either.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesRemoteDatasource extends MoviesDataSource {
  final HttpService _httpService;

  MoviesRemoteDatasource(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> getMovieEntity() async {
    try {
      var result = await _httpService.get("");
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no remote datasource'));
    }
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity() async {
    try {
      var result = await _httpService.get("");
      return Right([]);
    } catch (e) {
      return Left(Exception('Falha no remote datasource'));
    }
  }
}
