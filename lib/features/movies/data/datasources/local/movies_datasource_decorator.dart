import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class MoviesDataSourceDecorator extends MoviesDataSource {
  final MoviesDataSource _getMoviesDataSource;

  MoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> getMovieEntity() => _getMoviesDataSource.getMovieEntity();

  @override
  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity() => _getMoviesDataSource.getMoviesListEntity();
}
