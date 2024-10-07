import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

extension TheMovieDbDto on TheMovieDbEntity {
  static TheMovieDbEntity fromJson(Map<String, dynamic>? json) {
    return TheMovieDbEntity(
        page: json?['page'] as int? ?? 0,
        results: List<MovieEntity>.from(json?['results'].map((e) => MovieDto.fromJson(e))),
        totalPages: json?['total_pages'] as int? ?? 0,
        totalResults: json?['total_results'] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults
    };
  }
}
