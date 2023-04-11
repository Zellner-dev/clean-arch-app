import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';
import 'package:flutterando_clean_arch/modules/search/external/datasources/github_datasource.dart';
import '../../../utils/github_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {

  final dio = MockDio();

  final datasource = GithubDatasource(dio: dio);

  test("Deve retornar uma lista de ResultSearchModel.", () async {
    when(dio.get(any)).thenAnswer((_) async => 
        Response(data: jsonDecode(githubResult), statusCode: 200, requestOptions: RequestOptions()));
    
    final result = await datasource.getSearch("searchText");
    expect(result, completes);
  });

  test("Deve retornar um DatasourceError se o status code não for 200.", () async {
    when(dio.get(any)).thenAnswer((_) async => 
        Response(data: null, statusCode: 401, requestOptions: RequestOptions()));

    final result = datasource.getSearch("searchText");
    expect(result, throwsA(isA<DatasourceError>()));
  });
}