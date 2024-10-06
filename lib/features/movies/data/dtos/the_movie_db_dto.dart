import 'package:movie_app/features/movies/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

extension TheMovieDbDto on TheMovieDbEntity {
  static TheMovieDbEntity fromJson(Map json) {
    return TheMovieDbEntity(
        page: json['page'] as int,
        results: (json['results'] as List).map((e) => MovieDto.fromJson(e as Map)).toList(),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int);
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
