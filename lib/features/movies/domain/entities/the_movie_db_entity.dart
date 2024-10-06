import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class TheMovieDbEntity {
  int page;
  int totalPages;
  int totalResults;
  List<MovieEntity> results;

  TheMovieDbEntity({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  TheMovieDbEntity.empty()
      : page = 0,
        totalPages = 0,
        totalResults = 0,
        results = [];
}
