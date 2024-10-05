import 'package:dio/dio.dart';
import 'package:movie_app/core/infra/http/http_service.dart';

class DioHttpServiceImp implements HttpService {
  final Dio _dio;

  DioHttpServiceImp(this._dio);

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }
}
