import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

extension MovieDto on MovieEntity {
  static MovieEntity fromJson(Map json) {
    return MovieEntity(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] as String,
        genreIds: (json['genre_ids'] as List).map((e) => e as int).toList(),
        id: json['id'] as int,
        originalLanguage: json['original_language'] as String,
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        popularity: json['popularity'] as double,
        posterPath: json['poster_path'] as String,
        releaseDate: json['release_date'] as String,
        title: json['title'] as String,
        video: json['video'] as bool,
        voteAverage: json['vote_average'] as double,
        voteCount: json['vote_count'] as int);
  }

  Map toJson() {
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
