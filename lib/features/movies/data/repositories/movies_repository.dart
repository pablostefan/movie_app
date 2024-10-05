import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

abstract class MoviesRepository {
  Future<Either<Exception, TheMovieDbEntity>> getTrendingMovies({required int page});

  Future<Either<Exception, TheMovieDbEntity>> getSearchMovies({required int page, required String query});
}
