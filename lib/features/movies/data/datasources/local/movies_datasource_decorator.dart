import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

class MoviesDataSourceDecorator implements MoviesDataSource {
  final MoviesDataSource _getMoviesDataSource;

  MoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<TheMovieDbEntity> getTrendingMovies({required int page}) {
    return _getMoviesDataSource.getTrendingMovies(page: page);
  }

  @override
  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query}) {
    return _getMoviesDataSource.getSearchMovies(page: page, query: query);
  }
}
