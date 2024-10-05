import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/infra/http/dio_http_service_imp.dart';
import 'package:movie_app/core/infra/http/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/data/datasources/local/movies_local_datasource_decorator_imp.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/datasources/remote/movies_remote_datasource_imp.dart';
import 'package:movie_app/features/movies/data/repositories/movie_repository_imp.dart';
import 'package:movie_app/features/movies/data/repositories/movies_repository.dart';
import 'package:movie_app/features/movies/domain/usecases/movie_usecase.dart';
import 'package:movie_app/features/movies/domain/usecases/movies_usecase_imp.dart';
import 'package:movie_app/features/movies/presentations/controllers/movies_controller.dart';
import 'package:movie_app/features/movies/presentations/controllers/search_controller.dart';

class Injection {
  static void init() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: API.baseUrl, headers: API.headers)));

    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp(getIt()));

    // datasources
    getIt.registerLazySingleton<MoviesDataSource>(
        () => MoviesLocalDataSourceDecoratorImp(MoviesRemoteDatasourceImp(getIt())));

    // repositories
    getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImp(getIt()));

    // usecases
    getIt.registerLazySingleton<MoviesUseCase>(() => MoviesUseCaseImp(getIt()));

    // controllers
    getIt.registerLazySingleton<MoviesController>(() => MoviesController(getIt()));
    getIt.registerLazySingleton<SearchMoviesController>(() => SearchMoviesController(getIt()));
  }
}
