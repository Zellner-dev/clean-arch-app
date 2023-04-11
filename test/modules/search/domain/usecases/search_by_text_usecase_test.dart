import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';
import 'package:flutterando_clean_arch/modules/search/domain/repositories/search_repository.dart';
import 'package:flutterando_clean_arch/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_text_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchRepository>()])
void main() {
  final repository = MockSearchRepository();
  final usecase = SearchByTextImpl(repository: repository);

  test("Deve retornar uma lista de ResultSearch.", () async {
    when(repository.search(any)).thenAnswer((_) async => const Right(<ResultSearch>[]));
    final result = await usecase("zellner");

    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });

  test("Deve retornar uma InvalidTextError caso o texto seja inválido.", () async {
    var result = await usecase(null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}