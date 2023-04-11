import 'package:dio/dio.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';
import 'package:flutterando_clean_arch/modules/search/infra/datasource/search_datasource.dart';
import 'package:flutterando_clean_arch/modules/search/infra/models/result_search_model.dart';

extension on String {
  String normalize() {
    return replaceAll(" ", "+");
  }
}

class GithubDatasource implements SearchDatasource {

  final Dio dio;

  GithubDatasource({required this.dio});  

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {

    searchText.normalize();

    final response = await dio.get("https://api.github.com/search/users?q=${searchText.normalize()}");
    
    if(response.statusCode == 200) {
      final list = (response.data["items"] as List).map((e) => ResultSearchModel.fromMap(e)).toList();
      return list;  
    } else {
      throw DatasourceError("Erro na chamada de api.");
    }
  }

}