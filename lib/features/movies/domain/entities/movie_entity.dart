class MovieEntity {
  final double averageRating;
  final String backdropPath;
  final String description;
  final int id;
  final String iso_3166_1;
  final String iso_639_1;
  final String name;
  final int page;
  final String posterPath;
  final bool public;
  final int revenue;
  final int runtime;
  final String sortBy;
  final int totalPages;
  final int totalResults;

  MovieEntity({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });
}
