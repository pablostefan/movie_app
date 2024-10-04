import 'package:either_dart/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class IMoviesDataSource {
  Future<Either<BaseFailure, List<MovieEntity>>> getMoviesListEntity();

  Future<Either<BaseFailure, MovieEntity>> getMovieEntity();
}
