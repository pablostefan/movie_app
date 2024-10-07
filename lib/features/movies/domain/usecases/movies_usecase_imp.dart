import 'package:either_dart/either.dart';
import 'package:movie_app/core/error/base_failure.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';
import 'package:movie_app/features/movies/domain/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class MoviesUseCaseImp implements MoviesUseCase {
  final MoviesRepository _moviesRepository;

  MoviesUseCaseImp(this._moviesRepository);

  @override
  Future<Either<BaseFailure, TheMovieDbEntity>> getTrendingMovies({required int page}) async {
    return await _moviesRepository.getTrendingMovies(page: page);
  }

  @override
  Future<Either<BaseFailure, TheMovieDbEntity>> getSearchMovies({required int page, required String query}) async {
    return await _moviesRepository.getSearchMovies(page: page, query: query);
  }
}
