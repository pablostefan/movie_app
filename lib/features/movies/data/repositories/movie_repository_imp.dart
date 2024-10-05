import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

class MoviesRepositoryImp extends MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepositoryImp(this._moviesDataSource);

  @override
  Future<Either<Exception, TheMovieDbEntity>> getTrendingMovies({required int page}) async {
    return await _moviesDataSource.getTrendingMovies(page: page);
  }

  @override
  Future<Either<Exception, TheMovieDbEntity>> getSearchMovies({required int page, required String query}) async {
    return await _moviesDataSource.getSearchMovies(page: page, query: query);
  }
}
