import 'package:dio/dio.dart';

class ServerException implements Exception {
  final int statusCode;
  final String statusMessage;
  final String dataMessage;

  ServerException({
    required this.statusCode,
    required this.statusMessage,
    required this.dataMessage,
  });

  factory ServerException.dio(DioException e) {
    return ServerException(
        statusCode: e.response?.statusCode ?? 0,
        statusMessage: e.response?.statusMessage ?? '',
        dataMessage: e.response?.data['message'] ?? '');
  }
}
