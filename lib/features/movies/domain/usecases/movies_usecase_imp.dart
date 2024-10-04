import 'package:either_dart/src/either.dart';
import 'package:movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';

class MoviesUseCaseImp implements MovieUseCase {
  final MoviesUseCaseImp _moviesRepository;

  MoviesUseCaseImp(this._moviesRepository);

  @override
  Future<Either<Exception, MovieEntity>> getMovieEntity() async {
    return await _moviesRepository.getMovieEntity();
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getMoviesListEntity() async {
    return await _moviesRepository.getMoviesListEntity();
  }
}
