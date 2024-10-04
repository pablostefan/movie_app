import 'package:either_dart/either.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesRemoteDatasource implements IMoviesDataSource {
  final HttpService _httpService;

  MoviesRemoteDatasource(this._httpService);

  @override
  Future<Either<BaseFailure, MovieEntity>> getMovieEntity() async {
    try {
      var result = await _httpService.get("");
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(DataSourceFailure());
    }
  }

  @override
  Future<Either<BaseFailure, List<MovieEntity>>> getMoviesListEntity() async {
    try {
      var result = await _httpService.get("");
      return Right(List<MovieEntity>.from(result.data.map((e) => MovieDto.fromJson(e)).toList()));
    } catch (e) {
      return Left(DataSourceFailure());
    }
  }
}
