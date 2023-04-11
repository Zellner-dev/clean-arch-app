// Mocks generated by Mockito 5.4.0 from annotations
// in flutterando_clean_arch/test/modules/search/domain/usecases/search_by_text_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart'
    as _i6;
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart'
    as _i5;
import 'package:flutterando_clean_arch/modules/search/domain/repositories/search_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SearchRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRepository extends _i1.Mock implements _i3.SearchRepository {
  @override
  _i4.Future<_i2.Either<_i5.FailureSearch, List<_i6.ResultSearch>>> search(
          String? seachText) =>
      (super.noSuchMethod(
        Invocation.method(
          #search,
          [seachText],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.FailureSearch, List<_i6.ResultSearch>>>.value(
            _FakeEither_0<_i5.FailureSearch, List<_i6.ResultSearch>>(
          this,
          Invocation.method(
            #search,
            [seachText],
          ),
        )),
        returnValueForMissingStub: _i4.Future<
                _i2.Either<_i5.FailureSearch, List<_i6.ResultSearch>>>.value(
            _FakeEither_0<_i5.FailureSearch, List<_i6.ResultSearch>>(
          this,
          Invocation.method(
            #search,
            [seachText],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.FailureSearch, List<_i6.ResultSearch>>>);
}