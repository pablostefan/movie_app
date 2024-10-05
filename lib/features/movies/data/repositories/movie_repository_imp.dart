import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/data/repositories/movies_repository.dart';

class MoviesRepositoryImp extends MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepositoryImp(this._moviesDataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page}) async {
    return await _moviesDataSource.getTrendingMovies(page: page);
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getSearchMovies({required int page, required String query}) async {
    return await _moviesDataSource.getSearchMovies(page: page, query: query);
  }
}
