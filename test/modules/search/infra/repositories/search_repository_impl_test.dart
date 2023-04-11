import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';
import 'package:flutterando_clean_arch/modules/search/infra/datasource/search_datasource.dart';
import 'package:flutterando_clean_arch/modules/search/infra/models/result_search_model.dart';
import 'package:flutterando_clean_arch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchDatasource>()])
void main() {

  final datasource = MockSearchDatasource();
  final repository = SearchRepositoryImpl(datasource);

  test("Deve retornar uma lista de ResultSearch.", () async {
    when(datasource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search("zellner");

    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });

  test("Deve retornar um DatasourceError se o datasource falhar.", () async {
    when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("zellner");

    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });
}