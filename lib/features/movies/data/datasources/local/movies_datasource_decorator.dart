import 'package:either_dart/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';

class GetMoviesDataSourceDecorator implements IMoviesDataSource {
  final IMoviesDataSource _getMoviesDataSource;

  GetMoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<BaseFailure, MovieEntity>> getMovieEntity() => _getMoviesDataSource.getMovieEntity();

  @override
  Future<Either<BaseFailure, List<MovieEntity>>> getMoviesListEntity() => _getMoviesDataSource.getMoviesListEntity();
}
