import 'package:dio/dio.dart';

abstract class BaseFailure {
  final String message;
  final StackTrace? stackTrace;

  const BaseFailure({required this.message, this.stackTrace});

  @override
  String toString() {
    return 'Failure: $message${stackTrace != null ? '\nStackTrace: $stackTrace' : ''}';
  }
}

class NetworkFailure extends BaseFailure {
  final int? statusCode;
  final String? statusMessage;
  final String? dataMessage;

  NetworkFailure({
    required super.message,
    super.stackTrace,
    this.statusCode,
    this.statusMessage,
    this.dataMessage,
  });

  /// Factory constructor to create a [NetworkFailure] from a [DioException].
  factory NetworkFailure.fromDioException(DioException e) {
    return NetworkFailure(
        message: e.message ?? 'No message',
        statusCode: e.response?.statusCode,
        statusMessage: e.response?.statusMessage,
        dataMessage: e.response?.data['message'] ?? 'No data message',
        stackTrace: e.stackTrace);
  }

  @override
  String toString() {
    return 'NetworkFailure: $message'
        '${statusCode != null ? ' (StatusCode: $statusCode)' : ''}'
        '${statusMessage != null ? ' (StatusMessage: $statusMessage)' : ''}'
        '${dataMessage != null ? ' (DataMessage: $dataMessage)' : ''}'
        '${stackTrace != null ? '\nStackTrace: $stackTrace' : ''}';
  }
}

class CacheDataFailure extends BaseFailure {
  CacheDataFailure({super.stackTrace}) : super(message: 'Cache error');
}

class RemoteDataFailure extends BaseFailure {
  RemoteDataFailure({super.stackTrace}) : super(message: 'Remote data error');
}

class ExceptionFailure extends BaseFailure {
  ExceptionFailure({super.stackTrace}) : super(message: 'An unknown error occurred');
}
