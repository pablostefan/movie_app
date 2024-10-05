import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesUseCase {
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page});

  Future<Either<Exception, List<MovieEntity>>> getSearchMovies({required int page, required String query});
}
