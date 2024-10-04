import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieUseCase {
  Future<Either<Exception, MovieEntity>> getMovieEntity();

  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity();
}
