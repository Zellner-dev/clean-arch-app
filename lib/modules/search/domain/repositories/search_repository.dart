import 'package:dartz/dartz.dart';
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String seachText);
}