class ServerException implements Exception {
  final int statusCode;
  final String statusMessage;
  final String dataMessage;

  ServerException({
    required this.statusCode,
    required this.statusMessage,
    required this.dataMessage,
  });
}

class NoConnectionException implements Exception {}

class DataPersistenceException implements Exception {}
