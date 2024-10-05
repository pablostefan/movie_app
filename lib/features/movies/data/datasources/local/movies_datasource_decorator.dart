import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesDataSourceDecorator implements MoviesDataSource {
  final MoviesDataSource _getMoviesDataSource;

  MoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page}) {
    return _getMoviesDataSource.getTrendingMovies(page: page);
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getSearchMovies({required int page, required String query}) {
    return _getMoviesDataSource.getSearchMovies(page: page, query: query);
  }
}
