import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

abstract class MoviesUseCase {
  Future<Either<Exception, TheMovieDbEntity>> getTrendingMovies({required int page});

  Future<Either<Exception, TheMovieDbEntity>> getSearchMovies({required int page, required String query});
}
