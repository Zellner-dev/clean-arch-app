import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_clean_arch/app_modules.dart';
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_arch/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import 'modules/search/external/datasources/github_datasource_test.mocks.dart';
import 'modules/utils/github_response.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
main() {

  final dio = MockDio();

  setUp(() {
    initModule(AppModules(), replaceBinds: [
      Bind<Dio>((i) => dio),
    ]);
  });
  
  test("Deve recuperar o usecase sem erro.", () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test("Deve trazer uma lista do tipo ResultSeach.", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult),statusCode: 200, requestOptions: RequestOptions()));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase.call("zellner");

    expect(result.fold(dartz.id, dartz.id), isA<List<ResultSearch>>());
  });
}