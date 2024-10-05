import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

abstract class MoviesDataSource {
  Future<TheMovieDbEntity> getTrendingMovies({required int page});

  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query});
}
