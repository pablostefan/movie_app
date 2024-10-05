import 'package:either_dart/either.dart';
import 'package:movie_app/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class MoviesUseCaseImp implements MoviesUseCase {
  final MoviesRepository _moviesRepository;

  MoviesUseCaseImp(this._moviesRepository);

  @override
  Future<Either<Exception, List<MovieEntity>>> getTrendingMovies({required int page}) async {
    return await _moviesRepository.getTrendingMovies(page: page);
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getSearchMovies({required int page, required String query}) async {
    return await _moviesRepository.getSearchMovies(page: page, query: query);
  }
}
