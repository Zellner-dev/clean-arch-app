import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_clean_arch/modules/search/domain/usecases/search_by_text_usecase.dart';
import 'package:flutterando_clean_arch/modules/search/external/datasources/github_datasource.dart';
import 'package:flutterando_clean_arch/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutterando_clean_arch/modules/search/presenter/result_provider.dart';
import 'package:flutterando_clean_arch/modules/search/presenter/search_page.dart';
class AppModules extends Module {

  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => GithubDatasource(dio: i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => SearchByTextImpl(repository: i())),
    Bind((i) => ResultSearchProvider(usecase: i()))
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child: (context, args) => const SearchPage())
  ];

}