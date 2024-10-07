import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

extension MovieDto on MovieEntity {
  static MovieEntity fromJson(Map<String, dynamic>? json) {
    return MovieEntity(
        adult: json?['adult'] as bool? ?? false,
        backdropPath: json?['backdrop_path'] as String? ?? "",
        genreIds: List<int>.from(json?['genre_ids'].map((e) => e as int)),
        id: json?['id'] as int? ?? 0,
        originalLanguage: json?['original_language'] as String? ?? "",
        originalTitle: json?['original_title'] as String? ?? "",
        overview: json?['overview'] as String? ?? "",
        popularity: json?['popularity'] as double? ?? 0.0,
        posterPath: json?['poster_path'] as String? ?? "",
        releaseDate: json?['release_date'] as String? ?? "",
        title: json?['title'] as String? ?? "",
        video: json?['video'] as bool? ?? false,
        voteAverage: json?['vote_average'] as double? ?? 0.0,
        voteCount: json?['vote_count'] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount
    };
  }
}
