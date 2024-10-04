import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';

abstract class BaseRepository {
  Future<Either<BaseFailure, E>> tryExecute<E>(Future<E> Function() exec) async {
    try {
      return Right(await exec.call());
    } on DataPersistenceException catch (e, stackTrace) {
      _logErrorResponse(Left(DataPersistenceFailure(stackTrace: stackTrace)));
      return Left(DataPersistenceFailure(stackTrace: stackTrace));
    } on Exception catch (e, stackTrace) {
      debugPrint('[ERROR RESPONSE REPOSITORY]: $e');
      return Left(UnknownFailure(stackTrace: stackTrace));
    }
  }

  void _logErrorResponse(Left response) {
    debugPrint('[ERROR RESPONSE REPOSITORY]: ${response.value.message}');
  }
}
