import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterando_clean_arch/modules/search/domain/errors/erros.dart';
import 'package:flutterando_clean_arch/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByTextUsecase {
  Future<Either<FailureSearch,List<ResultSearch>>> call(String seachText);
}

class SearchByTextImpl implements SearchByTextUsecase {

  final SearchRepository repository;

  SearchByTextImpl({
    required this.repository
  });
  
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String? seachText) async {
    if(seachText == "" || seachText == null){
      return Left(InvalidTextError());
    }
    return repository.search(seachText);
  }
}