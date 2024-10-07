import 'package:either_dart/either.dart';
import 'package:movie_app/core/base_repository.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImp extends BaseRepository implements MoviesRepository {
  final MoviesDataSource _moviesDataSource;

  MoviesRepositoryImp(this._moviesDataSource);

  @override
  Future<Either<BaseFailure, TheMovieDbEntity>> getTrendingMovies({required int page}) async {
    return tryExecute<TheMovieDbEntity>(() async => await _moviesDataSource.getTrendingMovies(page: page));
  }

  @override
  Future<Either<BaseFailure, TheMovieDbEntity>> getSearchMovies({required int page, required String query}) async {
    return tryExecute<TheMovieDbEntity>(() async => await _moviesDataSource.getSearchMovies(page: page, query: query));
  }
}
