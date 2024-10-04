import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/repository/movie_repository.dart';

class MovieRepositoryImp extends MovieRepository {
  final MoviesDataSource _moviesDataSource;

  MovieRepositoryImp(this._moviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> getMovieEntity() async {
    return await _moviesDataSource.getMovieEntity();
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity() async {
    return await _moviesDataSource.getMoviesListEntity();
  }
}
