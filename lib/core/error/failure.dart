abstract class BaseFailure {
  final String message;
  final StackTrace? stackTrace;

  BaseFailure({required this.message, this.stackTrace});

  @override
  String toString() => 'Failure: $message';
}

class NoConnectionFailure extends BaseFailure {
  NoConnectionFailure({
    super.message = "No internet connection",
    super.stackTrace,
  });
}

class NetworkFailure extends BaseFailure {
  NetworkFailure({
    super.message = "Network error",
    super.stackTrace,
  });
}

class DataPersistenceFailure extends BaseFailure {
  DataPersistenceFailure({
    super.message = "Data persistence error",
    super.stackTrace,
  });
}

class UnknownFailure extends BaseFailure {
  UnknownFailure({
    super.message = "An unknown error occurred",
    super.stackTrace,
  });
}

class LocalDataSourceFailure extends BaseFailure {
  LocalDataSourceFailure({
    super.message = "Local Data source error",
    super.stackTrace,
  });
}

class DataSourceFailure extends BaseFailure {
  DataSourceFailure({
    super.message = "Remote Data source error",
    super.stackTrace,
  });
}
