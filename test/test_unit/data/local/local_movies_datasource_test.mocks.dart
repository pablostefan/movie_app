// Mocks generated by Mockito 5.4.4 from annotations
// in movie_app/test/test_unit/data/local/local_movies_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/core/infra/local_storage/local_storage_service.dart' as _i3;
import 'package:movie_app/features/movies/data/datasources/movies_datasource.dart' as _i5;
import 'package:movie_app/features/movies/domain/entities/the_movie_db_entity.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTheMovieDbEntity_0 extends _i1.SmartFake implements _i2.TheMovieDbEntity {
  _FakeTheMovieDbEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock implements _i3.LocalStorageService {
  MockLocalStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<Map<String, dynamic>?> getData(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getData,
          [key],
        ),
        returnValue: _i4.Future<Map<String, dynamic>?>.value(),
      ) as _i4.Future<Map<String, dynamic>?>);

  @override
  _i4.Future<String?> getString(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getString,
          [key],
        ),
        returnValue: _i4.Future<String?>.value(),
      ) as _i4.Future<String?>);

  @override
  _i4.Future<bool> putData(
    String? key,
    Map<String, dynamic>? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putData,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> putString(
    String? key,
    String? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putString,
          [
            key,
            value,
          ],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [MoviesDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesDataSource extends _i1.Mock implements _i5.MoviesDataSource {
  MockMoviesDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.TheMovieDbEntity> getTrendingMovies({required int? page}) => (super.noSuchMethod(
        Invocation.method(
          #getTrendingMovies,
          [],
          {#page: page},
        ),
        returnValue: _i4.Future<_i2.TheMovieDbEntity>.value(_FakeTheMovieDbEntity_0(
          this,
          Invocation.method(
            #getTrendingMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i4.Future<_i2.TheMovieDbEntity>);

  @override
  _i4.Future<_i2.TheMovieDbEntity> getSearchMovies({
    required int? page,
    required String? query,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchMovies,
          [],
          {
            #page: page,
            #query: query,
          },
        ),
        returnValue: _i4.Future<_i2.TheMovieDbEntity>.value(_FakeTheMovieDbEntity_0(
          this,
          Invocation.method(
            #getSearchMovies,
            [],
            {
              #page: page,
              #query: query,
            },
          ),
        )),
      ) as _i4.Future<_i2.TheMovieDbEntity>);
}
