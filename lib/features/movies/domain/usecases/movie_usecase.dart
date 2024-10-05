import 'package:either_dart/either.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

abstract class MoviesUseCase {
  Future<Either<BaseFailure, TheMovieDbEntity>> getTrendingMovies({required int page});

  Future<Either<BaseFailure, TheMovieDbEntity>> getSearchMovies({required int page, required String query});
}
