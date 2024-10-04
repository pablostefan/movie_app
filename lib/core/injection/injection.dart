import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/data/repositories/movie_repository_imp.dart';
import 'package:movie_app/features/movies/domain/repository/movie_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<MovieRepository>(MovieRepositoryImp(getIt()));
}
