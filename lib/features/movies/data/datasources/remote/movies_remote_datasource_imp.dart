import 'package:movie_app/core/infra/http/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart';
import 'package:movie_app/features/movies/data/dtos/the_movie_db_dto.dart';
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart';

class MoviesRemoteDatasourceImp extends MoviesDataSource {
  final HttpService _httpService;

  MoviesRemoteDatasourceImp(this._httpService);

  @override
  Future<TheMovieDbEntity> getSearchMovies({required int page, required String query}) async {
    try {
      var queryParameters = {'language': 'pt-BR', 'query': query};
      var result = await _httpService.get(API.searchMovies, queryParameters: queryParameters);
      return TheMovieDbDto.fromJson(result.data);
    } catch (e) {
      throw Exception('Falha no remote datasource');
    }
  }

  @override
  Future<TheMovieDbEntity> getTrendingMovies({required int page}) async {
    try {
      var queryParameters = {'language': 'pt-BR'};
      var result = await _httpService.get(API.trendingMovies, queryParameters: queryParameters);
      return TheMovieDbDto.fromJson(result.data);
    } catch (e) {
      throw Exception('Falha no remote datasource');
    }
  }
}
